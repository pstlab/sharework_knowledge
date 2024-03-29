package it.cnr.istc.pst.sharework.service;

import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import it.cnr.istc.pst.sharework.service.api.ApiQueryHandler;
import it.cnr.istc.pst.sharework.service.api.ApiQueryResult;
import it.cnr.istc.pst.sharework.service.api.ApiQueryType;
import it.cnr.istc.pst.sharework.service.api.ex.ApiQueryHandlingException;
import org.apache.commons.logging.Log;
import org.ros.exception.ServiceException;
import org.ros.node.ConnectedNode;
import org.ros.node.service.ServiceResponseBuilder;

import java.lang.reflect.Constructor;
import java.util.Arrays;

/**
 *
 */
public class KnowledgeServiceApiResponseBuilder implements ServiceResponseBuilder<sharework_knowledge_msgs.KnowledgeAPIEndPointRequest, sharework_knowledge_msgs.KnowledgeAPIEndPointResponse>
{
    private Log log;
    private KnowledgeService service;
    private ConnectedNode cNode;

    /**
     *
     * @param log
     * @param service
     * @param node
     */
    protected KnowledgeServiceApiResponseBuilder(Log log,
                                                 KnowledgeService service,
                                                 ConnectedNode node)
    {
        this.log = log;
        this.service = service;
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
    public void build(sharework_knowledge_msgs.KnowledgeAPIEndPointRequest request,
                      sharework_knowledge_msgs.KnowledgeAPIEndPointResponse response)
            throws ServiceException
    {
        // get query type
        String queryType = request.getQueryType();
        // check query
        if (queryType == null || queryType.equals("")) {
            // missing query type
            response.setResult("ERROR");
            response.setExplanation("Missing query type... available queries:\n" +
                    "" + Arrays.toString(ApiQueryType.values()) + "\n" );
        }
        else if (!ApiQueryType.exists(queryType)) {
            // unknown query type
            response.setResult("ERROR");
            response.setExplanation("Unknown query type \"" + queryType + "\"... available queries:\n" +
                            "" + Arrays.toString(ApiQueryType.values()) + "\n");
        }
        else
        {
            try
            {
                // get query type
                ApiQueryType qType = ApiQueryType.getType(queryType);
                // get handler class
                Class<? extends ApiQueryHandler<?>> hClass = qType.getHandlerClass();
                // get declared constructor
                Constructor<? extends ApiQueryHandler<?>> c = hClass.getDeclaredConstructor(ProductionKnowledge.class);
                // set accessible
                c.setAccessible(true);
                // create handler instance by reflection
                ApiQueryHandler<?> qHandler = (ApiQueryHandler<?>) c.newInstance(this.service.knowledge);

                // do handle query and get query result
                ApiQueryResult result = qHandler.handle(request);
                // prepare service response
                result.prepare(response, this.cNode);
            }
            catch (ApiQueryHandlingException ex) {
                // unknown query
                response.setResult("FAILURE");
                // set explanation
                response.setExplanation("Query handling error (" + queryType + "):\n" +
                        "- message: " + ex.getMessage() + "\n");
            }
            catch (Exception ex) {
                // unknown query
                response.setResult("ERROR");
                // set explanation
                response.setExplanation("Error while creating query handler (" + queryType + "):\n" +
                        "- message: " + ex.getMessage() + "\n");
            }
        }
    }

}
