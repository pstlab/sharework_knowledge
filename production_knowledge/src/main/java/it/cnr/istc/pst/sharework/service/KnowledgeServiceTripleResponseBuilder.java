package it.cnr.istc.pst.sharework.service;

import org.apache.commons.logging.Log;
import org.apache.jena.rdf.model.Statement;
import org.ros.exception.ServiceException;
import org.ros.node.ConnectedNode;
import org.ros.node.service.ServiceResponseBuilder;
import sharework_knowledge_msgs.KnowledgeRDFTriple;

import java.util.ArrayList;
import java.util.List;

/**
 *
 */
public class KnowledgeServiceTripleResponseBuilder implements ServiceResponseBuilder<sharework_knowledge_msgs.KnowledgeRDFTripleEndPointRequest, sharework_knowledge_msgs.KnowledgeRDFTripleEndPointResponse>
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
    protected KnowledgeServiceTripleResponseBuilder(Log log,
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
        try
        {
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
            List<Statement> list = this.service.knowledge.listStatements(subject, property, object);
            // check list
            if (list.isEmpty()) {
                // warning
                this.log.warn("No statement found into the Knowledge graph:\n" +
                        "- query-subject: " + subject + "\n" +
                        "- query-property: " + property + "\n" +
                        "- query-object: " + object + "\n");
            }
            else
            {
                // info
                this.log.info("A total of " + list.size() + " RDF statements have been found...");
                // check statements
                for (int index = 0; index < list.size(); index++)
                {
                    // get statement
                    Statement stat = list.get(index);
                    // print statement information
                    this.log.info("[" + index + "] " + stat + "\n");
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
