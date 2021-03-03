package it.cnr.istc.pst.sharework.knowledge.service.api;

import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;

/**
 *
 */
public abstract class ApiQueryHandler<T extends ApiQueryResult>
{
    private ApiQueryType type;
    protected ProductionKnowledge knowledge;

    /**
     *
     * @param type
     * @param knowledge
     */
    protected ApiQueryHandler(ApiQueryType type, ProductionKnowledge knowledge) {
        this.type = type;
        this.knowledge = knowledge;
    }

    /**
     *
     * @return
     */
    public ApiQueryType getType() {
        return type;
    }

    /**
     *
     * @return
     */
    public abstract T handle();
}
