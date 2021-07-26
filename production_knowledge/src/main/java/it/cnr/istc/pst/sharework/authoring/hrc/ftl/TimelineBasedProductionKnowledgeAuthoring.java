package it.cnr.istc.pst.sharework.authoring.hrc.ftl;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import it.cnr.istc.pst.platinum.ai.framework.domain.PlanDataBaseBuilder;
import it.cnr.istc.pst.platinum.ai.framework.domain.component.PlanDataBase;
import it.cnr.istc.pst.sharework.authoring.ex.ProductionKnowledgeAuthoringException;
import it.cnr.istc.pst.sharework.authoring.hrc.HRCTask;
import it.cnr.istc.pst.sharework.authoring.hrc.HRCModel;
import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledgeDictionary;
import it.cnr.istc.pst.sharework.authoring.ProductionKnowledgeAuthoring;
import it.cnr.istc.pst.sharework.knowledge.ex.ProductionKnowledgeException;
import org.apache.commons.logging.Log;
import org.apache.jena.rdf.model.Property;
import org.apache.jena.rdf.model.Resource;
import org.apache.jena.rdf.model.Statement;
import org.bson.Document;

import java.io.*;
import java.util.*;

/**
 *
 */
public class TimelineBasedProductionKnowledgeAuthoring extends ProductionKnowledgeAuthoring {

    private int numberOfVariables;                      // number of generated variables
    private int numberOfPredicates;                     // number of generated predicates
    private int numberOfSynchronizations;               // number of generated synchronizations
    private int numberOfConstraints;                    // number of generated constraints
    private long time;                                  // model generation time (in milliseconds)


    private HRCModel hrc;                               // HRC model generated after compilation

    private String ddlPath;                             // set DDL file path
    private String pdlPath;                             // set PDL file path
    private long horizon;                               // plan horizon

    private static final String PROPERTY_KEY_HORIZON = "horizon";
    private static final String PROPERTY_KEY_MONGODB_HOST = "mongodb_host";
    private static final String PROPERTY_KEY_MONGODB_NAME = "mongodb_name";
    private static final String PROPERTY_KEY_MONGODB_COLLECTION_TASK_PROPERTIES = "mongodb_collection_task_properties";
    private static final String PROPERTY_KEY_MONGODB_COLLECTION_TASK_DURATIONS = "mongodb_collection_task_durations";
    private static final String PROPERTY_KEY_MONGODB_COLLECTION_RISK_MATRIX = "mongodb_collection_risk_matrix";
    private Map<String, String> prop2value;

    /**
     *
     */
    public TimelineBasedProductionKnowledgeAuthoring() {
        super();
        this.setup();
    }

    /**
     *
     */
    public TimelineBasedProductionKnowledgeAuthoring(Log log) {
        super(log);
        this.setup();
    }

    /**
     *
     * @param pdlPath
     */
    public TimelineBasedProductionKnowledgeAuthoring(String pdlPath) {
        super();
        this.setup();
        this.pdlPath = pdlPath;
    }

    /**
     *
     */
    private void setup() {
        // index properties
        this.prop2value = new HashMap<>();
        try
        {
            // read dataset property
            Properties properties = new Properties();
            try (InputStream in = new FileInputStream(new File(ProductionKnowledge.SHAREWORK_KNOWLEDGE + "etc/authoring.properties"))) {

                // load property file
                properties.load(in);

                // get property
                String value = properties.getProperty(PROPERTY_KEY_MONGODB_HOST);
                if (value == null) {
                    throw new RuntimeException("Missing specification for property \"" + PROPERTY_KEY_MONGODB_HOST + "\":\n" +
                            "- property-file: " + ProductionKnowledge.SHAREWORK_KNOWLEDGE + "etc/dataset.properties\n");
                }

                // set property
                this.prop2value.put(PROPERTY_KEY_MONGODB_HOST, value);

                // get property
                value = properties.getProperty(PROPERTY_KEY_MONGODB_NAME);
                if (value == null) {
                    throw new RuntimeException("Missing specification for property \"" + PROPERTY_KEY_MONGODB_NAME + "\":\n" +
                            "- property-file: " + ProductionKnowledge.SHAREWORK_KNOWLEDGE + "etc/dataset.properties\n");
                }

                // set property
                this.prop2value.put(PROPERTY_KEY_MONGODB_NAME, value);

                // get property
                value = properties.getProperty(PROPERTY_KEY_MONGODB_COLLECTION_TASK_PROPERTIES);
                if (value == null) {
                    throw new RuntimeException("Missing specification for property \"" + PROPERTY_KEY_MONGODB_COLLECTION_TASK_PROPERTIES + "\":\n" +
                            "- property-file: " + ProductionKnowledge.SHAREWORK_KNOWLEDGE + "etc/dataset.properties\n");
                }

                // set property
                this.prop2value.put(PROPERTY_KEY_MONGODB_COLLECTION_TASK_PROPERTIES, value);

                // get property
                value = properties.getProperty(PROPERTY_KEY_MONGODB_COLLECTION_TASK_DURATIONS);
                if (value == null) {
                    throw new RuntimeException("Missing specification for property \"" + PROPERTY_KEY_MONGODB_COLLECTION_TASK_DURATIONS + "\":\n" +
                            "- property-file: " + ProductionKnowledge.SHAREWORK_KNOWLEDGE + "etc/dataset.properties\n");
                }

                // set property
                this.prop2value.put(PROPERTY_KEY_MONGODB_COLLECTION_TASK_DURATIONS, value);


                // get property
                value = properties.getProperty(PROPERTY_KEY_MONGODB_COLLECTION_RISK_MATRIX);
                if (value == null) {
                    throw new RuntimeException("Missing specification for property \"" + PROPERTY_KEY_MONGODB_COLLECTION_RISK_MATRIX + "\":\n" +
                            "- property-file: " + ProductionKnowledge.SHAREWORK_KNOWLEDGE + "etc/dataset.properties\n");
                }

                // set property
                this.prop2value.put(PROPERTY_KEY_MONGODB_COLLECTION_RISK_MATRIX, value);

                value = properties.getProperty(PROPERTY_KEY_HORIZON);
                if (value == null) {
                    throw new RuntimeException("Missing specification for property \"" + PROPERTY_KEY_HORIZON + "\":\n" +
                            "- property-file: " + ProductionKnowledge.SHAREWORK_KNOWLEDGE + "etc/dataset.properties\n");
                }

                // set plan horizon
                this.horizon = Long.parseLong(value);
            }
        }
        catch (IOException ex) {
            throw new RuntimeException(ex.getMessage());
        }
    }

    /**
     *
     * @return
     */
    public int getNumberOfConstraints() {
        return numberOfConstraints;
    }

    /**
     *
     * @return
     */
    public int getNumberOfPredicates() {
        return numberOfPredicates;
    }

    /**
     *
     * @return
     */
    public int getNumberOfSynchronizations() {
        return numberOfSynchronizations;
    }

    /**
     *
     * @return
     */
    public int getNumberOfVariables() {
        return numberOfVariables;
    }

    /**
     *
     * @return
     */
    public long getTime() {
        return time;
    }

    /**
     *
     * @return
     * @throws InterruptedException
     * @throws ProductionKnowledgeAuthoringException
     */
    @Override
    protected synchronized String doCompile()
            throws InterruptedException, ProductionKnowledgeAuthoringException
    {
        // set DDL
        String ddl = null;
        // prepare a new HRC model
        this.hrc = new HRCModel(this.horizon);

        // get start
        long start = System.currentTimeMillis();
        // set statistic data
        this.numberOfVariables = 0;
        this.numberOfPredicates = 0;
        this.numberOfConstraints = 0;
        this.numberOfSynchronizations = 0;
        this.time = 0;

        try {

            // map resource values to components
            Map<Resource, String> vIndex = new HashMap<>();
            // prepare domain description
            ddl = "DOMAIN KNOWLEDGE_PRODUCTION_AUTHORING_GEN {\n\n" +
                    "\tTEMPORAL_MODULE temporal_module = [0, " + this.horizon + "], 100;\n\n";

            // get production goals
            List<Resource> goals = this.knowledge.getProductionGoals();
            // index goals
            for (Resource goal : goals) {
                vIndex.put(goal, "Goal.goals");
            }

            // add SV description
            ddl += this.sv("GoalVariableType", goals, false);
            // prepare also component declaration
            String comps = "\tCOMPONENT Goal {FLEXIBLE goals(functional)} : GoalVariableType;\n";


            // get workers
            List<Resource> workers = this.knowledge.getWorkOperators();
            // exactly one worker expected
            if (workers.isEmpty()) {
                throw new ProductionKnowledgeAuthoringException("No individual of SOHO:WorkOperator found into the Knowledge Base!");
            }


            // get functions
            List<Resource> hFuncs = this.knowledge.getFunctionsByAgent(workers.get(0));
            // index functions
            for (Resource func : hFuncs) {
                // index function
                vIndex.put(func, "Worker.operations");

                // get function type
                Resource funcType = this.knowledge.getResourceType(func);
                // create human function into the model
                HRCTask task = this.hrc.createHumanTask(func, funcType);
                // retrieve knowledge about the function
                this.doRetrieveHRCTaskKnowledge(func, task);
            }

            // add SV description
            ddl += this.sv("WorkerVariableType", hFuncs, true);
            // create also component declaration
            comps += "\tCOMPONENT Worker {FLEXIBLE operations(primitive)} :  WorkerVariableType;\n";

            // get cobots
            List<Resource> cobots = this.knowledge.getCobots();
            // exactly one robot expected
            if (cobots.isEmpty()) {
                throw new ProductionKnowledgeAuthoringException("No individual of SOHO:Cobot found into the Knowledge Base!");
            }

            // get functions
            List<Resource> rFuncs = this.knowledge.getFunctionsByAgent(cobots.get(0));
            // index functions
            for (Resource func : rFuncs) {
                vIndex.put(func, "Cobot.tasks");

                // get function type
                Resource funcType = this.knowledge.getResourceType(func);
                // create human function into the model
                HRCTask task = this.hrc.createRobotTask(func, funcType);
                // retrieve knowledge about the function
                this.doRetrieveHRCTaskKnowledge(func, task);
            }

            // add SV description
            ddl += this.sv("CobotVariableType", rFuncs, true);
            // create also component declaration
            comps += "\tCOMPONENT Cobot {FLEXIBLE tasks(primitive)} : CobotVariableType;\n";


            // get hierarchy
            List<List<Resource>> hierarchy = this.knowledge.getProductionHierarchy(goals.get(0));
            // create a SV for each hierarchical level
            for (int index = 0; index < hierarchy.size(); index++) {
                // get values
                List<Resource> values = hierarchy.get(index);

                // index tasks
                for (Resource val : values) {
                    vIndex.put(val, "ProductionL" + index + ".tasks_l" + index);
                }

                // get production values
                ddl += this.sv("ProductionHierarchyL" + index + "Type", values, false);
                // create also component declaration
                comps += "\tCOMPONENT ProductionL" + index + " {FLEXIBLE tasks_l" + index + "(primitive)} : ProductionHierarchyL" + index + "Type;\n";
            }

            // add component declaration
            ddl += "\n" + comps + "\n";

            // add synchronization description
            ddl += this.synchronizations(vIndex);

            // close domain description
            ddl += "\n}\n\n";

            // get compilation time
            this.time = System.currentTimeMillis() - start;
        }
        catch (ProductionKnowledgeException ex) {
            throw new ProductionKnowledgeAuthoringException(ex.getMessage());
        }


        // get domain description
        return ddl;
    }

    /**
     *
     * @param function
     * @param task
     * @throws InterruptedException
     * @throws ProductionKnowledgeException
     */
    private void doRetrieveHRCTaskKnowledge(Resource function, HRCTask task)
            throws InterruptedException, ProductionKnowledgeException {

        // retrieve data properties
        List<Statement> stats = this.knowledge.getFunctionDataProperties(function);
        for (Statement stat : stats) {

            // check function name
            Property prop = stat.getPredicate();
            // check function (unique) name
            if (prop.getURI().equals(ProductionKnowledgeDictionary.SOHO_NS + "hasProcedureName")) {
                // get function name
                String name = stat.getObject().asLiteral().getString();
                // set name
                task.setName(name);
            }

            // check function goal
            if (prop.getURI().equals(ProductionKnowledgeDictionary.SOHO_NS + "hasGoal")) {
                // get function goal
                String goal = stat.getObject().asLiteral().getString();
                // set goal
                task.setGoal(goal);
            }

            // check function duration
            if (prop.getURI().equals(ProductionKnowledgeDictionary.SOHO_NS + "hasDuration")) {
                // get function duration
                long duration = stat.getObject().asLiteral().getLong();
                // set duration
                task.setDuration(duration);
            }

            // check function uncertainty
            if (prop.getURI().equals(ProductionKnowledgeDictionary.SOHO_NS + "hasDurationUncertainty")) {
                // get function uncertainty
                long uncertainty = stat.getObject().asLiteral().getLong();
                // set uncertainty
                task.setUncertainty(uncertainty);
            }
        }

        // get target
        Resource target = this.knowledge.getFunctionTarget(function);
        // set target
        task.setTarget(target);
    }

    /**
     *
     */
    public void export() {

        // create mongo client
        try (MongoClient client = MongoClients.create(this.prop2value.get(PROPERTY_KEY_MONGODB_HOST))) {

            // get DB
            MongoDatabase db = client.getDatabase(this.prop2value.get(PROPERTY_KEY_MONGODB_NAME));
            // get collection concerning task properties
            MongoCollection<Document> taskProperties = db.getCollection(this.prop2value.get(PROPERTY_KEY_MONGODB_COLLECTION_TASK_PROPERTIES));
            // clear collection before entering data
            taskProperties.drop();

            // index HRC functions
            Map<String, Set<HRCTask>> index = new HashMap<>();
            // get human functions (i.e., primitive tasks)
            for (HRCTask task : this.hrc.getHumanTasks()) {
                // check task name
                if (!index.containsKey(task.getName())) {
                    // set index
                    index.put(task.getName(), new HashSet<HRCTask>());
                }

                // add entry
                index.get(task.getName()).add(task);
            }

            // get robot functions (i.e., primitive tasks)
            for (HRCTask task : this.hrc.getRobotTasks()) {
                // check task name
                if (!index.containsKey(task.getName())) {
                    // set index
                    index.put(task.getName(), new HashSet<HRCTask>());
                }

                // add entry
                index.get(task.getName()).add(task);
            }


            // check index
            for (String taskName : index.keySet()) {

                // get associated functions
                Set<HRCTask> tasks = index.get(taskName);

                // create document to insert
                Document doc = new Document();
                // set task name
                doc.append("name", taskName);
                // set task type
                Resource type = tasks.stream().findFirst().get().getType();;
                doc.append("type", type.getLocalName() == null ? type.asNode().getBlankNodeLabel() : type.getLocalName());
                // set task target
                Resource target = tasks.stream().findFirst().get().getTarget();
                doc.append("target", target.getLocalName() == null ? target.asNode().getBlankNodeLabel() : target.getLocalName());
                // set goal
                doc.append("goal", tasks.stream().findFirst().get().getGoal());
                // set description
                doc.append("description", tasks.stream().findFirst().get().getDescription());

                // set agents
                List<String> agents = new ArrayList<>();
                for (HRCTask task : tasks) {
                    agents.add(task.getAgent());
                }

                // add agent field with the array of agents that can perform the procedure
                doc.append("agent", agents);

                // insert document into the collection
                taskProperties.insertOne(doc);
            }

            // get collection concerning task duration
            MongoCollection<Document> taskDurations = db.getCollection(this.prop2value.get(PROPERTY_KEY_MONGODB_COLLECTION_TASK_DURATIONS));
            // clear collection before entering data
            taskDurations.drop();

            // check task index
            for (String taskName : index.keySet())
            {
                // get associated tasks
                Set<HRCTask> tasks = index.get(taskName);

                // create document to insert
                Document doc = new Document();
                // set task name
                doc.append("name", taskName);
                // add duration and uncertainty data for each "agent" task
                for (HRCTask task : tasks) {
                    // add agent related property of the task
                    doc.append(task.getAgent().toLowerCase() + "_duration", task.getAverageDuration());
                    doc.append(task.getAgent().toLowerCase() + "_uncertainty", task.getUncertainty());
                    doc.append(task.getAgent().toLowerCase() + "_success_rate", task.getSuccessRate());
                }

                // insert document
                taskDurations.insertOne(doc);

            }

            // get collection concerning task duration
            MongoCollection<Document> dynamicRisk = db.getCollection(this.prop2value.get(PROPERTY_KEY_MONGODB_COLLECTION_RISK_MATRIX));
            // clear collection before entering data
            dynamicRisk.drop();


            // iterate over human and robot tasks
            for (HRCTask hTask : this.hrc.getHumanTasks())
            {
                for (HRCTask rTask : this.hrc.getRobotTasks())
                {
                    // check task names
                    if (!hTask.getName().equals(rTask.getName())) {
                        // create document
                        Document doc = new Document();
                        // add field
                        doc.append(hTask.getAgent().toLowerCase() + "_task", hTask.getName());
                        doc.append(rTask.getAgent().toLowerCase() + "_task", rTask.getName());
                        doc.append("dynamic_risk", 1);      // set default dynamic risk

                        // insert document
                        dynamicRisk.insertOne(doc);
                    }
                }
            }
        }
    }

    /**
     *
     */
    @Override
    protected void prepare() {

        try {

            // export knowledge to data-sets
            this.export();

            // write agent configuration properties
            File ddlFile = new File(ProductionKnowledge.SHAREWORK_KNOWLEDGE + "gen/agent.properties");
            try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(ddlFile), "UTF-8"))) {
                // print model file path
                writer.write("model=" + this.ddlPath + "\n");
                // print other configuration data
                writer.write("display_plan=0\n");
                // set default task planner configuration
                writer.write("planner=com.github.sharework_taskplanner.taskplanner.ShareworkPlanner\n");
                writer.write("executive=com.github.sharework_taskplanner.taskplanner.ShareworkExecutive\n");
                writer.write("platform=com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.RosJavaPlatformProxy\n");
                // set default platform XML document
                writer.write("platform_config_file=" + ProductionKnowledge.SHAREWORK_KNOWLEDGE + "gen/platform.xml\n");
            }
        }
        catch (IOException ex) {
            System.err.println(ex.getMessage());
        }
    }

    /**
     *
     * @return
     * @throws ProductionKnowledgeAuthoringException
     */
    public PlanDataBase pdb()
            throws ProductionKnowledgeAuthoringException
    {
        // check if DDL file exists
        if (this.ddlPath == null) {
            throw new ProductionKnowledgeAuthoringException("No validation of the production knowledge has been done!");
        }

        PlanDataBase pdb = null;
        try
        {
            // check PDL
            if (this.pdlPath == null) {
                // validate the PDB
                pdb = PlanDataBaseBuilder.createAndSet(this.ddlPath);
            }
            else {
                // validate the PDB
                pdb = PlanDataBaseBuilder.createAndSet(
                        this.ddlPath,
                        this.pdlPath);
            }
        }
        catch (Exception ex) {
            throw new ProductionKnowledgeAuthoringException("Error while validating the generated model:\n" +
                    "- DDL file: " + ProductionKnowledge.SHAREWORK_KNOWLEDGE + "gen/prod_knowledge.ddl" + "\n" +
                    "- message: " + ex.getMessage() + "\n");
        }

        // get the PDB
        return pdb;
    }

    /**
     *
     * @param model
     * @return
     * @throws ProductionKnowledgeAuthoringException
     */
    @Override
    protected synchronized boolean doValidate(String model)
            throws ProductionKnowledgeAuthoringException
    {
        // validity flag
        boolean valid = false;
        // set start time and update authoring time
        long start = System.currentTimeMillis();

        try
        {
            // write DDL file
            File ddlFile = new File(ProductionKnowledge.SHAREWORK_KNOWLEDGE + "gen/prod_knowledge.ddl");
            try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(ddlFile), "UTF-8"))) {
                // write content file
                writer.write(model);
            }


            // check PDL
            if (this.pdlPath == null) {
                // validate the PDB
                PlanDataBaseBuilder.createAndSet(ddlFile.getAbsolutePath());
            }
            else {
                // validate the PDB
                PlanDataBaseBuilder.createAndSet(
                        ddlFile.getAbsolutePath(),
                        this.pdlPath);
            }

            // set DDL file path
            this.ddlPath = ddlFile.getAbsolutePath();
            // set validity flag
            valid = true;
        }
        catch (Exception ex) {
            throw new ProductionKnowledgeAuthoringException("Error while validating the generated model:\n" +
                    "- DDL file: " + ProductionKnowledge.SHAREWORK_KNOWLEDGE + "gen/prod_knowledge.ddl" + "\n" +
                    "- message: " + ex.getMessage() + "\n");
        }
        finally {
            // update authoring time
            this.time += System.currentTimeMillis() - start;
        }

        // get validity flag
        return valid;
    }

    /**
     *
     * @param value2component
     * @return
     * @throws InterruptedException
     * @throws ProductionKnowledgeAuthoringException
     * @throws ProductionKnowledgeException
     */
    private String synchronizations(Map<Resource, String> value2component)
            throws InterruptedException, ProductionKnowledgeAuthoringException, ProductionKnowledgeException
    {
        // map components to synchronization descriptions
        Map<String, String> comp2sync = new HashMap<>();
        // get production goals
        List<Resource> goals = this.knowledge.getProductionGoals();
        for (Resource goal : goals)
        {
            // check if exists
            if (!value2component.containsKey(goal)) {
                throw new ProductionKnowledgeAuthoringException("No component defined for predicate: " + goal.getLocalName() + "()");
            }

            // get goal value names
            String goalName = this.hrc.getHRCTask(goal) == null || this.hrc.getHRCTask(goal).getName() == null ?
                    goal.getLocalName() == null ? goal.asNode().getBlankNodeLabel() : goal.getLocalName() :
                    this.hrc.getHRCTask(goal).getName();



            // first connect goals to root nodes of the decomposition hierarchy
            List<List<Resource>> hierarchy = this.knowledge.getProductionHierarchy(goal);
            // get top-level
            List<Resource> top = hierarchy.get(0);
            // get goal component
            String goalComp = value2component.get(goal);
            // check if synchronization description has been opened
            if (!comp2sync.containsKey(goalComp)) {
                // open synchronization description
                comp2sync.put(goalComp, "\tSYNCHRONIZE " + goalComp + " {\n\n");
            }

            // add goal synchronizations
            for (Resource task : top)
            {
                // check if exists
                if (!value2component.containsKey(task)) {
                    throw new ProductionKnowledgeAuthoringException("No component defined for predicate: " + task.getLocalName() + "()");
                }

                // get task name
                String taskName = this.hrc.getHRCTask(task) == null || this.hrc.getHRCTask(task).getName() == null ?
                        task.getLocalName() == null ? task.asNode().getBlankNodeLabel() : task.getLocalName() :
                        this.hrc.getHRCTask(task).getName();

                // get synchronization body
                String body = comp2sync.get(goalComp);
                // add synchronization constraints
                body += "\t\tVALUE " + goalName+ "() {\n\n" +
                        "\t\t\td0 " + value2component.get(task) + "." + taskName + "();\n" +
                        "\t\t\tCONTAINS [0, +INF] [0, +INF] d0;\n" +
                        "\t\t}\n\n";


                // update description
                comp2sync.put(goalComp, body);
            }

            // get the decomposition graph
            List<Map<Resource, List<Set<Resource>>>> graphs = this.knowledge.getDecompositionGraph(goal);
            // check each possible decomposition - method
            for (Map<Resource, List<Set<Resource>>> graph : graphs)
            {
                // get reference predicates/values
                for (Resource reference : graph.keySet())
                {
                    // check if exists
                    if (!value2component.containsKey(reference)) {
                        throw new ProductionKnowledgeAuthoringException("No component defined for predicate: " + reference.getLocalName() + "()");
                    }

                    // get reference component
                    String refComp = value2component.get(reference);
                    // get reference value name
                    String referenceName = this.hrc.getHRCTask(reference) == null || this.hrc.getHRCTask(reference).getName() == null ?
                            reference.getLocalName() == null ? reference.asNode().getBlankNodeLabel() : reference.getLocalName() :
                            this.hrc.getHRCTask(reference).getName();

                    // check if decomposition is empty
                    if (!graph.get(reference).isEmpty())
                    {
                        // check if HRC (simple) task
                        if (this.knowledge.hasResourceType(reference, ProductionKnowledgeDictionary.SOHO_NS + "HRCTask"))
                        {
                            // check possible HRC task types
                            if (this.knowledge.hasResourceType(reference, ProductionKnowledgeDictionary.SOHO_NS + "SimultaneousHRCTask")) {
                                // TODO simultaneous constraint
                            } else if (knowledge.hasResourceType(reference, ProductionKnowledgeDictionary.SOHO_NS + "SupportiveHRCTask")) {
                                // TODO supportive constraint
                            } else if (knowledge.hasResourceType(reference, ProductionKnowledgeDictionary.SOHO_NS + "SynchronousHRCTask")) {
                                // TODO synchronous constraint
                            } else    // independent task
                            {
                                // check possible decompositions
                                for (Set<Resource> decomposition : graph.get(reference))
                                {
                                    // check if synchronization description has been opened
                                    if (!comp2sync.containsKey(refComp)) {
                                        // open synchronization description
                                        comp2sync.put(refComp, "\tSYNCHRONIZE " + refComp + " {\n\n");
                                    }

                                    // get component synchronization body
                                    String synchBody = comp2sync.get(refComp);

                                    // get target component
                                    Resource predicate = decomposition.stream().findFirst().get();
                                    // get predicate name
                                    String predicateName = this.hrc.getHRCTask(predicate) == null || this.hrc.getHRCTask(predicate).getName() == null ?
                                            predicate.getLocalName() == null ? predicate.asNode().getBlankNodeLabel() : predicate.getLocalName() :
                                            this.hrc.getHRCTask(predicate).getName();


                                    // get component
                                    String predicateComponent = value2component.get(predicate);
                                    // add value  synchronization
                                    synchBody += "\t\tVALUE " + referenceName + "() {\n\n" +
                                            "\t\t\td0 " + predicateComponent + "._" + predicateName + "();\n" +
                                            "\t\t\tCONTAINS [0, +INF] [0, +INF] d0;\n" +
                                            "\t\t}\n\n";

                                    // update description
                                    comp2sync.put(refComp, synchBody);
                                    // increment the number of synchronizations
                                    this.numberOfSynchronizations++;
                                    // increment the number of constraints
                                    this.numberOfConstraints++;
                                }
                            }
                        } else // any other type of complex task
                        {
                            // check possible decomposition
                            for (Set<Resource> decomposition : graph.get(reference))
                            {
                                // check if empty
                                if (!decomposition.isEmpty())
                                {
                                    // check if synchronization description has been opened
                                    if (!comp2sync.containsKey(refComp)) {
                                        // open synchronization description
                                        comp2sync.put(refComp, "\tSYNCHRONIZE " + refComp + " {\n\n");
                                    }

                                    // get component synchronization body
                                    String synchBody = comp2sync.get(refComp);
                                    // get reference name
                                    String refName = this.hrc.getHRCTask(reference) == null || this.hrc.getHRCTask(reference).getName() == null ?
                                        reference.getLocalName() == null ? reference.asNode().getBlankNodeLabel() : reference.getLocalName() :
                                        this.hrc.getHRCTask(reference).getName();

                                    // add value synchronization
                                    synchBody += "\t\t VALUE " + refName + "() {\n\n";
                                    // increment the number of synchronization
                                    this.numberOfSynchronizations++;

                                    int dIndex = 0;
                                    for (Resource dec : decomposition)
                                    {
                                        // get decision name
                                        String decName = this.hrc.getHRCTask(dec) == null || this.hrc.getHRCTask(dec).getName() == null ?
                                                dec.getLocalName() == null ? dec.asNode().getBlankNodeLabel() : dec.getLocalName() :
                                                this.hrc.getHRCTask(dec).getName();


                                        // get decision component
                                        String decComponent = value2component.get(dec);
                                        // add decomposition description
                                        synchBody += "\t\t\td" + dIndex + " " + decComponent + "." + decName + "();\n" +
                                                "\t\t\tCONTAINS [0, +INF] [0, +INF] d" + dIndex + ";\n";
                                        // increment the number of constraints
                                        this.numberOfConstraints++;

                                        // increment
                                        dIndex++;
                                    }

                                    // close synchronization
                                    synchBody += "\t\t}\n\n";
                                    // update description
                                    comp2sync.put(refComp, synchBody);
                                }
                            }
                        }
                    }
                }
            }
        }


        // aggregate synchronization description
        String synch = "";
        for (String body : comp2sync.values())
        {
            // close body description
            body += "\t}\n\n";
            // add to synchronization description
            synch += body;
        }

        // get description
        return synch;
    }

    /**
     *
     * @param typeName
     * @param values
     * @param partiallyControllable
     * @return
     */
    private String sv(String typeName, List<Resource> values, boolean partiallyControllable) {

        // increment the number of generated state variables
        this.numberOfVariables++;
        // prepare SV description
        String sv = "\tCOMP_TYPE SingletonStateVariable " + typeName + "(";
        for (Resource val : values) {

            // get value name
            String valName = this.hrc.getHRCTask(val) == null || this.hrc.getHRCTask(val).getName() == null ?
                    val.getLocalName() == null ? val.asNode().getBlankNodeLabel() : val.getLocalName() :
                    this.hrc.getHRCTask(val).getName();

            // check controllability tag
            if (partiallyControllable) {
                // add predicate
                sv += "_" + valName + "(), ";
            } else {
                // add predicate
                sv += valName + "(), ";
            }

            // increment the number of created predicates
            this.numberOfPredicates++;

        }

        // add idle predicate
        sv += " Idle()) {\n\n";
        this.numberOfPredicates++;

        // add idle transitions
        sv += "\t\tVALUE Idle() [1, +INF]\n" +
                "\t\tMEETS {\n";
        // add transitions
        for (Resource val : values) {

            // get value name
            String valName = this.hrc.getHRCTask(val) == null || this.hrc.getHRCTask(val).getName() == null ?
                    val.getLocalName() == null ? val.asNode().getBlankNodeLabel() : val.getLocalName() :
                    this.hrc.getHRCTask(val).getName();

            // check controllability tag
            if (partiallyControllable) {
                // add predicate
                sv += "\t\t\t_" + valName + "();\n";
            } else {
                // add predicate
                sv += "\t\t\t" + valName + "();\n";
            }
        }
        // close transition
        sv += "\t\t}\n\n";


        // add transitions for all goals
        for (Resource val : values) {

            // get value name
            String valName = this.hrc.getHRCTask(val) == null || this.hrc.getHRCTask(val).getName() == null ?
                    val.getLocalName() == null ? val.asNode().getBlankNodeLabel() : val.getLocalName() :
                    this.hrc.getHRCTask(val).getName();

            // get HRC task
            HRCTask task = this.hrc.getHRCTask(val);
            // set duration
            String bounds = task == null ? "[1, + INF]" : "[" + task.getDuration()[0] + ", " + task.getDuration()[1] + "]";
            // check controllability
            if (partiallyControllable) {

                sv += "\t\tVALUE _" + valName + "() " + bounds + "\n" +
                        "\t\tMEETS {\n" +
                        "\t\t\tIdle();\n" +
                        "\t\t}\n\n";

            } else {

                sv += "\t\tVALUE " + valName + "() " + bounds + "\n" +
                        "\t\tMEETS {\n" +
                        "\t\t\tIdle();\n" +
                        "\t\t}\n\n";
            }
        }

        // close SV
        sv += "\t}\n\n";
        // get SV description
        return sv;
    }

}
