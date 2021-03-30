package it.cnr.istc.pst.sharework.knowledge;

import org.apache.jena.ontology.*;
import org.apache.jena.rdf.model.*;
import org.apache.jena.reasoner.rulesys.GenericRuleReasoner;
import org.apache.jena.reasoner.rulesys.Rule;
import org.apache.jena.util.iterator.ExtendedIterator;

import java.util.*;

/**
 * Apache Jena-based implementation of Production Knowledge interface
 */
public class ProductionKnowledge
{
    public static final String SHAREWORK_KNOWLEDGE = System.getenv("SHAREWORK_KNOWLEDGE") != null ?
            System.getenv("SHAREWORK_KNOWLEDGE") + "/" : "";

    private String ontoFile;        // file with the ontology
    private String ruleFile;        // file with the inference rules

    private OntModel ontoModel;         // reference to the ontology model
    private InfModel infModel;          // the actual knowledge performing inference

    /**
     * Create the element responsible for actually managing production knowledge.
     *
     * This object encapsulates Apache Jena functionalities to build an OWL model
     * of the dataset. On top of this model, a rule-based inference engine extends
     * OWL semantics (OWLMicro) to refine the internal knowledge graph.
     *
     * @param ontoFile
     * @param rulePath
     */
    public ProductionKnowledge(String ontoFile, String rulePath)
    {
        // set ontology file
        this.ontoFile = ontoFile;
        this.ruleFile = rulePath;

        // create an ontological model from SOHO
        this.ontoModel = ModelFactory.createOntologyModel(
                OntModelSpec.OWL_DL_MEM                             // support "diff" statements
                //OntModelSpec.RDFS_MEM_TRANS_INF
        );

        // use DocumentManager API to specify that onto is replicated locally on disk
        this.ontoModel.getDocumentManager().addAltEntry(
                ProductionKnowledgeDictionary.SOHO_NS.get(),
                "file:" + this.ontoFile);
        // actually load the ontology
        this.ontoModel.read(ProductionKnowledgeDictionary.SOHO_NS.get());

        // parse the list of inference rules for knowledge processing
        List<Rule> rules = Rule.rulesFromURL("file:" + this.ruleFile);
        // create a generic rule-based reasoner
        GenericRuleReasoner reasoner = new GenericRuleReasoner(rules);
        reasoner.setOWLTranslation(true);
        reasoner.setTransitiveClosureCaching(true);

        // create an inference model attached to the ontological model schema
        this.infModel = ModelFactory.createInfModel(reasoner, this.ontoModel);
    }

    /**
     * Create the element responsible for actually managing production knowledge.
     *
     * This object encapsulates Apache Jena functionalities to build an OWL model
     * of the dataset. On top of this model, a rule-based inference engine extends
     * OWL semantics (OWLMicro) to refine the internal knowledge graph.
     */
    public ProductionKnowledge() {
        // set default ontology model
        this(SHAREWORK_KNOWLEDGE + "etc/ontologies/soho_core_v1.owl",
                SHAREWORK_KNOWLEDGE + "etc/ontologies/soho_rules_v1.0.rules");
    }

    /**
     * This method returns a list of Resource representing individuals of
     * a given ontology class
     *
     * @param classURI
     * @return
     * @throws Exception
     */
    public List<Resource> getInstances(String classURI)
            throws Exception
    {
       // list of individuals
       List<Resource> list = new ArrayList<>();
       // get resource associated the class URI
       Resource c = ResourceFactory.createResource(classURI);
       // check if the model contains the resource
       if (!this.ontoModel.containsResource(c)) {
           // class not existing
           throw new Exception("No class found with URI  \"" + classURI + "\"");
       }
       else {
           // update the resource
           c = this.ontoModel.getResource(classURI);
       }

       // get property
        Property prop = this.ontoModel.getProperty(ProductionKnowledgeDictionary.RDF_NS + "type");
       // check all resources of the specified type
       Iterator<Statement> it = this.infModel.listStatements(null, prop, c);
        // check statements
       while (it.hasNext()) {
           // next statement
           Statement s = it.next();
           // get statement's subject
           list.add(s.getSubject());
       }

       // get the list
        return list;
    }

    /**
     *
     * @param classURI
     * @return
     * @throws Exception
     */
    public List<Individual> getIndividuals(String classURI)
            throws Exception
    {
        // list of individuals
        List<Individual> list = new ArrayList<>();
        // get resource associated the class URI
        Resource c = ResourceFactory.createResource(classURI);
        // check if the model contains the resource
        if (!this.ontoModel.containsResource(c)) {
            // class not existing
            throw new Exception("No class found with URI  \"" + classURI + "\"");
        }
        else {
            // update the resource
            c = this.ontoModel.getResource(classURI);
        }

        // list individual of a given class
        Iterator<Individual> it = this.ontoModel.listIndividuals(c);
        // check statements
        while (it.hasNext()) {
            // get next individual
            list.add(it.next());
        }

        // get the list
        return list;
    }

    /**
     * This method (re)binds the inference model to the underlying ontological
     * model by triggering the rule-based inference engine on the new/updated data
     * of the model
     */
    public void rebind() {
        // bind the inference model to the underlying data/ontological model
        this.infModel.rebind();
    }

    /**
     *
     * @param uri
     * @return
     */
    public Property getProperty(String uri)
    {
        // retrieve the property from the model
        return this.ontoModel.getProperty(uri);
    }

    /**
     *
     * @param classUri
     * @return
     * @throws Exception
     */
    public Resource createIndividual(String classUri)
            throws Exception
    {
        // individual
        Resource ind = null;
        // create resource
        Resource rClass = ResourceFactory.createResource(classUri);
        // check if the ontology model contains the resource
        if (this.ontoModel.containsResource(rClass))
        {
            // create a new individual of the class
            ind = this.ontoModel.createIndividual(
                    this.ontoModel.getResource(classUri)).asResource();
        }
        else {
            // invalid parameter
            throw new Exception("Unknown resource with URI \"" + classUri + "\"");
        }

        // get individual
        return ind;
    }

    /**
     *
     * @param classUri
     * @return
     * @throws Exception
     */
    public Resource createUniqueIndividual(String classUri)
            throws Exception
    {
        // individual
        Resource ind = null;
        // create resource
        Resource rClass = ResourceFactory.createResource(classUri);
        // check if the ontology model contains the resource
        if (this.ontoModel.containsResource(rClass))
        {
            // create a new individual of the class
            ind = this.ontoModel.createIndividual(
                    this.ontoModel.getResource(classUri)).asResource();
        }
        else {
            // invalid parameter
            throw new Exception("Unknown resource with URI \"" + classUri + "\"");
        }

        // set different from siblings
        this.setDifferentFromSiblings(ind);
        // get individual
        return ind;
    }

    /**
     *
     * @param res
     * @throws Exception
     */
    public void setDifferentFromSiblings(Resource res)
            throws Exception
    {
        // get resource as individual
        Individual i = this.ontoModel.getResource(
                // check blank node
                res.getURI() == null ? res.asNode().getBlankNodeLabel() : res.getURI()).as(Individual.class);

        // get resource type
        Statement s = res.getProperty(this.ontoModel.getProperty(
                ProductionKnowledgeDictionary.RDF_NS + "type"));
        // get type
        Resource rClass = s.getObject().asResource();
        // get all instances
        List<Resource> siblings = this.getInstances(rClass.getURI());
        // set different
        for (Resource sibling : siblings) {
            if (!sibling.equals(res)) {
                // set as different individuals
                i.addDifferentFrom(sibling);
            }
        }

        // rebind inference model
        this.infModel.rebind();
    }

    /**
     *
     * @param res
     * @param others
     * @throws Exception
     */
    public void setDifferentFromResources(Resource res, List<Resource> others)
            throws Exception
    {
        // get resource as individual
        Individual i = this.ontoModel.getResource(
                // check blank nodes
                res.getURI() == null ? res.asNode().getBlankNodeLabel() : res.getURI()).as(Individual.class);

        // set different
        for (Resource other : others) {
            if (!other.equals(res)) {
                // set as different individuals
                i.addDifferentFrom(other);
            }
        }

        // rebind inference model
        this.infModel.rebind();
    }

    /**
     *
     * @param referenceUri
     * @param propertyUri
     * @param objectUri
     * @return
     * @throws Exception
     */
    public Statement addAssertion(String referenceUri, String propertyUri, String objectUri)
            throws Exception
    {
        // check if property exists
        Property prop = this.infModel.getProperty(propertyUri);

        // check if reference resource exists
        Resource ref = this.infModel.getResource(referenceUri);
        // check if object resource exists
        Resource obj = this.infModel.getResource(objectUri);

        // create statement
        Statement stat = this.infModel.createStatement(ref, prop, obj);
        // assert/add the statement
        this.infModel.add(stat);
        // get created statement
        return stat;
    }

    /**
     *
     * @param referenceUri
     * @param propertyUri
     * @param objectUri
     * @return
     */
    public List<Statement> removeAssertion(String referenceUri, String propertyUri, String objectUri)
    {
        // list of statements
        List<Statement> list = new ArrayList<>();
        // check if property exists
        Property prop = this.infModel.getProperty(propertyUri);

        // check if reference resource exists
        Resource ref = this.infModel.getResource(referenceUri);
        // check if object resource exists
        Resource obj = this.infModel.getResource(objectUri);

        // get statements
        StmtIterator it = this.infModel.listStatements(
                ref,
                prop,
                obj);
        // get statements to remove
        while (it.hasNext()) {
            // get statement
            Statement s = it.next();
            // get next
            list.add(s);
            // remove statement
            this.infModel.remove(s);
        }

        // create statement
        Statement stat = this.infModel.createStatement(ref, prop, obj);
        // assert/add the statement
        this.infModel.add(stat);


        // get the list of statements
        return list;
    }

    /**
     *
     * @param s
     * @param p
     * @param o
     * @return
     */
    public List<Statement> listStatements(String s, String p, String o)
    {
        // check statement subject
        Resource subject = null;
        if (s != null) {
            // retrieve resource from the model
            subject = this.ontoModel.getResource(s);
        }

        // check statement property
        Property property = null;
        if (p != null) {
            // retrieve resource from the model
            property = this.ontoModel.getProperty(p);
        }

        // check statement object
        RDFNode object = null;
        if (o != null) {
            // retrieve object from the model
            object = this.ontoModel.getRDFNode(this.ontoModel.getResource(o).asNode());
        }

        // list of statement found
        List<Statement> list = new ArrayList<>();
        // iterate over found statements
        Iterator<Statement> it = this.infModel.listStatements(subject, property, object);
        while (it.hasNext()) {
            list.add(it.next());
        }

        // get list of statements
        return list;
    }

    /**
     * Check if a resource has the specified type
     *
     * @param resource
     * @param classURI
     * @return
     */
    public boolean hasResourceType(Resource resource, String classURI)
    {
        // result flag
        boolean hasType = false;
        // get RDF:type property
        Property rdfType = this.getProperty(ProductionKnowledgeDictionary.RDF_NS + "type");
        // get all types
        List<Statement> list = this.listStatements(
                // check blank node
                resource.getURI() == null ? resource.asNode().getBlankNodeLabel() : resource.getURI(),
                rdfType.getURI(),
                null);
        // check statements
        for (Statement s : list)
        {
            // get statement type
            Resource type = s.getObject().asResource();
            // check if it corresponds to the desired type
            if (type != null && type.getURI() != null &&
                    type.getURI().toLowerCase().equals(classURI.toLowerCase()))
            {
               // found
               hasType = true;
               // exit the loop
               break;
            }
        }

        // get result
        return hasType;
    }

    /**
     * This method analyzes the knowledge graph to extract the ontological structure of
     * a given resource (i.e., an individual of the knowledge base).
     *
     * The structure is extracted by taking into account the semantics of the
     * property DUL:hasConstituent which associates an individual to individuals
     * that characterize its structure.
     *
     *
     * @param resource
     * @return
     */
    public Map<Resource, Set<Resource>> retrieveResourceStructure(Resource resource)
    {
        // set result structure
        HashMap<Resource, Set<Resource>> structure = new HashMap<>();
        // navigate knowledge to extract structure
        this.retrieveResourceStructure(resource, structure);
        // get result
        return structure;
    }

    /**
     * The method reads the knowledge base to retrieve the list of
     * known production goals.
     *
     * The method retrieves all known individuals of type SOHO:ProductionGoal
     *
     * @return a list of resource of type SOHO:ProductionGoal
     */
    public List<Resource> getProductionGoals()
    {
        // list of production goals
        List<Resource> goals = new ArrayList<>();

        // retrieve known individuals of SOHO:ProductionGoal
        List<Statement> list = this.listStatements(
                null,
                ProductionKnowledgeDictionary.RDF_NS + "type",
                ProductionKnowledgeDictionary.SOHO_NS + "ProductionGoal");

        // get resource
        for (Statement s : list) {
            // add the subject of the statement
            goals.add(s.getSubject());
        }

        // get the list
        return goals;
    }

    /**
     * The method reads the knowledge base to retrieve the list of
     * known autonomous agents.
     *
     * The method retrieves all known individuals of type SOHO:AutonomousAgent
     *
     * @return a list of resource of type SOHO:AutonomousAgent
     */
    public List<Resource> getAgents()
    {
        // list of agents
        List<Resource> agents = new ArrayList<>();

        // retrieve known individuals of SOHO:AutonomousAgent
        List<Statement> list = this.listStatements(
                null,
                ProductionKnowledgeDictionary.RDF_NS + "type",
                ProductionKnowledgeDictionary.SOHO_NS + "AutonomousAgent");

        // get resources
        for (Statement s : list) {
            // add subject to the list
            agents.add(s.getSubject());
        }

        // get the list
        return agents;
    }

    /**
     * The method reads the knowledge base to retrieve the list of known workers.
     *
     * The method retrieves all known individuals of type SOHO:WorkOperator
     *
     * @return
     */
    public List<Resource> getWorkOperators()
    {
        // list of workers
        List<Resource> workers = new ArrayList<>();

        // retrieve known individuals of SOHO:WorkOperator
        List<Statement> list = this.listStatements(
                null,
                ProductionKnowledgeDictionary.RDF_NS + "type",
                ProductionKnowledgeDictionary.SOHO_NS + "WorkOperator");

        // get resources
        for (Statement s : list) {
            // add the subject of the statement
            workers.add(s.getSubject());
        }

        // get the list of workers
        return workers;
    }

    /**
     * The method reads the knowledge base to retrieve the list of known cobots.
     *
     * The method retrieves all known individuals of type SOHO:Cobot
     *
     * @return
     */
    public List<Resource> getCobots()
    {
        // list of workers
        List<Resource> cobots = new ArrayList<>();

        // retrieve known individuals of SOHO:WorkOperator
        List<Statement> list = this.listStatements(
                null,
                ProductionKnowledgeDictionary.RDF_NS + "type",
                ProductionKnowledgeDictionary.SOHO_NS + "Cobot");

        // get resources
        for (Statement s : list) {
            // add the subject of the statement
            cobots.add(s.getSubject());
        }

        // get the list of cobots
        return cobots;
    }

    /**
     * The method reads the knowledge base to retrieve the list of
     * known functions some agent can perform.
     *
     * The method retrieves all known individuals of type SOHO:Function
     *
     * @return a list of resource of type SOHO:Function
     */
    public List<Resource> getFunctions()
    {
        // list of agents
        List<Resource> agents = new ArrayList<>();

        // retrieve known individuals of SOHO:AutonomousAgent
        List<Statement> list = this.listStatements(
                null,
                ProductionKnowledgeDictionary.RDF_NS + "type",
                ProductionKnowledgeDictionary.SOHO_NS + "Function");

        // get resources
        for (Statement s : list) {
            // add subject to the list
            agents.add(s.getSubject());
        }

        // get the list
        return agents;
    }

    /**
     * The method reads the knowledge base to retrieve the list of
     * functions a specific agent (i.e., individual of SOHO:AutonomousAgent)
     * can perform.
     *
     * The method retrieves all known individuals of type SOHO:Function
     * associated to the specified individual of SOHO:AutonomousAgent through
     * the property SOHO:canBePerformedBy
     *
     * @return a list of resource of type SOHO:Function
     */
    public List<Resource> getFunctionsByAgent(Resource agent)
    {
        // list of agents
        List<Resource> functions = new ArrayList<>();

        // retrieve known individuals of SOHO:AutonomousAgent
        List<Statement> list = this.listStatements(
                null,
                ProductionKnowledgeDictionary.SOHO_NS + "canBePerformedBy",
                // check blank node
                agent.getURI()  == null ? agent.asNode().getBlankNodeLabel() : agent.getURI());

        // get resources
        for (Statement s : list) {
            // add subject to the list
            functions.add(s.getSubject());
        }

        // get the list
        return functions;
    }

    /**
     * The method reads the knowledge base to retrieve production graphs associated
     * to a production goal.
     *
     * The method extract a list of SOHO:ProductionMethod each of which describes a
     * production procedure as a hierarchical structure of SOHO:ComplexTask,
     * SOHO:SimpleTask and SOHO:Function.
     *
     * @param pGoal a resource of type SOHO:ProductionGoal
     * @return a list of maps representing production graphs as hierarchical decompositions
     * of SOHO:ComplexTask, SOHO:SimpleTask and SOHO:Function
     * @throws throws an exception in case that the type of the parameter is wrong
     *
     */
    public List<Map<Resource, List<Set<Resource>>>> getDecompositionGraph(Resource pGoal)
            throws Exception
    {
        // check parameter type
        if (!this.hasResourceType(pGoal, ProductionKnowledgeDictionary.SOHO_NS + "ProductionGoal")) {
            // wrong parameter type
            throw new Exception("Wrong parameter type, a resource/individual of type <" + ProductionKnowledgeDictionary.SOHO_NS + "ProductionGoal> expected:" +
                    "\n- received parameter " + pGoal.getLocalName() + " (" + pGoal.getURI() + ")");
        }
        
        // set result data
        List<Map<Resource, List<Set<Resource>>>> graphs = new ArrayList<>();
        // get methods associated to the production goal
        List<Statement> mStats = this.listStatements(
                // check blank node
                pGoal.getURI() == null ? pGoal.asNode().getBlankNodeLabel() : pGoal.getURI(),
                ProductionKnowledgeDictionary.DUL_NS + "hasConstituent",
                null);

        // extract production graphs
        for (Statement ms : mStats)
        {
            // get production method
            Resource method = ms.getObject().asResource();
            // check if method
            if (this.hasResourceType(method, ProductionKnowledgeDictionary.SOHO_NS + "ProductionMethod"))
            {
                // prepare the graph associated to the method
                Map<Resource, List<Set<Resource>>> mGraph = new HashMap<>();

                // retrieve property
                Property prop = this.getProperty(ProductionKnowledgeDictionary.DUL_NS + "hasConstituent");
                Iterator<Statement> it = method.listProperties(prop);
                // check statements and associated high-level tasks
                while (it.hasNext())
                {
                    // get statement
                    Statement s = it.next();
                    // get associated high-level tasks
                    Resource hTask = s.getObject().asResource();
                    // check if production task
                    if (this.hasResourceType(hTask, ProductionKnowledgeDictionary.SOHO_NS + "ProductionTask"))
                    {
                        // add data to the method-graph
                        if (!mGraph.containsKey(hTask)) {
                            // initialize data by associating a list of possible disjunctive decompositions
                            mGraph.put(hTask, new ArrayList<Set<Resource>>());
                        }

                        // navigate the knowledge base to extract possible decompositions
                        this.retrieveProductionTaskDecomposition(hTask, mGraph);
                    }

                }

                // add method-related graph to the result
                graphs.add(mGraph);
            }
        }

        // get result
        return graphs;
    }

    /**
     * The method reads the knowledge base to retrieve the dependency structure
     * of production processes associated to a give SOHO:ProductionGoal
     *
     * @param pGoal
     * @return
     * @throws Exception
     */
    public Map<Resource, Set<Resource>> getDependencyGraph(Resource pGoal)
            throws Exception
    {
        // check parameter type
        if (!this.hasResourceType(pGoal, ProductionKnowledgeDictionary.SOHO_NS + "ProductionGoal")) {
            // wrong parameter type
            throw new Exception("Wrong parameter type, a resource/individual of type <" + ProductionKnowledgeDictionary.SOHO_NS + "ProductionGoal> expected:" +
                    "\n- received parameter " + pGoal.getLocalName() + " (" + pGoal.getURI() + ")");
        }

        // build dependency graph
        Map<Resource, Set<Resource>> dGraph = new HashMap<>();
        // get production graphs
        List<Map<Resource, List<Set<Resource>>>> graphs = this.getDecompositionGraph(pGoal);
        // check graphs
        for (Map<Resource, List<Set<Resource>>> graph : graphs)
        {
            for (Resource key : graph.keySet())
            {
                // add key to the dependency graph
                if (!dGraph.containsKey(key)) {
                    dGraph.put(key, new HashSet<Resource>());
                }

                for (Set<Resource> subtasks : graph.get(key)) {
                    for (Resource subtask : subtasks) {
                        dGraph.get(key).add(subtask);
                    }
                }
            }
        }


        // get dependency graph
        return dGraph;
    }

    /**
     * The method reads the knowledge base to extract the production hierarchy for a
     * given production goal
     * t
     * @param pGoal
     * @return
     * @throws Exception
     */
    public List<List<Resource>> getProductionHierarchy(Resource pGoal)
            throws Exception
    {
        // check parameter type
        if (!this.hasResourceType(pGoal, ProductionKnowledgeDictionary.SOHO_NS + "ProductionGoal")) {
            // wrong parameter type
            throw new Exception("Wrong parameter type, a resource/individual of type <" + ProductionKnowledgeDictionary.SOHO_NS + "ProductionGoal> expected:" +
                    "\n- received parameter " + pGoal.getLocalName() + " (" + pGoal.getURI() + ")");
        }

        // initialize the hierarchy
        List<List<Resource>> hierarchy = new ArrayList<>();
        // get production dependency
        Map<Resource, Set<Resource>> graph = this.getDependencyGraph(pGoal);

        // make a copy
        Map<Resource, Set<Resource>> copy = new HashMap<>(graph);
        // remove SOHO:Function from the graph to build the hierarchy
        for (Resource task : copy.keySet())
        {
            // check type
            if (this.hasResourceType(task, ProductionKnowledgeDictionary.SOHO_NS + "Function") &&
                    copy.get(task).isEmpty())
            {
                // remove function
                graph.remove(task);
                for (Resource key : graph.keySet()) {
                    // remove task from dependency
                    graph.get(key).remove(task);
                }
            }
        }

        // invert the graph as an "incidence graph"
        Map<Resource, Set<Resource>> iGraph = new HashMap<>();
        // set of visited nodes
        Set<Resource> visited = new HashSet<>();
        for (Resource from : graph.keySet())
        {
            // add to visited
            visited.add(from);
            // check if leaf
            for (Resource to : graph.get(from))
            {
                // add to visited
                visited.add(to);
                // update  incidence graph
                if (!iGraph.containsKey(to)) {
                    iGraph.put(to, new HashSet<Resource>());
                }

                // add entry
                iGraph.get(to).add(from);
            }
        }

        // add root nodes
        for (Resource node : visited) {
            // check if contained into the incidence graph
            if (!iGraph.containsKey(node)) {
                iGraph.put(node, new HashSet<Resource>());
            }
        }

        // compute the hierarchy
        return this.runTopologicalSort(iGraph);
    }

    /**
     *
     * @param dependencies
     * @return
     */
    private List<List<Resource>> runTopologicalSort(Map<Resource, Set<Resource>> dependencies)
    {
        // make a copy of the data
        Map<Resource, Set<Resource>> graph = new HashMap<>(dependencies);
        // compute hierarchy through topological sort
        List<Resource> S = new ArrayList<>();
        for (Resource key : graph.keySet()) {
            // check if root
            if (graph.get(key).isEmpty()) {
                S.add(key);
            }
        }

        // initialize hierarchy
        List<List<Resource>> hierarchy = new ArrayList<List<Resource>>();

        // top hierarchical level
        int hLevel = 0;
        // start building the hierarchy
        while (!S.isEmpty())
        {
            // get all root resources
            for (Resource res : S)
            {
                // add root element
                if (hierarchy.size() <= hLevel) {
                    // add hierarchical level
                    hierarchy.add(new ArrayList<Resource>());
                }

                // add the resource to the current hierarchical level
                hierarchy.get(hLevel).add(res);
                // remove the resource from the graph
                graph.remove(res);
                // remove "edges" to resource
                for (Resource key : graph.keySet()) {
                    graph.get(key).remove(res);
                }
            }

            // clear the set of root nodes
            S.clear();
            // update hierarchical level
            hLevel++;

            // look for new roots
            for (Resource key : graph.keySet()) {
                // check if root
                if (graph.get(key).isEmpty()) {
                    S.add(key);
                }
            }
        }


        // get hierarchy
        return hierarchy;
    }

    /**
     * Retrieve possible decompositions of a given SOHO:ProductionTask
     *
     * @param task
     * @param graph
     */
    private void retrieveProductionTaskDecomposition(Resource task, Map<Resource, List<Set<Resource>>> graph)
    {
        // get constituent property
        Property prop = this.getProperty(ProductionKnowledgeDictionary.DUL_NS +  "hasConstituent");
        // check if disjunctive task
        if (this.hasResourceType(task, ProductionKnowledgeDictionary.SOHO_NS + "DisjunctiveComplexTask"))
        {
            // check (disjunctive) constituent resources
            Iterator<Statement> it = task.listProperties(prop);
            // check statements
            while (it.hasNext())
            {
                // next statement
                Statement s = it.next();
                // get target resource
                Resource subTask = s.getObject().asResource();
                // check if SOHO:ProductionTask
                if (this.hasResourceType(subTask, ProductionKnowledgeDictionary.SOHO_NS + "ProductionTask"))
                {
                    // create disjunction
                    Set<Resource> disjunction = new HashSet<>();
                    // add the subtask
                    disjunction.add(subTask);
                    graph.get(task).add(disjunction);

                    // add sub-task to the graph
                    if (!graph.containsKey(subTask)) {
                        graph.put(subTask, new ArrayList<Set<Resource>>());
                    }

                    // recursively check disjunction decomposition
                    this.retrieveProductionTaskDecomposition(subTask, graph);
                }
            }
        }
        else // complex (conjunctive) task, simple task or function
        {
            // prepare a set of subtask
            Set<Resource> subTasks = new HashSet<>();

            // check (conjunctive) constituent resources
            Iterator<Statement> it = task.listProperties(prop);
            // check statements
            while (it.hasNext())
            {
                // next statement
                Statement s = it.next();
                // get target resource
                Resource subTask = s.getObject().asResource();
                // check if SOHO:ProductionTask
                if (this.hasResourceType(subTask, ProductionKnowledgeDictionary.SOHO_NS + "ProductionTask"))
                {
                    // add task to the sub-tasks
                    subTasks.add(subTask);
                    // add sub-task to the graph
                    if (!graph.containsKey(subTask)) {
                        graph.put(subTask, new ArrayList<Set<Resource>>());
                    }

                    // check if not SOHO:Function and possible further decomposition
                    if (!this.hasResourceType(subTask, ProductionKnowledgeDictionary.SOHO_NS + "Function")) {
                        // recursively check sub-task decomposition
                        this.retrieveProductionTaskDecomposition(subTask, graph);
                    }
                }
            }

            // add task decomposition
            graph.get(task).add(subTasks);
        }
    }


    /**
     * This method recursively navigates the property DUL:hasConstituent to
     * extract the internal structure of an individual of the knowledge base.
     *
     * The method navigates the individuals of the knowledge base (i.e., the
     * knowledge graph)
     *
     * @param resource
     * @param subtree
     */
    private void retrieveResourceStructure(Resource resource, Map<Resource, Set<Resource>> subtree)
    {
        // get constituent property
        Property hasConstituent = this.getProperty(ProductionKnowledgeDictionary.DUL_NS + "hasConstituent");

        // retrieve elements
        List<Statement> list = this.listStatements(
                // check blank node
                resource.getURI() == null ? resource.asNode().getBlankNodeLabel() : resource.getURI(),
                hasConstituent.getURI(),
                null);

        // check results
        if (list == null || list.isEmpty()) {
            // stop recursive call
            subtree.put(resource, new HashSet<Resource>());
        }
        else {
            // set of children
            HashSet<Resource> children = new HashSet<>();
            // a recursive call is needed
            for (Statement s : list)
            {
                // get child resource
                Resource child = s.getObject().asResource();
                // add to children
                children.add(child);
                // recursive call on children
                this.retrieveResourceStructure(child, subtree);
            }

            // add subtree entry associated to the current resource
            subtree.put(resource, children);
        }
    }

}
