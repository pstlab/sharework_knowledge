package it.cnr.istc.pst.sharework.knowledge.service;

import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import it.cnr.istc.pst.sharework.knowledge.service.update.UpdateQueryType;
import org.apache.commons.logging.Log;
import org.apache.jena.rdf.model.Statement;
import org.ros.exception.ServiceException;
import org.ros.node.ConnectedNode;
import org.ros.node.service.ServiceResponseBuilder;
import sharework_knowledge_msgs.KnowledgeRDFTriple;
import sharework_knowledge_msgs.KnowledgeRDFUpdatePointRequest;
import sharework_knowledge_msgs.KnowledgeRDFUpdatePointResponse;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 */
public class KnowledgeUpdateServiceResponseBuilder implements ServiceResponseBuilder<sharework_knowledge_msgs.KnowledgeRDFUpdatePointRequest, sharework_knowledge_msgs.KnowledgeRDFUpdatePointResponse>
{
    private Log log;
    private ProductionKnowledge knowledge;
    private ConnectedNode cNode;

    /**
     *
     * @param log
     * @param knowledge
     */
    protected KnowledgeUpdateServiceResponseBuilder(Log log,
                                                    ProductionKnowledge knowledge,
                                                    ConnectedNode node)
    {
        this.log = log;
        this.knowledge = knowledge;
        this.cNode = node;
    }

    /**
     *
     * @return
     */
    public static String getServiceType() {
        return sharework_knowledge_msgs.KnowledgeRDFUpdatePoint._TYPE;
    }

    /**
     *
     * @param knowledgeRDFUpdatePointRequest
     * @param knowledgeRDFUpdatePointResponse
     * @throws ServiceException
     */
    @Override
    public void build(KnowledgeRDFUpdatePointRequest knowledgeRDFUpdatePointRequest,
                      KnowledgeRDFUpdatePointResponse knowledgeRDFUpdatePointResponse)
            throws ServiceException
    {
        // check request type
        String updateType = knowledgeRDFUpdatePointRequest.getUpdateType();
        try
        {
            // get known update
            UpdateQueryType type = UpdateQueryType.getType(updateType);
            // check type
            switch (type)
            {
                case ASSERT_PROPERTY: {
                    // TODO
                }
                break;

                case DELETE_PROPERTY: {
                    // TODO
                }
                break;

                case CREATE_INDIVIDUAL: {
                    // TODO
                }
                break;

                case CREATE_DISTINCT_INDIVIDUAL: {
                    // TODO
                }
                break;
            }
        }
        catch (Exception ex) {
            // unknown query type
            throw new ServiceException("Unknown update type \"" + updateType + "\"\n" +
                    "Expected types:\n" + Arrays.deepToString(UpdateQueryType.values()));
        }
    }
}
