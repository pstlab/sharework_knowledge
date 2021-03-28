package it.cnr.istc.pst.sharework.knowledge.authoring;

import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;

/**
 *
 */
public abstract class ProductionKnowledgeAuthoring
{
    protected ProductionKnowledge knowledge;

    /**
     *
     */
    public ProductionKnowledgeAuthoring() {
        this.knowledge = null;
    }

    /**
     *
     * @param ontoPath
     */
    public void setProductionKnowledge(String ontoPath) {
        this.knowledge = new ProductionKnowledge(ontoPath);
    }

    /**
     *
     * @param knowledge
     */
    public void setProductionKnowledge(ProductionKnowledge knowledge) {
        this.knowledge = knowledge;
    }

    /**
     * s
     * @return
     * @throws Exception
     */
    public abstract  String compile()
            throws Exception;
}
