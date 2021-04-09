package it.cnr.istc.pst.sharework.service.api;

import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import it.cnr.istc.pst.sharework.service.api.ex.ApiQueryHandlingException;
import org.apache.jena.rdf.model.Resource;
import org.ros.node.ConnectedNode;
import sharework_knowledge_msgs.KnowledgeAPIEndPointResponse;

import java.util.ArrayList;
import java.util.List;


/**
 *
 */
public class GetWorkerProfileApiQueryHandler extends ApiQueryHandler<GetWorkersApiQueryResult>
{
    /**
     *
     * @param knowledge
     */
    protected GetWorkerProfileApiQueryHandler(ProductionKnowledge knowledge) {
        super(ApiQueryType.GET_WORKER_PROFILE, knowledge);
    }

    /**
     *
     * @return
     */
    @Override
    public GetWorkersApiQueryResult  handle(sharework_knowledge_msgs.KnowledgeAPIEndPointRequest request)
            throws ApiQueryHandlingException
    {
        return null;
    }
}


/**
 *
 */
class GetWorkerProfileApiQueryResult extends ApiQueryResult
{
    private List<Resource> resources;

    /**
     *
     */
    protected GetWorkerProfileApiQueryResult() {
        this.resources = new ArrayList<>();
    }

    /**
     *
     */
    public List<Resource> getResources() {
        return new ArrayList<>(this.resources);
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
