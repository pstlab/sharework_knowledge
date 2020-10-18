package it.cnr.istc.pst.sharework.service;

import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import org.apache.commons.logging.Log;
import org.apache.jena.rdf.model.Resource;
import org.ros.exception.ServiceException;
import org.ros.node.ConnectedNode;
import org.ros.node.service.ServiceResponseBuilder;
import sharework_knowledge_msgs.KnowledgeRDFResource;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 */
public class KnowledgeServiceAPIResponseBuilder implements ServiceResponseBuilder<sharework_knowledge_msgs.KnowledgeAPIEndPointRequest, sharework_knowledge_msgs.KnowledgeAPIEndPointResponse>
{
    private Log log;
    private ProductionKnowledge knowledge;
    private ConnectedNode cNode;

    /**
     *
     * @param log
     * @param knowledge
     * @param node
     */
    protected KnowledgeServiceAPIResponseBuilder(Log log, ProductionKnowledge knowledge, ConnectedNode node) {
        this.log = log;
        this.knowledge = knowledge;
        this.cNode = node;
    }

    /**
     * 
     * @return
     */
    public static String getServiceType() {
        return sharework_knowledge_msgs.KnowledgeAPIEndPoint._TYPE;
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServiceException
     */
    @Override
    public void build(sharework_knowledge_msgs.KnowledgeAPIEndPointRequest request, sharework_knowledge_msgs.KnowledgeAPIEndPointResponse response)
            throws ServiceException
    {
        // get query type
        String queryType = request.getQueryType();
        // check query
        if (queryType == null || queryType.equals("")) {
            // missing query type
            response.setResult("FAILURE");
            response.setExplanation("Missing query type... available queries:\n" +
                    "" + Arrays.toString(KnowledgeServiceAPIQueryType.values()) + "\n" );
        }
        else
        {
            try
            {
                // get query type
                KnowledgeServiceAPIQueryType type = KnowledgeServiceAPIQueryType.getType(queryType);
                // handler request
                switch (type)
                {
                    // get goals
                    case GET_PRODUCTION_GOALS:
                    {
                        // get resources representing known production goals
                        List<Resource> goals = this.knowledge.getProductionGoals();
                        // prepare response data
                        List<sharework_knowledge_msgs.KnowledgeRDFResource> resources = new ArrayList<>();
                        for (Resource goal : goals)
                        {
                            // create resource
                            sharework_knowledge_msgs.KnowledgeRDFResource res = this.cNode
                                    .getTopicMessageFactory().newFromType(KnowledgeRDFResource._TYPE);
                            // set fields
                            res.setName(goal.getLocalName());
                            res.setUri(goal.getURI());
                            // add resource to list
                            resources.add(res);
                        }

                        // set response data
                        response.setResources(resources);
                        response.setResult("SUCCESS");
                        response.setExplanation("List of knowledge RDF resources representing known production goals");
                    }
                    break;

                    // get funcs
                    case GET_PRODUCTION_GOAL_FUNCTIONS:
                    {
                        // prepare response data
                        List<sharework_knowledge_msgs.KnowledgeRDFResource> resources = new ArrayList<>();

                        /*
                         * TODO : to complete
                         */

                        // set response data
                        response.setResources(resources);
                        response.setResult("SUCCESS");
                        response.setExplanation("List of knowledge RDF resources representing functions (i.e., skills and operations) needed to carry out the given production goal ");
                    }
                    break;
                }
            }
            catch (Exception ex) {
                // unknown query
                response.setResult("FAILURE");
                // set explanation
                response.setExplanation("Unknown query type \"" + request.getQueryType() + "\"");
            }
        }

    }

}
