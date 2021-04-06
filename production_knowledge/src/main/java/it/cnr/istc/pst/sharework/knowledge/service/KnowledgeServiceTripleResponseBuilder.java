package it.cnr.istc.pst.sharework.knowledge.service;

import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import org.apache.commons.logging.Log;
import org.apache.jena.rdf.model.Statement;
import org.ros.exception.ServiceException;
import org.ros.node.ConnectedNode;
import org.ros.node.service.ServiceResponseBuilder;
import sharework_knowledge_msgs.KnowledgeRDFTriple;

import javax.xml.ws.Service;
import java.util.ArrayList;
import java.util.List;

/**
 *
 */
public class KnowledgeServiceTripleResponseBuilder implements ServiceResponseBuilder<sharework_knowledge_msgs.KnowledgeRDFTripleEndPointRequest, sharework_knowledge_msgs.KnowledgeRDFTripleEndPointResponse>
{
    private Log log;
    private ProductionKnowledge knowledge;
    private ConnectedNode cNode;

    /**
     *
     * @param log
     * @param knowledge
     */
    protected KnowledgeServiceTripleResponseBuilder(Log log,
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
        return sharework_knowledge_msgs.KnowledgeRDFTripleEndPoint._TYPE;
    }

    /**
     *s
     * @param request
     * @param response
     * @throws ServiceException
     */
    @Override
    public void build(sharework_knowledge_msgs.KnowledgeRDFTripleEndPointRequest request,
                      sharework_knowledge_msgs.KnowledgeRDFTripleEndPointResponse response)
            throws ServiceException
    {
        // set response
        List<KnowledgeRDFTriple> triples = new ArrayList<KnowledgeRDFTriple>();
        try {

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
            for (Statement stat : list) {
                // check null values
                if (stat.getSubject() != null &&
                        stat.getPredicate() != null &&
                        stat.getObject() != null) {
                    // print statement information
                    log.info("Found statement - " + stat + "\n");
                    // create message triple object
                    sharework_knowledge_msgs.KnowledgeRDFTriple triple = this.cNode
                            .getTopicMessageFactory()
                            .newFromType(sharework_knowledge_msgs.KnowledgeRDFTriple._TYPE);

                    // set attributes
                    triple.setSubject(stat.getSubject().getLocalName());
                    triple.setProperty(stat.getPredicate().getLocalName());
                    triple.setObject(stat.getObject().asResource().getLocalName());

                    // add triple to the result list
                    triples.add(triple);

                } else {
                    // print a warning
                }
            }
        }
        catch (Exception ex) {
            throw new ServiceException(ex.getMessage());
        }

        // set result
        response.setResult(triples);
    }
}
