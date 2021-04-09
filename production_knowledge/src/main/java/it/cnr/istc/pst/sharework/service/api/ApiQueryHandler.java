package it.cnr.istc.pst.sharework.service.api;

import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import it.cnr.istc.pst.sharework.service.api.ex.ApiQueryHandlingException;

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
     * @param request
     * @return
     */
    public abstract T handle(sharework_knowledge_msgs.KnowledgeAPIEndPointRequest request)
            throws ApiQueryHandlingException;
}
