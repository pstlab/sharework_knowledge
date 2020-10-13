package it.cnr.istc.pst.sharework.knowledge;

import it.cnr.istc.pst.sharework.knowledge.owl.dictionary.SOHO;
import org.apache.jena.ontology.Individual;
import org.apache.jena.ontology.OntModel;
import org.apache.jena.ontology.OntModelSpec;
import org.apache.jena.rdf.model.InfModel;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.rdf.model.Resource;
import org.apache.jena.reasoner.rulesys.GenericRuleReasoner;
import org.apache.jena.reasoner.rulesys.Rule;
import org.apache.jena.vocabulary.ReasonerVocabulary;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Apache Jena-based implementation of Production Knowledge interface
 */
public class ProductionKnowledge
{
    private String ontoFile;        // file with the ontology
    private String ruleFile;        // file with the inference rules

    private OntModel ontoModel;         // reference to the ontology model
    private InfModel infModel;          // the actual knowledge performing inference

    /**
     * Load Production Knowledge on default ontoloy file
     */
    public ProductionKnowledge() {
        // set ontology file
        this.ontoFile = "etc/soho_core_v1.owl";
        this.ruleFile = "etc/soho_rules_v1.0.rules";
    }

    /**
     * Load Production Knowledge on the specified ontology file
     *
     * @param ontoFile
     * @param ruleFile
     */
    public ProductionKnowledge(String ontoFile, String ruleFile) {
        // set ontology file
        this.ontoFile = ontoFile;
        this.ruleFile = ruleFile;
    }

    /**
     * Setup OWL Model
     */
    private void setupModel() {
        // create a model schema from the ontology
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
        // configure reasoner - use forward chaining RETE rule engine
        reasoner.setParameter(ReasonerVocabulary.PROPruleMode, "forwardRETE");
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
}
