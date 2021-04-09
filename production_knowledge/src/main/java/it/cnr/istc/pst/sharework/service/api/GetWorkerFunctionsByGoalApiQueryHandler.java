package it.cnr.istc.pst.sharework.service.api;

import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import it.cnr.istc.pst.sharework.service.api.ex.ApiQueryHandlingException;
import org.apache.jena.rdf.model.Resource;
import org.ros.node.ConnectedNode;
import sharework_knowledge_msgs.KnowledgeAPIEndPointRequest;
import sharework_knowledge_msgs.KnowledgeAPIEndPointResponse;

import java.util.ArrayList;
import java.util.List;

/**
 *
 */
public class GetWorkerFunctionsByGoalApiQueryHandler extends ApiQueryHandler<GetWorkerFunctionsByGoalApiQueryResult>
{
    /**
     *
     * @param knowledge
     */
    protected GetWorkerFunctionsByGoalApiQueryHandler(ProductionKnowledge knowledge) {
        super(ApiQueryType.GET_WORKER_FUNCTIONS_GOAL, knowledge);
    }


    /**
     *
     * @param request
     * @return
     * @throws ApiQueryHandlingException
     */
    @Override
    public GetWorkerFunctionsByGoalApiQueryResult handle(KnowledgeAPIEndPointRequest request)
            throws ApiQueryHandlingException
    {
        return null;
    }
}

/**
 *
 */
class GetWorkerFunctionsByGoalApiQueryResult extends ApiQueryResult
{
    private List<Resource> resources;

    /**
     *
     */
    protected GetWorkerFunctionsByGoalApiQueryResult() {
        this.resources = new ArrayList<>();
    }

    /**
     *
     * @return
     */
    public List<Resource> getResources() {
        return new ArrayList<>(resources);
    }

    /**
     *
     * @param res
     */
    public void addResource(Resource res) {
        if (!this.resources.contains(res)) {
            this.resources.add(res);
        }
    }

    /**
     *
     * @param response
     * @param cNode
     */
    @Override
    public void prepare(KnowledgeAPIEndPointResponse response, ConnectedNode cNode) {

    }
}
