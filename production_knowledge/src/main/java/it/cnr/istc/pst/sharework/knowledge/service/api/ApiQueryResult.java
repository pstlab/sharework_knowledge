package it.cnr.istc.pst.sharework.knowledge.service.api;

import org.ros.node.ConnectedNode;

/**
 *
 */
public abstract class ApiQueryResult {

    /**
     *
     * @param response
     * @param cNode
     */
    public abstract void prepare(sharework_knowledge_msgs.KnowledgeAPIEndPointResponse response, ConnectedNode cNode);

}
