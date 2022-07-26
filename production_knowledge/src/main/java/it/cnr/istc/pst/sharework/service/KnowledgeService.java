package it.cnr.istc.pst.sharework.service;

import it.cnr.istc.pst.sharework.authoring.ProductionKnowledgeAuthoring;
import it.cnr.istc.pst.sharework.authoring.hrc.ftl.TimelineBasedProductionKnowledgeAuthoring;
import it.cnr.istc.pst.sharework.cognition.EnvironmentCognitionMonitor;
import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import org.apache.commons.logging.Log;
import org.ros.namespace.GraphName;
import org.ros.node.AbstractNodeMain;
import org.ros.node.ConnectedNode;
import org.ros.node.Node;

import java.util.ArrayList;
import java.util.List;

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
public class KnowledgeService extends AbstractNodeMain {

    private Log log;
    protected ProductionKnowledge knowledge;                      // internal knowledge base
    protected ProductionKnowledgeAuthoring authoring;             // planing model authoring service

    private List<EnvironmentCognitionMonitor> monitors;             // register of environment monitors

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
    public void onStart(final ConnectedNode connectedNode) {

        // set list of moniors
        this.monitors = new ArrayList<>();
        // get system log
        this.log = connectedNode.getLog();
        try {

            // create service instance for the knowledge api end-point
            connectedNode.newServiceServer(
                    "/sharework/knowledge/api",
                    KnowledgeServiceApiResponseBuilder.getServiceType(),
                    new KnowledgeServiceApiResponseBuilder(this.log, this, connectedNode));

            // create service instance for the knowledge triple end-point
            connectedNode.newServiceServer(
                    "/sharework/knowledge/triple",
                    KnowledgeServiceTripleResponseBuilder.getServiceType(),
                    new KnowledgeServiceTripleResponseBuilder(this.log, this, connectedNode));

            // create service instance for the update of the knowledge base
            connectedNode.newServiceServer(
                    "sharework/knowledge/update",
                    KnowledgeUpdateServiceResponseBuilder.getServiceType(),
                    new KnowledgeUpdateServiceResponseBuilder(this.log, this, connectedNode));

            // create production knowledge manager
            this.knowledge = new ProductionKnowledge(this.log);
            // create authoring process
            this.authoring = new TimelineBasedProductionKnowledgeAuthoring(connectedNode);
            // bind authoring process
            this.authoring.bind(this.knowledge);
        }
        catch (Exception ex) {
            // start error
            this.log.error(ex.getMessage());
        }
    }

    /**
     *
     * @param node
     */
    @Override
    public void onShutdown(Node node)  {

        try {

            // unbind authoring process
            this.authoring.unbind();
        }
        catch (Exception ex) {
            this.log.error(ex.getMessage());
        }

        // clear monitors
        for (EnvironmentCognitionMonitor monitor : this.monitors) {
            monitor.close();
        }

        // clear data structure
        this.monitors.clear();
        // complete shutdown handling
        super.onShutdown(node);
    }

    /**
     * Register a monitor into the knowledge service
     *
     * @param monitor
     */
    protected void register(EnvironmentCognitionMonitor monitor) {
        this.monitors.add(monitor);
    }

    /**
     *
     * @param node
     * @param throwable
     */
    @Override
    public void onError(Node node, Throwable throwable) {

        try {

            // unbind authoring process
            this.authoring.unbind();
        }
        catch (Exception ex) {
            this.log.error(ex.getMessage());
        }

        // complete error handling
        super.onError(node, throwable);
    }

    /**
     *
     * @param node
     */
    @Override
    public void onShutdownComplete(Node node) {
        super.onShutdownComplete(node);
    }
}
