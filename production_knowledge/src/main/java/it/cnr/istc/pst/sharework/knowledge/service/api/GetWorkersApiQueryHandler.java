package it.cnr.istc.pst.sharework.knowledge.service.api;

import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import it.cnr.istc.pst.sharework.knowledge.service.api.ex.ApiQueryHandlingException;
import org.apache.jena.rdf.model.Resource;
import org.ros.node.ConnectedNode;
import sharework_knowledge_msgs.KnowledgeAPIEndPointResponse;
import sharework_knowledge_msgs.KnowledgeRDFResource;

import java.util.ArrayList;
import java.util.List;

/**
 *
 */
public class GetWorkersApiQueryHandler extends ApiQueryHandler<GetWorkersApiQueryResult>
{
    /**
     *
     * @param knowledge
     */
    protected GetWorkersApiQueryHandler(ProductionKnowledge knowledge) {
        super(ApiQueryType.GET_WORKERS, knowledge);
    }

    /**
     *
     * @return
     */
    @Override
    public GetWorkersApiQueryResult  handle(sharework_knowledge_msgs.KnowledgeAPIEndPointRequest request)
            throws ApiQueryHandlingException
    {
        // prepare response
        GetWorkersApiQueryResult response = new GetWorkersApiQueryResult();

        // get resources representing known workers
        List<Resource> goals = this.knowledge.getWorkOperators();
        for (Resource goal : goals) {
            // add the goal the the response
            response.addResource(goal);
        }

        // get result
        return response;
    }
}


/**
 *
 */
class GetWorkersApiQueryResult extends ApiQueryResult {

    private List<Resource> resources;

    /**
     *
     */
    protected GetWorkersApiQueryResult() {
        this.resources = new ArrayList<Resource>();
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
    public void prepare(KnowledgeAPIEndPointResponse response, ConnectedNode cNode)
    {
        // prepare the response data
        List<sharework_knowledge_msgs.KnowledgeRDFResource> data = new ArrayList<>();
        // convert response content
        for (Resource res : this.resources) {
            // create resource
            sharework_knowledge_msgs.KnowledgeRDFResource r = cNode
                    .getTopicMessageFactory().newFromType(KnowledgeRDFResource._TYPE);
            // set fields
            r.setName(res.getLocalName());
            r.setUri(res.getURI());
            // add resource to list
            data.add(r);
        }


        // set response data
        response.setResources(data);
        response.setResult("SUCCESS");
        response.setExplanation("List of knowledge RDF resources representing known workers");
    }
}