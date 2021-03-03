package it.cnr.istc.pst.sharework.knowledge.service.api;

import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import it.cnr.istc.pst.sharework.knowledge.service.api.ex.ApiQueryHandlingException;
import org.apache.jena.rdf.model.Resource;
import org.ros.node.ConnectedNode;
import sharework_knowledge_msgs.KnowledgeAPIEndPointResponse;

import java.util.ArrayList;
import java.util.List;

/**
 *
 */
public class GetWorkerFunctionsApiQueryHandler extends ApiQueryHandler<GetWorkerFunctionsApiResult>
{

    /**
     *
     * @param knowledge
     */
    protected GetWorkerFunctionsApiQueryHandler(ProductionKnowledge knowledge) {
        super(ApiQueryType.GET_WORKER_FUNCTIONS, knowledge);
    }

    /**
     *
     * @return
     */
    @Override
    public GetWorkerFunctionsApiResult  handle(sharework_knowledge_msgs.KnowledgeAPIEndPointRequest request)
            throws ApiQueryHandlingException
    {
        return null;
    }
}

/**
 *
 */
class GetWorkerFunctionsApiResult extends ApiQueryResult
{
    private List<Resource> resources;

    /**
     *
     */
    protected GetWorkerFunctionsApiResult() {
        this.resources = new ArrayList<>();
    }

    /**
     *
     * @return
     */
    public List<Resource> getResources() {
        return new ArrayList<>(this.resources);
    }

    /**
     *
     * @param res
     */
    public void addResource(Resource res)  {
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
