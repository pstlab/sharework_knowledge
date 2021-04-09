package it.cnr.istc.pst.sharework.service.api;

import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import it.cnr.istc.pst.sharework.service.api.ex.ApiQueryHandlingException;
import org.apache.jena.rdf.model.Resource;
import org.ros.node.ConnectedNode;
import sharework_knowledge_msgs.KnowledgeAPIEndPointResponse;
import sharework_knowledge_msgs.KnowledgeRDFResource;

import java.util.ArrayList;
import java.util.List;

/**
 *
 */
public class GetProductionGoalsApiQueryHandler extends ApiQueryHandler<GetProductionGoalsApiQueryResult>
{
    /**
     *
     * @param knowledge
     */
    protected GetProductionGoalsApiQueryHandler(ProductionKnowledge knowledge) {
        super(ApiQueryType.GET_PRODUCTION_GOALS, knowledge);
    }

    /**
     *
     * @return
     */
    @Override
    public GetProductionGoalsApiQueryResult  handle(sharework_knowledge_msgs.KnowledgeAPIEndPointRequest request)
            throws ApiQueryHandlingException
    {
        // prepare response
        GetProductionGoalsApiQueryResult response = new GetProductionGoalsApiQueryResult();
        try
        {
            // get resources representing known production goals
            List<Resource> goals = this.knowledge.getProductionGoals();
            for (Resource goal : goals) {
                // add the goal the the response
                response.addResource(goal);
            }
        }
        catch (Exception ex) {
            throw new ApiQueryHandlingException(ex.getMessage());
        }

        // get result
        return response;
    }

}


/**
 *
 */
class GetProductionGoalsApiQueryResult extends ApiQueryResult
{
    private List<Resource> resources;

    /**
     *
     */
    protected GetProductionGoalsApiQueryResult() {
        this.resources = new ArrayList<>();
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
     * @return
     */
    public List<Resource> getResources() {
        return new ArrayList<>(resources);
    }

    /**
     *
     * @param response
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
        response.setExplanation("List of knowledge RDF resources representing known production goals");
    }

}

