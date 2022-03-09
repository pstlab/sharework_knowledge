package it.cnr.istc.pst.sharework.knowledge;

import it.cnr.istc.pst.sharework.knowledge.ex.ProductionKnowledgeException;
import org.apache.commons.logging.Log;
import org.apache.jena.ontology.*;
import org.apache.jena.rdf.model.*;
import org.apache.jena.reasoner.rulesys.*;
import org.apache.jena.reasoner.rulesys.builtins.Product;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.*;

/**
 * Apache Jena-based implementation of Production Knowledge interface
 */
public class ProductionKnowledge
{
    public static final String SHAREWORK_KNOWLEDGE = System.getenv("SHAREWORK_KNOWLEDGE") != null ?
            System.getenv("SHAREWORK_KNOWLEDGE") + "/" : "";

    private static final Object lock = new Object();                // state lock
    private ProductionKnowledgeState state;                         // current state
    private boolean readTransaction;                                // set read transaction flag


    private String defaultOntoFile;         // default ontological file
    private String defaultRuleFile;         // default rule file

    private String ontoFile;                 // file with the ontology
    private String ruleFile;                 // file with the inference rules

    private OntModel ontoModel;             // reference to the ontology model
    private InfModel infModel;              // the actual knowledge performing inference

    private Log log;


    private List<ProductionKnowledgeUpdateSubscriber> subscribers;

    /**
     * Create the element responsible for actually managing production knowledge.
     *
     * This object encapsulates Apache Jena functionalities to build an OWL model
     * of the dataset. On top of this model, a rule-based inference engine extends
     * OWL semantics (OWLMicro) to refine the internal knowledge graph.
     *
     * @param ontoFile
     * @param ruleFile
     */
    public ProductionKnowledge(String ontoFile, String ruleFile)
    {
        // load model
        this.doLoad(ontoFile, ruleFile);
        // set default state
        this.state = ProductionKnowledgeState.NONE;
        // set default files
        this.defaultOntoFile = ontoFile;
        this.defaultRuleFile = ruleFile;

        // set transaction flag
        this.readTransaction = false;
        // set list of subscribers
        this.subscribers = new ArrayList<>();
    }

    /**
     * Create the element responsible for actually managing production knowledge.
     *
     * This object encapsulates Apache Jena functionalities to build an OWL model
     * of the dataset. On top of this model, a rule-based inference engine extends
     * OWL semantics (OWLMicro) to refine the internal knowledge graph.
     */
    public ProductionKnowledge(Log log) {
        // set default ontology model
        this(SHAREWORK_KNOWLEDGE + "etc/ontologies/soho_core_v0.3.owl",
                SHAREWORK_KNOWLEDGE + "etc/ontologies/soho_rules_v1.0.rules");

        // set logger
        this.log = log;
    }

    /**
     *
     * @param subscriber
     */
    public synchronized void subscribe(ProductionKnowledgeUpdateSubscriber subscriber) {
        // add to list
        if (!this.subscribers.contains(subscriber)) {
            this.subscribers.add(subscriber);
        }
    }

    /**
     *
     * @param subscriber
     */
    public synchronized void unsubscribe(ProductionKnowledgeUpdateSubscriber subscriber) {
        this.subscribers.remove(subscriber);
    }

    /**
     *
     * @param ontoFile
     * @param ruleFile
     */
    private void doLoad(String ontoFile, String ruleFile)
    {
        // create an ontological model from SOHO
        this.ontoModel = ModelFactory.createOntologyModel(
                OntModelSpec.OWL_DL_MEM                             // support "diff" statements
                //OntModelSpec.RDFS_MEM_TRANS_INF
        );

        // use DocumentManager API to specify that onto is replicated locally on disk
        this.ontoModel.getDocumentManager().addAltEntry(
                ProductionKnowledgeDictionary.SOHO_NS.get(),
                "file:" + ontoFile);
        // actually load the ontology
        this.ontoModel.read(ProductionKnowledgeDictionary.SOHO_NS.get());

        // parse the list of inference rules for knowledge processing
        List<Rule> rules = Rule.rulesFromURL("file:" + ruleFile);
        // create a generic rule-based reasoner
        GenericRuleReasoner reasoner = new GenericRuleReasoner(rules);
        reasoner.setOWLTranslation(true);
        reasoner.setTransitiveClosureCaching(true);

        // create an inference model attached to the ontological model schema
        this.infModel = ModelFactory.createInfModel(reasoner, this.ontoModel);

        // set file reference
        this.ontoFile = ontoFile;
        this.ruleFile = ruleFile;
    }


    /**
     *
     * @param ontoFile
     * @param ruleFile
     * @throws Exception
     */
    public void load(String ontoFile, String ruleFile)
            throws Exception
    {
        synchronized (lock) {
            while (!this.state.equals(ProductionKnowledgeState.NONE)) {
                lock.wait();
            }

            // set state
            this.state = ProductionKnowledgeState.WRITE_MODE;
        }

        try
        {
            // load ontological model
            this.doLoad(ontoFile, ruleFile);
            // update internal reference
            this.ontoFile = ontoFile;
            this.ruleFile = ruleFile;
        }
        finally
        {
            // release the lock
            synchronized (lock) {

                // notify subscribers
                for (ProductionKnowledgeUpdateSubscriber subscriber : subscribers) {
                    subscriber.update();
                }

                // set state
                this.state = ProductionKnowledgeState.NONE;
                // notify listeners
                lock.notifyAll();
            }
        }
    }

    /**
     *
     * @param ontoFile
     * @throws Exception
     */
    public void load(String ontoFile)
            throws Exception
    {
        synchronized (lock) {
            while (!this.state.equals(ProductionKnowledgeState.NONE)) {
                lock.wait();
            }

            // set state
            this.state = ProductionKnowledgeState.WRITE_MODE;
        }

        try
        {
            // load ontological model using the current rule file
            this.doLoad(ontoFile, this.ruleFile);
        }
        finally
        {
            // release the lock
            synchronized (lock) {

                // notify subscribers
                for (ProductionKnowledgeUpdateSubscriber subscriber : subscribers) {
                    subscriber.update();
                }

                // set state
                this.state = ProductionKnowledgeState.NONE;
                // notify listeners
                lock.notifyAll();
            }
        }
    }

    /**
     *
     * @throws InterruptedException
     */
    public void restore()
            throws InterruptedException
    {
        synchronized (lock) {
            while (!this.state.equals(ProductionKnowledgeState.NONE)) {
                lock.wait();
            }

            // set state
            this.state = ProductionKnowledgeState.WRITE_MODE;
        }

        try
        {
            // load ontological model
            this.doLoad(this.defaultOntoFile, this.defaultRuleFile);
            // update internal reference
            this.ontoFile = this.defaultOntoFile;
            this.ruleFile = this.defaultRuleFile;
        }
        finally
        {
            // release the lock
            synchronized (lock) {

                // notify subscribers
                for (ProductionKnowledgeUpdateSubscriber subscriber : subscribers) {
                    subscriber.update();
                }


                // set state
                this.state = ProductionKnowledgeState.NONE;
                // notify listeners
                lock.notifyAll();
            }
        }
    }

    /**
     *
     * @throws InterruptedException
     */
    public void beginReadTransaction()
            throws InterruptedException
    {
        synchronized (lock) {
            while (!this.state.equals(ProductionKnowledgeState.NONE) &&
                    !this.state.equals(ProductionKnowledgeState.READ_MODE)) {
                // wait
                lock.wait();
            }

            // set state
            this.state = ProductionKnowledgeState.READ_MODE;
            // set transaction flag
            this.readTransaction = true;
        }
    }

    /**
     *
     */
    public void finishReadTransaction() {
        synchronized (lock) {
            // set transaction flag
            this.readTransaction = false;
            // set state
            this.state = ProductionKnowledgeState.NONE;
            // release lock
            lock.notifyAll();
        }
    }

    /**
     * This method returns a list of Resource representing individuals of
     * a given ontology class
     *
     * @param classURI
     * @return
     * @throws InterruptedException
     */
    public List<Resource> getInstances(String classURI)
            throws InterruptedException, ProductionKnowledgeException
    {
        // check status lock
        synchronized (lock) {
            // check status
            while (!this.state.equals(ProductionKnowledgeState.NONE) &&
                !this.state.equals(ProductionKnowledgeState.READ_MODE)) {
                // wait
                lock.wait();
            }

            // set status
            this.state = ProductionKnowledgeState.READ_MODE;
        }


        // list of individuals
        List<Resource> list = new ArrayList<>();
        try
        {
            // get resource associated the class URI
            Resource c = ResourceFactory.createResource(classURI);
            // check if the model contains the resource
            if (!this.ontoModel.containsResource(c)) {
                // class not existing
                throw new ProductionKnowledgeException("No class found with URI  \"" + classURI + "\"");
            } else {
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

        }
        finally
        {
            // release the lock
            synchronized (lock) {
                // check read transaction
                if (!this.readTransaction) {
                    this.state = ProductionKnowledgeState.NONE;
                }

                // signal waiting threads
                lock.notifyAll();
            }
        }


        // get the list
        return list;

    }

    /**
     *
     * @param classURI
     * @return
     * @throws InterruptedException
     * @throws ProductionKnowledgeException
     */
    public List<Individual> getIndividuals(String classURI)
            throws InterruptedException, ProductionKnowledgeException
    {
        // check status lock
        synchronized (lock) {
            // check status
            while (!this.state.equals(ProductionKnowledgeState.NONE) &&
                    !this.state.equals(ProductionKnowledgeState.READ_MODE)) {
                // wait
                lock.wait();
            }

            // set status
            this.state = ProductionKnowledgeState.READ_MODE;
        }

        // list of individuals
        List<Individual> list = new ArrayList<>();
        try {
            // get resource associated the class URI
            Resource c = ResourceFactory.createResource(classURI);
            // check if the model contains the resource
            if (!this.ontoModel.containsResource(c)) {
                // class not existing
                throw new ProductionKnowledgeException("No class found with URI  \"" + classURI + "\"");
            } else {
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
        }
        finally
        {
            // release the lock
            synchronized (lock) {
                // check read transaction
                if (!this.readTransaction) {
                    // change state
                    this.state = ProductionKnowledgeState.NONE;
                }
                // signal waiting threads
                lock.notifyAll();
            }
        }

        // get the list
        return list;
    }

    /**
     * This method (re)binds the inference model to the underlying ontological
     * model by triggering the rule-based inference engine on the new/updated data
     * of the model
     *
     * @throws InterruptedException
     */
    public void rebind()
            throws InterruptedException
    {
        // check status lock
        synchronized (lock) {
            // check status
            while (!this.state.equals(ProductionKnowledgeState.NONE)) {
                // wait
                lock.wait();
            }

            // set status
            this.state = ProductionKnowledgeState.WRITE_MODE;
        }

        try {
            // bind the inference model to the underlying data/ontological model
            this.infModel.rebind();
        }
        finally {
            // release lock
            synchronized (lock) {

                // notify subscribers
                for (ProductionKnowledgeUpdateSubscriber subscriber : subscribers) {
                    subscriber.update();
                }


                this.state = ProductionKnowledgeState.NONE;
                // notify listeners
                lock.notifyAll();
            }
        }
    }

    /**
     *
     * @param uri
     * @return
     * @throws Exception
     */
    public Property getProperty(String uri)
            throws InterruptedException
    {
        // check status lock
        synchronized (lock) {
            // check status
            while (!this.state.equals(ProductionKnowledgeState.NONE) &&
                    !this.state.equals(ProductionKnowledgeState.READ_MODE)) {
                // wait
                lock.wait();
            }

            // set status
            this.state = ProductionKnowledgeState.READ_MODE;
        }

        try {
            // retrieve the property from the model
            return this.ontoModel.getProperty(uri);
        }
        finally
        {
            // release lock
            synchronized (lock) {
                // check transaction flag
                if (!this.readTransaction) {
                    // change state
                    this.state = ProductionKnowledgeState.NONE;
                }
                // notify listeners
                lock.notifyAll();
            }
        }
    }

    /**
     *
     * @param classUri
     * @return
     * @throws InterruptedException
     * @throws ProductionKnowledgeException
     */
    public Resource createIndividual(String classUri)
            throws InterruptedException, ProductionKnowledgeException
    {
        synchronized (lock) {
            while (!this.state.equals(ProductionKnowledgeState.NONE)) {
                lock.wait();
            }

            // set state
            this.state = ProductionKnowledgeState.WRITE_MODE;
        }

        // individual
        Resource ind = null;
        try {
            // create resource
            Resource rClass = ResourceFactory.createResource(classUri);
            // check if the ontology model contains the resource
            if (this.ontoModel.containsResource(rClass)) {
                // create a new individual of the class
                ind = this.ontoModel.createIndividual(
                        this.ontoModel.getResource(classUri)).asResource();
            } else {
                // invalid parameter
                throw new ProductionKnowledgeException("Unknown resource with URI \"" + classUri + "\"");
            }
        }
        finally {
            // release lock
            synchronized (lock) {

                // notify subscribers
                for (ProductionKnowledgeUpdateSubscriber subscriber : subscribers) {
                    subscriber.update();
                }


                this.state = ProductionKnowledgeState.NONE;
                // notify listeners
                lock.notifyAll();
            }
        }

        // get individual
        return ind;
    }

    /**
     *
     * @param classUri
     * @return
     * @throws InterruptedException
     * @throws ProductionKnowledgeException
     */
    public Resource createUniqueIndividual(String classUri)
            throws InterruptedException, ProductionKnowledgeException
    {
        synchronized (lock) {
            while (!this.state.equals(ProductionKnowledgeState.NONE)) {
                lock.wait();
            }

            // set state
            this.state = ProductionKnowledgeState.WRITE_MODE;
        }

        // individual
        Resource ind = null;

        try {
            // create resource
            Resource rClass = ResourceFactory.createResource(classUri);
            // check if the ontology model contains the resource
            if (this.ontoModel.containsResource(rClass)) {
                // create a new individual of the class
                ind = this.ontoModel.createIndividual(
                        this.ontoModel.getResource(classUri)).asResource();
            } else {
                // invalid parameter
                throw new ProductionKnowledgeException("Unknown resource with URI \"" + classUri + "\"");
            }

            // set different from siblings
            this.setDifferentFromSiblings(ind);
        }
        finally
        {
            // release lock
            synchronized (lock) {

                // notify subscribers
                for (ProductionKnowledgeUpdateSubscriber subscriber : subscribers) {
                    subscriber.update();
                }

                this.state = ProductionKnowledgeState.NONE;
                // notify listeners
                lock.notifyAll();
            }
        }
        // get individual
        return ind;
    }

    /**
     *
     * @param res
     * @throws InterruptedException
     * @throws ProductionKnowledgeException
     */
    public void setDifferentFromSiblings(Resource res)
            throws InterruptedException, ProductionKnowledgeException
    {
        synchronized (lock) {
            while (!this.state.equals(ProductionKnowledgeState.NONE)) {
                lock.wait();
            }

            // set state
            this.state = ProductionKnowledgeState.WRITE_MODE;
        }

        try
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
        finally {
            // release lock
            synchronized (lock) {

                // notify subscribers
                for (ProductionKnowledgeUpdateSubscriber subscriber : subscribers) {
                    subscriber.update();
                }

                this.state = ProductionKnowledgeState.NONE;
                // notify listeners
                lock.notifyAll();
            }
        }
    }

    /**
     *
     * @param res
     * @param others
     * @throws InterruptedException
     */
    public void setDifferentFromResources(Resource res, List<Resource> others)
            throws InterruptedException
    {
        synchronized (lock) {
            while (!this.state.equals(ProductionKnowledgeState.NONE)) {
                lock.wait();
            }

            // set state
            this.state = ProductionKnowledgeState.WRITE_MODE;
        }

        try {
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
        finally {
            // release lock
            synchronized (lock) {

                // notify subscribers
                for (ProductionKnowledgeUpdateSubscriber subscriber : subscribers) {
                    subscriber.update();
                }

                this.state = ProductionKnowledgeState.NONE;
                // notify listeners
                lock.notifyAll();
            }
        }
    }

    /**
     *
     * @param referenceUri
     * @param propertyUri
     * @param objectUri
     * @return
     * @throws InterruptedException
     */
    public Statement addAssertion(String referenceUri, String propertyUri, String objectUri)
            throws InterruptedException
    {
        synchronized (lock) {
            while (!this.state.equals(ProductionKnowledgeState.NONE)) {
                lock.wait();
            }

            // set state
            this.state = ProductionKnowledgeState.WRITE_MODE;
        }

        // prepare statement
        Statement stat = null;
        try {
            // check if property exists
            Property prop = this.infModel.getProperty(propertyUri);

            // check if reference resource exists
            Resource ref = this.infModel.getResource(referenceUri);
            // check if object resource exists
            Resource obj = this.infModel.getResource(objectUri);

            // create statement
            stat = this.infModel.createStatement(ref, prop, obj);
            // assert/add the statement
            this.infModel.add(stat);
        }
        finally {
            // release lock
            synchronized (lock) {

                // notify subscribers
                for (ProductionKnowledgeUpdateSubscriber subscriber : subscribers) {
                    subscriber.update();
                }


                this.state = ProductionKnowledgeState.NONE;
                // notify listeners
                lock.notifyAll();
            }
        }


        // get created statement
        return stat;
    }

    /**
     *
     * @param referenceUri
     * @param propertyUri
     * @param objectUri
     * @return
     * @throws InterruptedException
     */
    public  List<Statement> removeAssertion(String referenceUri, String propertyUri, String objectUri)
            throws InterruptedException
    {
        synchronized (lock) {
            while (!this.state.equals(ProductionKnowledgeState.NONE)) {
                lock.wait();
            }

            // set state
            this.state = ProductionKnowledgeState.WRITE_MODE;
        }

        // list of statements
        List<Statement> list = new ArrayList<>();

        try
        {
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
        }
        finally {
            // release lock
            synchronized (lock) {

                // notify subscribers
                for (ProductionKnowledgeUpdateSubscriber subscriber : subscribers) {
                    subscriber.update();
                }


                this.state = ProductionKnowledgeState.NONE;
                // notify listeners
                lock.notifyAll();
            }
        }

        // get the list of statements
        return list;
    }

    /**
     *
     * @param s
     * @param p
     * @param o
     * @return
     * @throws InterruptedException
     */
    public List<Statement> listStatements(String s, String p, String o)
            throws InterruptedException
    {
        // check status lock
        synchronized (lock) {
            // check status
            while (!this.state.equals(ProductionKnowledgeState.NONE) &&
                    !this.state.equals(ProductionKnowledgeState.READ_MODE)) {
                // wait
                lock.wait();
            }

            // set status
            this.state = ProductionKnowledgeState.READ_MODE;
        }

        // list of statement found
        List<Statement> list = new ArrayList<>();
        try
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


            // iterate over found statements
            Iterator<Statement> it = this.infModel.listStatements(subject, property, object);
            while (it.hasNext()) {
                list.add(it.next());
            }
        }
        finally {
            // release lock
            synchronized (lock) {
                // check transaction flag
                if (!this.readTransaction) {
                    // change state
                    this.state = ProductionKnowledgeState.NONE;
                }
                // notify listeners
                lock.notifyAll();
            }
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
     * @throws InterruptedException
     */
    public boolean hasResourceType(Resource resource, String classURI)
            throws InterruptedException
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
        for (Statement s : list) {
            // get statement type
            Resource type = s.getObject().asResource();
            // check if it corresponds to the desired type
            if (type != null && type.getURI() != null &&
                    type.getURI().toLowerCase().equals(classURI.toLowerCase())) {
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
     * @throws InterruptedException
     */
    public Map<Resource, Set<Resource>> retrieveResourceStructure(Resource resource)
            throws InterruptedException
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
     * @throws InterruptedException
     */
    public List<Resource> getProductionGoals()
            throws InterruptedException {

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
     *
     * @return
     * @throws InterruptedException
     */
    public List<Resource> getBinaryResources()
            throws InterruptedException  {

        // list of production goals
        List<Resource> resources = new ArrayList<>();

        // retrieve known individuals of SOHO:BinaryProductionLocation
        List<Statement> list = this.listStatements(
                null,
                ProductionKnowledgeDictionary.RDF_NS + "type",
                ProductionKnowledgeDictionary.SOHO_NS + "BinaryProductionLocation");

        // get resource
        for (Statement s : list) {
            // add the subject of the statement
            resources.add(s.getSubject());
        }

        // get the list
        return resources;
    }

    /**
     * The method reads the knowledge base to retrieve the list of
     * known autonomous agents.
     *
     * The method retrieves all known individuals of type SOHO:AutonomousAgent
     *
     * @return a list of resource of type SOHO:AutonomousAgent
     * @throws InterruptedException
     */
    public List<Resource> getAgents()
            throws InterruptedException
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
     * @throws InterruptedException
     */
    public List<Resource> getWorkOperators()
            throws InterruptedException
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
     * @throws InterruptedException
     */
    public List<Resource> getCobots()
            throws InterruptedException
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
     * @return
     * @throws InterruptedException
     */
    public List<Resource> getFunctions()
            throws InterruptedException
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
     *
     *
     * @param agent
     * @return a list of resource of type SOHO:Function
     * @throws InterruptedException
     */
    public List<Resource> getFunctionsByAgent(Resource agent)
            throws InterruptedException {

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
     * @throws InterruptedException
     * @throws ProductionKnowledgeException
     *
     */
    public List<Map<Resource, List<Set<Resource>>>> getDecompositionGraph(Resource pGoal)
            throws InterruptedException, ProductionKnowledgeException
    {
        // check parameter type
        if (!this.hasResourceType(pGoal, ProductionKnowledgeDictionary.SOHO_NS + "ProductionGoal")) {
            // wrong parameter type
            throw new ProductionKnowledgeException("Wrong parameter type, a resource/individual of type <" + ProductionKnowledgeDictionary.SOHO_NS + "ProductionGoal> expected:" +
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
     * @throws InterruptedException
     * @throws ProductionKnowledgeException
     */
    public Map<Resource, Set<Resource>> getDependencyGraph(Resource pGoal)
            throws InterruptedException, ProductionKnowledgeException
    {
        // check parameter type
        if (!this.hasResourceType(pGoal, ProductionKnowledgeDictionary.SOHO_NS + "ProductionGoal")) {
            // wrong parameter type
            throw new ProductionKnowledgeException("Wrong parameter type, a resource/individual of type <" + ProductionKnowledgeDictionary.SOHO_NS + "ProductionGoal> expected:" +
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
     * @throws InterruptedException,
     * @throws ProductionKnowledgeException
     */
    public List<List<Resource>> getProductionHierarchy(Resource pGoal)
            throws InterruptedException, ProductionKnowledgeException
    {
        // check parameter type
        if (!this.hasResourceType(pGoal, ProductionKnowledgeDictionary.SOHO_NS + "ProductionGoal")) {
            // wrong parameter type
            throw new ProductionKnowledgeException("Wrong parameter type, a resource/individual of type <" + ProductionKnowledgeDictionary.SOHO_NS + "ProductionGoal> expected:" +
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
     * @throws InterruptedException
     */
    private void retrieveProductionTaskDecomposition(Resource task, Map<Resource, List<Set<Resource>>> graph)
            throws InterruptedException
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
     *
     * @param resource
     * @param subtree
     * @throws InterruptedException
     */
    private void retrieveResourceStructure(Resource resource, Map<Resource, Set<Resource>> subtree)
            throws InterruptedException
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

    /**
     *
     * @param func
     * @return
     * @throws InterruptedException
     */
    public List<Statement> getFunctionDataProperties(Resource func)
            throws InterruptedException {


        // list statements
        List<Statement> list = new ArrayList<>();
        // add all statements
        list.addAll(this.listStatements(
                func.getURI() == null ? func.asNode().getBlankNodeLabel(): func.getURI(),
                ProductionKnowledgeDictionary.SOHO_NS + "hasProcedureName",
                null));

        // add all statements
        list.addAll(this.listStatements(
                func.getURI() == null ? func.asNode().getBlankNodeLabel(): func.getURI(),
                ProductionKnowledgeDictionary.SOHO_NS + "hasProcedureDescription",
                null));


        // add all statements
        list.addAll(this.listStatements(
                func.getURI() == null ? func.asNode().getBlankNodeLabel(): func.getURI(),
                ProductionKnowledgeDictionary.SOHO_NS + "hasProcedureId",
                null));


        // add all statements
        list.addAll(this.listStatements(
                func.getURI() == null ? func.asNode().getBlankNodeLabel(): func.getURI(),
                ProductionKnowledgeDictionary.SOHO_NS + "hasDuration",
                null));

        // add all statements
        list.addAll(this.listStatements(
                func.getURI() == null ? func.asNode().getBlankNodeLabel(): func.getURI(),
                ProductionKnowledgeDictionary.SOHO_NS + "hasDurationUncertainty",
                null));

        // get statements
        return list;
    }

    /**
     *
     * @param func
     * @return
     * @throws InterruptedException
     */
    public List<Statement> getFunctionObjectProperties(Resource func)
            throws InterruptedException {

        // list statements
        List<Statement> list = new ArrayList<>();
        // add all statements
        list.addAll(this.listStatements(
                func.getURI() == null ? func.asNode().getBlankNodeLabel(): func.getURI(),
                ProductionKnowledgeDictionary.SOHO_NS + "hasTarget",
                null));

        // add all statements
        list.addAll(this.listStatements(
                func.getURI() == null ? func.asNode().getBlankNodeLabel(): func.getURI(),
                ProductionKnowledgeDictionary.SOHO_NS + "requiresStartLocation",
                null));


        // add all statements
        list.addAll(this.listStatements(
                func.getURI() == null ? func.asNode().getBlankNodeLabel(): func.getURI(),
                ProductionKnowledgeDictionary.SOHO_NS + "requiresEndLocation",
                null));

        // get statements
        return list;
    }

    /**
     *
     * @param resource
     * @return
     * @throws InterruptedException
     * @throws ProductionKnowledgeException
     */
    public Resource getResourceType(Resource resource)
            throws InterruptedException, ProductionKnowledgeException
    {
        // check RDF:type statement
        Statement statement = resource.getProperty(this.getProperty(ProductionKnowledgeDictionary.RDF_NS + "type"));
        // check if statement exists
        if (statement == null) {
            // throw exception
            throw new ProductionKnowledgeException("Missing RDF:type property for resource\n" +
                    "- resource: " + resource.getURI() + "\n");
        }

        // get retrieve resource type
        return statement.getObject().asResource();
    }

    /**
     *
     * @param function
     * @return
     * @throws InterruptedException
     * @throws ProductionKnowledgeException
     */
    public Resource getFunctionTarget(Resource function)
            throws InterruptedException, ProductionKnowledgeException
    {

        // check SOHO:hasTarget statement
        Statement statement = function.getProperty(this.getProperty(ProductionKnowledgeDictionary.SOHO_NS + "hasTarget"));
        // check statement
        if (statement == null) {
            // throw exception
            throw new ProductionKnowledgeException("Missing SOHO:hasTarget property for resource\n" +
                    "- resource: " + function.getURI() + "\n");
        }

        // get target
        return statement.getObject().asResource();
    }
}
