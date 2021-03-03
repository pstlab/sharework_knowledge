package it.cnr.istc.pst.sharework.knowledge.service.api;

import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import it.cnr.istc.pst.sharework.knowledge.service.api.ex.ApiQueryHandlingException;
import org.apache.jena.rdf.model.Resource;
import org.ros.node.ConnectedNode;
import sharework_knowledge_msgs.KnowledgeAPIEndPointRequest;
import sharework_knowledge_msgs.KnowledgeAPIEndPointResponse;

import java.util.ArrayList;
import java.util.List;


/**
 *
 */
public class GetCobotCapabilitiesApiQueryHandler extends ApiQueryHandler<GetCobotCapabilitiesApiQueryResult> {

    /**
     *
     * @param knowledge
     */
    protected GetCobotCapabilitiesApiQueryHandler(ProductionKnowledge knowledge) {
        super(ApiQueryType.GET_COBOT_CAPABILITIES, knowledge);
    }

    /**
     *
     * @param request
     * @return
     * @throws ApiQueryHandlingException
     */
    @Override
    public GetCobotCapabilitiesApiQueryResult handle(KnowledgeAPIEndPointRequest request) throws ApiQueryHandlingException {
        return null;
    }
}

class GetCobotCapabilitiesApiQueryResult extends ApiQueryResult
{
    private List<Resource> resources;

    /**
     *
     */
    protected GetCobotCapabilitiesApiQueryResult() {
        this.resources = new ArrayList<>();
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
