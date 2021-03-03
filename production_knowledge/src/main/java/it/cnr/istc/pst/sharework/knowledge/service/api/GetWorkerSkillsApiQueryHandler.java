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
public class GetWorkerSkillsApiQueryHandler extends ApiQueryHandler<GetWorkerSkillsApiQueryResult> {

    /**
     *
     * @param knowledge
     */
    protected GetWorkerSkillsApiQueryHandler(ProductionKnowledge knowledge) {
        super(ApiQueryType.GET_WORKER_SKILLS, knowledge);
    }

    /**
     *
     * @return
     */
    @Override
    public GetWorkerSkillsApiQueryResult  handle(sharework_knowledge_msgs.KnowledgeAPIEndPointRequest request)
            throws ApiQueryHandlingException
    {
        return null;
    }
}


/**
 *
 */
class GetWorkerSkillsApiQueryResult extends ApiQueryResult {

    private List<Resource> resource;

    /**
     *
     */
    protected GetWorkerSkillsApiQueryResult() {
        this.resource = new ArrayList<>();
    }

    /**
     *
     * @return
     */
    public List<Resource> getResource() {
        return new ArrayList<>(this.resource);
    }

    /**
     *
     * @param res
     */
    public void addResource(Resource res) {
        if (!this.resource.contains(res)) {
            this.resource.add(res);
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
