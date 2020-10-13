package it.cnr.istc.pst.sharework.knowledge.persistence;

import org.apache.jena.query.Dataset;
import org.apache.jena.query.ReadWrite;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.tdb.TDBFactory;

/**
 * It implements core functionalities enabling continuous
 * knowledge refinement and runtime access to (persisted)
 * knowledge
 *
 * The knowledge is stored as an RDF-based Knowledge Graph and
 * can therefore information can be retrieved using standard
 * SPARQL queries
 */
public class TDBKnowledgeGraphFacade {
    private String dbName;              // persistence storage name
    private Dataset dataset;            // knowledge graph dataset

    /**
     * This method initializes the facade by creating an empty dataset
     * with the given name
     *
     * @param name
     */
    public TDBKnowledgeGraphFacade(String name) {
        // set persistence storage name
        this.dbName = name;
        // set the dataset
        this.dataset = TDBFactory.createDataset(this.dbName);
    }

    /**
     * This method simply initializes the facade without making 
     * any operation on any stored dataset
     */
    public TDBKnowledgeGraphFacade() {
        // do nothing
        this.dbName = null;
        this.dataset = null;
    }

    /**
     * This method loads a dataset using assembler
     * 
     * @param assemblerFile
     */
    public void loadFromAssembler(String assemblerFile) {
        // set persistence storage name
        this.dbName = assemblerFile;
        // load dataset through assembler
        this.dataset = TDBFactory.assembleDataset(assemblerFile);
    }

    /**
     * Just some simple testing
     *
     * @throws Exception
     */
    public void doReadSomeData()
            throws Exception
    {
        // check if a dataset has been loaded
        if (this.dataset == null) {
            throw new Exception("No dataset loaded");
        }

        // start a read transaction
        this.dataset.begin(ReadWrite.READ);

        // get the default model
        Model model = this.dataset.getDefaultModel();

        // close read transaction
        this.dataset.end();
    }

    /**
     * Just some simple testing
     *
     * @throws Exception
     */
    public void doWriteSomeData()
            throws Exception
    {
        // check if a dataset has been loaded
        if (this.dataset == null) {
            throw new Exception("No dataset loaded");
        }

        // start write transaction
        this.dataset.begin(ReadWrite.WRITE);

        // get the default model
        Model model = this.dataset.getDefaultModel();

        // close write transaction
        this.dataset.end();
    }

}
