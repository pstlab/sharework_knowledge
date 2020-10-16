package it.cnr.istc.pst.sharework.ros;

import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import org.apache.commons.logging.Log;
import org.apache.jena.rdf.model.Statement;
import org.ros.exception.ServiceException;
import org.ros.namespace.GraphName;
import org.ros.node.AbstractNodeMain;
import org.ros.node.ConnectedNode;
import org.ros.node.Node;
import org.ros.node.service.ServiceResponseBuilder;

import java.util.List;
import java.util.ArrayList;

/**
 *
 * ROS node working as entry point to the Knowledge Base.
 *
 *
 *
 * This class represents a ROS node interface for the
 * functionalities encapsulated by KnowledgeGraphFacade
 *
 */
public class KnowledgeService extends AbstractNodeMain
{
    private Log log;

    private ProductionKnowledge knowledge;

    /**
     *
     * @return
     */
    @Override
    public GraphName getDefaultNodeName() {
        // set the name of the node
        return GraphName.of("sharework/knowledge");
    }

    /**
     *
     * @param connectedNode
     */
    @Override
    public void onStart(final ConnectedNode connectedNode)
    {
        // get system log
        this.log = connectedNode.getLog();
        // create production knowledge manager
        this.knowledge = new ProductionKnowledge();

        // create service instance
        connectedNode.newServiceServer("/sharework/knowledge/service",
                sharework_knowledge_msgs.KnowledgeRDFTripleEndPoint._TYPE,
                new ServiceResponseBuilder<sharework_knowledge_msgs.KnowledgeRDFTripleEndPointRequest, sharework_knowledge_msgs.KnowledgeRDFTripleEndPointResponse>() {

                    /**
                     *
                     * @param request
                     * @param response
                     * @throws ServiceException
                     */
                    @Override
                    public void build(sharework_knowledge_msgs.KnowledgeRDFTripleEndPointRequest request, sharework_knowledge_msgs.KnowledgeRDFTripleEndPointResponse response)
                            throws ServiceException
                    {
                        // set response
                        List<sharework_knowledge_msgs.KnowledgeRDFTriple> triples = new ArrayList<sharework_knowledge_msgs.KnowledgeRDFTriple>();
                        // get triple query
                        sharework_knowledge_msgs.KnowledgeRDFTriple query = request.getQuery();

                        // get parameters from query triple
                        String subject = query.getSubject() != null && !query.getSubject().equals("") ?
                                query.getSubject() : null;
                        String property = query.getProperty() != null && !query.getProperty().equals("") ?
                                query.getProperty() : null;
                        String object = query.getObject() != null && !query.getObject().equals("") ?
                                query.getObject() : null;

                        // Perform a simple triple query on production knowledge
                        List<Statement> list = knowledge.listStatements(subject, property, object);
                        for (Statement stat : list)
                        {
                            // check null values
                            if (stat.getSubject() != null && stat.getPredicate() != null && stat.getObject() != null)
                            {
                                // print statement information
                                log.info("Found statement - " + stat + "\n");
                                // create message triple object
                                sharework_knowledge_msgs.KnowledgeRDFTriple triple = connectedNode
                                        .getTopicMessageFactory()
                                          .newFromType(sharework_knowledge_msgs.KnowledgeRDFTriple._TYPE);

                                // set attributes
                                triple.setSubject(stat.getSubject().getLocalName());
                                triple.setProperty(stat.getPredicate().getLocalName());
                                triple.setObject(stat.getObject().asResource().getLocalName());

                                // add triple to the result list
                                triples.add(triple);

                            }
                            else {
                                // print a warning
                            }
                        }

                        // set result
                        response.setResult(triples);
                    }
                });
    }

    /**
     *
     * @param node
     */
    @Override
    public void onShutdown(Node node) {

        /**
         * TODO : ROSJava node callback
         */

        super.onShutdown(node);
    }

    /**
     *
     * @param node
     * @param throwable
     */
    @Override
    public void onError(Node node, Throwable throwable) {

        /**
         * TODO : ROSJava node callback
         */

        super.onError(node, throwable);
    }

    /**
     *
     * @param node
     */
    @Override
    public void onShutdownComplete(Node node) {

        /**
         * TODO : ROSJava node callback
         */

        super.onShutdownComplete(node);
    }
}