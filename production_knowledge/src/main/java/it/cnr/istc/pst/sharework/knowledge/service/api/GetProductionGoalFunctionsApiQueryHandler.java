package it.cnr.istc.pst.sharework.knowledge.service.api;

import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import org.apache.jena.rdf.model.Resource;
import org.ros.node.ConnectedNode;
import sharework_knowledge_msgs.KnowledgeAPIEndPointResponse;

import java.util.ArrayList;
import java.util.List;

/**
 *
 */
public class GetProductionGoalFunctionsApiQueryHandler extends ApiQueryHandler<GetProductionGoalFunctionsApiQueryResult>
{
    /**
     *
     * @param knowledge
     */
    protected GetProductionGoalFunctionsApiQueryHandler(ProductionKnowledge knowledge) {
        super(ApiQueryType.GET_PRODUCTION_GOAL_FUNCTIONS, knowledge);
    }

    /**
     *
     * @return
     */
    @Override
    public GetProductionGoalFunctionsApiQueryResult handle()
    {
        // prepare response data
        GetProductionGoalFunctionsApiQueryResult response = new GetProductionGoalFunctionsApiQueryResult();


        /*
         * TODO : to complete
         */


        // get the response
        return response;
    }
}


/**
 *
 */
class GetProductionGoalFunctionsApiQueryResult extends ApiQueryResult
{
    private List<Resource> resources;

    /**
     *
     */
    protected GetProductionGoalFunctionsApiQueryResult() {
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


        /**
         * TODO: to complete
         */


        // set response data
        response.setResources(data);
        response.setResult("SUCCESS");
        response.setExplanation("List of knowledge RDF resources representing known functions associated to the given goal");
    }
}
