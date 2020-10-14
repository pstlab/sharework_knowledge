package it.cnr.istc.pst.sharework.knowledge.owl.dictionary;

/**
 * Dictionary of the Sharework ontology for Human-Robot Collaboration
 */
public enum SOHO
{
    RDF_NS("http://www.w3.org/1999/02/22-rdf-syntax-ns#"),

    RDFS_NS("http://www.w3.org/2000/01/rdf-schema#"),

    //DUL_NS("http://ontologydesignpatterns.org/ont/dul/DUL.owl#"),
    DUL_NS("http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#"),

    SSN_NS("http://purl.oclc.org/NET/ssnx/ssn#"),

    NS("http://pst.istc.cnr.it/ontologies/2019/01/soho#");


    private String value;

    /**
     *
     * @param value
     */
    private SOHO(String value) {
        this.value = value;
    }

    /**
     *
     * @return
     */
    @Override
    public String toString() {
        return value;
    }

    /**
     *
     * @return
     */
    public static String getNS() {
        return SOHO.NS.value;
    }
}
