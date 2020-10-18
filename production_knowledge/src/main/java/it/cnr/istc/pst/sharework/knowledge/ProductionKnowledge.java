package it.cnr.istc.pst.sharework.knowledge;

import it.cnr.istc.pst.sharework.knowledge.dictionary.KnowledgeDictionary;
import org.apache.jena.ontology.Individual;
import org.apache.jena.ontology.OntModel;
import org.apache.jena.ontology.OntModelSpec;
import org.apache.jena.rdf.model.*;
import org.apache.jena.reasoner.rulesys.GenericRuleReasoner;
import org.apache.jena.reasoner.rulesys.Rule;

import java.util.*;

/**
 * Apache Jena-based implementation of Production Knowledge interface
 */
public class ProductionKnowledge
{
    private static final String SHAREWORK_KNOWLEDGE_HOME = System.getenv("SHAREWORK_KNOWLEDGE_HOME") != null ?
            System.getenv("SHAREWORK_KNOWLEDGE_HOME") + "/" : "";

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
     */
    public ProductionKnowledge(String ontoFile)
    {
        // set ontology file
        this.ontoFile = ontoFile;
        this.ruleFile = SHAREWORK_KNOWLEDGE_HOME + "etc/soho_rules_v1.0.rules";

        // create an ontological model from SOHO
        this.ontoModel = ModelFactory.createOntologyModel(
                OntModelSpec.RDFS_MEM_TRANS_INF
        );

        // use DocumentManager API to specify that onto is replicated locally on disk
        this.ontoModel.getDocumentManager().addAltEntry(KnowledgeDictionary.SOHO_NS.get(), "file:" + this.ontoFile);
        // actually load the ontology
        this.ontoModel.read(KnowledgeDictionary.SOHO_NS.get());

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
        this(SHAREWORK_KNOWLEDGE_HOME + "etc/soho_core_v1.owl");
    }

    /**
     * This method returns a list of Resource representing individuals of
     * a given ontology class
     *
     * @param classURI
     * @return
     * @throws Exception
     */
    public List<Resource> getIndividuals(String classURI)
            throws Exception
    {
       // list of individuals
       List<Resource> list = new ArrayList<>();
       // get resource associated the class URI
       Resource c = this.infModel.getResource(classURI);
       if (c == null) {
           throw new Exception("No class found with URI= " + classURI + "\n");
       }

       // TODO : check individuals from infModel instead of ontoModel
       Iterator<Individual> it = this.ontoModel.listIndividuals(c);
       while (it.hasNext()) {
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
        Property rdfType = this.getProperty(KnowledgeDictionary.RDF_NS + "type");
        // get all types
        List<Statement> list = this.listStatements(
                resource.getURI(), rdfType.getURI(), null);
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
    public Map<Resource, Set<Resource>> retrieveResourceStructure(Resource resource) {
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
    public List<Resource> getProductionGoals() {
        // list of production goals
        List<Resource> goals = new ArrayList<>();

        // retrieve known individuals of SOHO:ProductionGoal
        List<Statement> list = this.listStatements(
                null,
                KnowledgeDictionary.RDF_NS + "type",
                KnowledgeDictionary.SOHO_NS + "ProductionGoal");
        // get resource
        for (Statement s : list) {
            // add the subject of the statement
            goals.add(s.getSubject());
        }

        // get the list
        return goals;
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
    public List<Map<Resource, Set<Resource>>> getProductionGraph(Resource pGoal)
            throws Exception
    {
        // check parameter type
        if (!this.hasResourceType(pGoal, KnowledgeDictionary.SOHO_NS + "ProductionGoal")) {
            // wrong parameter type
            throw new Exception("Wrong parameter type, a resource/individual of type <" + KnowledgeDictionary.SOHO_NS + "ProductionGoal> expected:" +
                    "\n- received parameter " + pGoal.getLocalName() + " (" + pGoal.getURI() + ")");
        }
        
        // set result data
        List<Map<Resource, Set<Resource>>> result = new ArrayList<>();
        // get methods associated to the production goal
        List<Statement> stats = this.listStatements(
                pGoal.getURI(),
                KnowledgeDictionary.SOHO_NS + "hasPart",
                null);

        // extract production graphs
        for (Statement s : stats)
        {
            // get statement's object
            Resource method = s.getObject().asResource();
            // check if method
            if (this.hasResourceType(method, KnowledgeDictionary.SOHO_NS + "ProductionMethod"))
            {
                // retrieve resource structure
                Map<Resource, Set<Resource>> graph = this.retrieveResourceStructure(method);
                // remove the entry associated to the method
                graph.remove(method);
                // add the graph to the result list
                result.add(graph);
            }
        }

        // get result
        return result;
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
        Property hasConstituent = this.getProperty(KnowledgeDictionary.DUL_NS + "hasConstituent");

        // retrieve elements
        List<Statement> list = this.listStatements(resource.getURI(), hasConstituent.getURI(), null);
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
