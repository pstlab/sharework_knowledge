package it.cnr.istc.pst.sharework.knowledge.service;

import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import it.cnr.istc.pst.sharework.knowledge.service.api.ApiQueryHandler;
import it.cnr.istc.pst.sharework.knowledge.service.api.ApiQueryResult;
import it.cnr.istc.pst.sharework.knowledge.service.api.ApiQueryType;
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
    private ProductionKnowledge knowledge;
    private ConnectedNode cNode;

    /**
     *
     * @param log
     * @param knowledge
     * @param node
     */
    protected KnowledgeServiceApiResponseBuilder(Log log, ProductionKnowledge knowledge, ConnectedNode node) {
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
                    "" + Arrays.toString(ApiQueryType.values()) + "\n" );
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
                ApiQueryHandler<?> qHandler = (ApiQueryHandler<?>) c.newInstance(this.knowledge);

                // do handle query and get query result
                ApiQueryResult result = qHandler.handle();
                // prepare service response
                result.prepare(response, this.cNode);
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
