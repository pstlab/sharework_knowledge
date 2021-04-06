package it.cnr.istc.pst.sharework.authoring.hrc.ftl;

import it.cnr.istc.pst.platinum.ai.framework.domain.PlanDataBaseBuilder;
import it.cnr.istc.pst.platinum.ai.framework.domain.component.PlanDataBase;
import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledgeDictionary;
import it.cnr.istc.pst.sharework.authoring.ProductionKnowledgeAuthoring;
import org.apache.jena.rdf.model.Resource;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 *
 */
public class TimelineBasedProductionKnowledgeAuthoring extends ProductionKnowledgeAuthoring
{
    private int numberOfVariables;                      // number of generated variables
    private int numberOfPredicates;                     // number of generated predicates
    private int numberOfSynchronizations;               // number of generated synchronizations
    private int numberOfConstraints;                    // number of generated constraints
    private long time;                                  // model generation time (in milliseconds)

    private String ddlPath;                             // set DDL file path
    private String pdlPath;                             // set PDL file path

    /**
     *
     */
    public TimelineBasedProductionKnowledgeAuthoring() {
        super();
    }

    /**
     *
     * @param pdlPath
     */
    public TimelineBasedProductionKnowledgeAuthoring(String pdlPath) {

        super();
        this.pdlPath = pdlPath;
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
     * @throws Exception
     */
    @Override
    protected synchronized String doCompile()
            throws Exception
    {
        // get start
        long start = System.currentTimeMillis();
        // set statistic data
        this.numberOfVariables = 0;
        this.numberOfPredicates = 0;
        this.numberOfConstraints = 0;
        this.numberOfSynchronizations = 0;
        this.time = 0;

        // map resource values to components
        Map<Resource, String> vIndex = new HashMap<>();

        // prepare domain description
        String ddl = "DOMAIN KNOWLEDGE_PRODUCTION_AUTHORING_GEN {\n\n" +
                "\tTEMPORAL_MODULE temporal_module = [0, 1000], 100;\n\n";

        // get production goals
        List<Resource> goals = this.knowledge.getProductionGoals();
        // add SV description
        ddl += this.sv("GoalVariableType", goals);
        // prepare also component declaration
        String comps = "\tCOMPONENT Goal {FLEXIBLE goals(functional)} : GoalVariableType;\n";
        // index goals
        for (Resource goal : goals) {
            vIndex.put(goal, "Goal.goals");
        }

        // get workers
        List<Resource> workers = knowledge.getWorkOperators();
        // get functions
        List<Resource> hFuncs = knowledge.getFunctionsByAgent(workers.get(0));
        // add SV description
        ddl += this.sv("WorkerVariableType", hFuncs);
        // create also component declaration
        comps += "\tCOMPONENT Worker {FLEXIBLE operations(primitive)} :  WorkerVariableType;\n";
        // index functions
        for (Resource func : hFuncs) {
            vIndex.put(func, "Worker.operations");
        }

        // get cobots
        List<Resource> cobots = this.knowledge.getCobots();
        // get functions
        List<Resource> rFuncs = this.knowledge.getFunctionsByAgent(cobots.get(0));
        // add SV description
        ddl += this.sv("CobotVariableType", rFuncs);
        // create also component declaration
        comps += "\tCOMPONENT Cobot {FLEXIBLE tasks(primitive)} : CobotVariableType;\n";
        // index functions
        for (Resource func : rFuncs) {
            vIndex.put(func, "Cobot.tasks");
        }

        // get hierarchy
        List<List<Resource>> hierarchy = knowledge.getProductionHierarchy(goals.get(0));
        // create a SV for each hierarchical level
        for (int index = 0; index < hierarchy.size(); index++)
        {
            // get values
            List<Resource> values = hierarchy.get(index);
            // get production values
            ddl += this.sv("ProductionHierarchyL" + index + "Type", values);
            // create also component declaration
            comps += "\tCOMPONENT ProductionL" + index + " {FLEXIBLE tasks_l" + index + "(primitive)} : ProductionHierarchyL" + index + "Type;\n";
            // index tasks
            for (Resource val : values) {
                vIndex.put(val, "ProductionL" + index + ".tasks_l" + index);
            }
        }

        // add component declaration
        ddl += "\n" + comps + "\n";

        // add synchronization description
        ddl += this.synchronizations(vIndex);

        // close domain description
        ddl += "\n}\n\n";

        // get compilation time
        this.time = System.currentTimeMillis() - start;
        // get domain description
        return ddl;
    }

    /**
     *
     */
    @Override
    protected void prepare() {

        /**
         * TODO - POPOLARE LE COLLECTION MONGODB PER IL TASK PLANNER
         */
    }

    /**
     *
     * @return
     */
    public PlanDataBase pdb()
            throws Exception
    {
        // check if DDL file exists
        if (this.ddlPath == null) {
            throw new Exception("No validation of the production knowledge has been done!");
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
            throw new Exception("Error while validating the generated model:\n" +
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
     * @throws Exception
     */
    @Override
    protected synchronized boolean doValidate(String model)
            throws Exception
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
            throw new Exception("Error while validating the generated model:\n" +
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
     * @throws Exception
     */
    private String synchronizations(Map<Resource, String> value2component)
            throws Exception
    {
        // map components to synchronization descriptions
        Map<String, String> comp2sync = new HashMap<>();
        // get production goals
        List<Resource> goals = this.knowledge.getProductionGoals();
        for (Resource goal : goals)
        {
            // check if exists
            if (!value2component.containsKey(goal)) {
                throw new Exception("No component defined for predicate: " + goal.getLocalName() + "()");
            }

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
                    throw new Exception("No component defined for predicate: " + task.getLocalName() + "()");
                }

                // get synchronization body
                String body = comp2sync.get(goalComp);
                // add synchronization constraints
                body += "\t\tVALUE " + goal.getLocalName() + "() {\n\n" +
                        "\t\t\td0 " + value2component.get(task) + "." + task.getLocalName() + "();\n" +
                        "\t\t\tCONTAINS [0, +INF] [0, +INF] d0;\n" +
                        "\t\t}\n\n";

                // update description
                comp2sync.put(goalComp, body);
            }

            // get the decomposition graph
            List<Map<Resource, List<Set<Resource>>>> graphs = knowledge.getDecompositionGraph(goal);
            // check each possible decomposition - method
            for (Map<Resource, List<Set<Resource>>> graph : graphs)
            {
                // get reference predicates/values
                for (Resource reference : graph.keySet())
                {
                    // check if exists
                    if (!value2component.containsKey(reference)) {
                        throw new Exception("No component defined for predicate: " + reference.getLocalName() + "()");
                    }

                    // get reference component
                    String refComp = value2component.get(reference);

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
                                    // get component
                                    String predicateComponent = value2component.get(predicate);
                                    // add value  synchronization
                                    synchBody += "\t\tVALUE " + reference.getLocalName() + "() {\n\n" +
                                            "\t\t\td0 " + predicateComponent + "." + predicate.getLocalName() + "();\n" +
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
                                    // add value synchronization
                                    synchBody += "\t\t VALUE " + reference.getLocalName() + "() {\n\n";
                                    // increment the number of synchronization
                                    this.numberOfSynchronizations++;

                                    int dIndex = 0;
                                    for (Resource dec : decomposition)
                                    {
                                        // get decision component
                                        String decComponent = value2component.get(dec);
                                        // add decomposition description
                                        synchBody += "\t\t\td" + dIndex + " " + decComponent + "." + dec.getLocalName() + "();\n" +
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
     * @return
     */
    private String sv(String typeName, List<Resource> values)
    {
        // increment the number of generated state variables
        this.numberOfVariables++;
        // prepare SV description
        String sv = "\tCOMP_TYPE SingletonStateVariable " + typeName + "(";
        for (Resource val : values) {
            // add predicate
            sv += val.getLocalName() + "(), ";
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
            sv += "\t\t\t" + val.getLocalName() + "();\n";
        }
        // close transition
        sv += "\t\t}\n\n";

        // add transitions for all goals
        for (Resource val : values) {
            sv += "\t\tVALUE " + val.getLocalName() + "() [1, +INF]\n" +
                    "\t\tMEETS {\n" +
                    "\t\t\tIdle();\n" +
                    "\t\t}\n\n";
        }

        // close SV
        sv += "\t}\n\n";
        // get SV description
        return sv;
    }

}
