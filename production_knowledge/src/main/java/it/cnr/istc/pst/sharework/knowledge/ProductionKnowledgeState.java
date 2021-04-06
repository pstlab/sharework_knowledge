package it.cnr.istc.pst.sharework.knowledge;

/**
 *
 */
public enum ProductionKnowledgeState
{
    /**
     * No process is performing any operation on the knowledge base
     */
    NONE,

    /**
     * The knowledge base is in write-mode and no operation is allowed in parallel
     */
    WRITE_MODE,

    /**
     * The knowledge base is in read-mode and only read operations are allowed in parallel
     */
    READ_MODE;
}
