package it.cnr.istc.pst.sharework.rosjava;

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
public class KnowledgeManager extends AbstractNodeMain
{
    /**
     *
     * @return
     */
    @Override
    public GraphName getDefaultNodeName() {
        // set the name of the node
        return GraphName.of("sharework/knowledge/manager");
    }

    /**
     *
     * @param connectedNode
     */
    @Override
    public void onStart(ConnectedNode connectedNode) {



        /**
         * TODO: ROSJava node callback
         */

        super.onStart(connectedNode);
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
