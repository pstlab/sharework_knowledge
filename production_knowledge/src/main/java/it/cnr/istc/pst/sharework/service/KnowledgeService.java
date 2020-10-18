package it.cnr.istc.pst.sharework.service;

import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import org.apache.commons.logging.Log;
import org.ros.namespace.GraphName;
import org.ros.node.AbstractNodeMain;
import org.ros.node.ConnectedNode;
import org.ros.node.Node;

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
        return GraphName.of("sharework/knowledge/endpoint");
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

        // create service instance for the knowledge api end-point
        connectedNode.newServiceServer(
                "/sharework/knowledge/endpoint/api",
                KnowledgeServiceAPIResponseBuilder.getServiceType(),
                new KnowledgeServiceAPIResponseBuilder(this.log, this.knowledge, connectedNode));

        // create service instance for the knowledge triple end-point
        connectedNode.newServiceServer(
                "/sharework/knowledge/endpoint/triple",
                KnowledgeServiceTripleResponseBuilder.getServiceType(),
                new KnowledgeServiceTripleResponseBuilder(this.log, this.knowledge, connectedNode));
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
