package it.cnr.istc.pst.sharework.knowledge;

import it.cnr.istc.pst.sharework.knowledge.owl.dictionary.SOHO;
import org.apache.jena.ontology.Individual;
import org.apache.jena.ontology.OntModel;
import org.apache.jena.ontology.OntModelSpec;
import org.apache.jena.rdf.model.*;
import org.apache.jena.reasoner.Reasoner;
import org.apache.jena.reasoner.ReasonerFactory;
import org.apache.jena.reasoner.rulesys.GenericRuleReasoner;
import org.apache.jena.reasoner.rulesys.RDFSRuleReasoner;
import org.apache.jena.reasoner.rulesys.RDFSRuleReasonerFactory;
import org.apache.jena.reasoner.rulesys.Rule;
import org.apache.jena.riot.RDFDataMgr;
import org.apache.jena.vocabulary.ReasonerVocabulary;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

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
     * OWL semantics (OWLMini) to refine the internal knowledge graph.
     *
     */
    public ProductionKnowledge()
    {
        // set ontology file
        this.ontoFile = SHAREWORK_KNOWLEDGE_HOME + "etc/soho_core_v1.owl";
        this.ruleFile = SHAREWORK_KNOWLEDGE_HOME + "etc/soho_rules_v1.0.rules";

        // create an ontological model from SOHO
        this.ontoModel = ModelFactory.createOntologyModel(
                OntModelSpec.RDFS_MEM_TRANS_INF
        );

        // use DocumentManager API to specify that onto is replicated locally on disk
        this.ontoModel.getDocumentManager().addAltEntry(SOHO.getNS(), "file:" + this.ontoFile);
        // actually load the ontology
        this.ontoModel.read(SOHO.getNS());


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
}
