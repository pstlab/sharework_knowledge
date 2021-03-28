package it.cnr.istc.pst.sharework.knowledge.authoring;

import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import it.cnr.istc.pst.platinum.ai.framework.domain.component.PlanDataBase;

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

    /**
     * s
     * @return
     * @throws Exception
     */
    public abstract PlanDataBase compileAndValidate()
            throws Exception;
}
