package it.cnr.istc.pst.sharework.knowledge;

/**
 * Dictionary of the Sharework Production Knwolledge for Human-Robot Collaboration
 */
public enum ProductionKnowledgeDictionary
{
    RDF_NS("http://www.w3.org/1999/02/22-rdf-syntax-ns#"),

    RDFS_NS("http://www.w3.org/2000/01/rdf-schema#"),

    //DUL_NS("http://ontologydesignpatterns.org/ont/dul/DUL.owl#"),
    DUL_NS("http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#"),

    SSN_NS("http://purl.oclc.org/NET/ssnx/ssn#"),

    SOHO_NS("http://pst.istc.cnr.it/ontologies/2019/01/soho#");


    private String value;

    /**
     *
     * @param value
     */
    private ProductionKnowledgeDictionary(String value) {
        this.value = value;
    }

    /**
     *
     * @return
     */
    public String get() {
        return this.value;
    }

    /**
     *
     * @return
     */
    @Override
    public String toString() {
        return value;
    }

}
