package it.cnr.istc.pst.sharework.knowledge.service;

import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledgeDictionary;
import it.cnr.istc.pst.sharework.knowledge.service.update.UpdateQueryType;
import org.apache.commons.logging.Log;
import org.apache.jena.rdf.model.Resource;
import org.apache.jena.rdf.model.Statement;
import org.ros.exception.ServiceException;
import org.ros.node.ConnectedNode;
import org.ros.node.service.ServiceResponseBuilder;
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
                // add assertion update
                case ADD_ASSERTION: {

                    // check data
                    List<String> data = knowledgeRDFUpdatePointRequest.getData();
                    // three parameters expected
                    if (data == null || data.isEmpty() || data.size() < 3) {
                        // wrong number of parameters
                        throw new ServiceException("Wrong number of parameters:\n" +
                                "- parameters: " + Arrays.toString(UpdateQueryType.ADD_ASSERTION.getParameters()));
                    }

                    // get parameters
                    String referenceURI = data.get(0);
                    String propertyURI = data.get(1);
                    String targetURI = data.get(2);

                    // assert property
                    Statement statement = this.knowledge.addAssertion(referenceURI, propertyURI, targetURI);
                    // prepare response data
                    List<sharework_knowledge_msgs.KnowledgeRDFTriple> list = new ArrayList<>();

                    // print statement information
                    log.info("Added assertion - " + statement + "\n");
                    // create message triple object
                    sharework_knowledge_msgs.KnowledgeRDFTriple triple = this.cNode
                            .getTopicMessageFactory()
                            .newFromType(sharework_knowledge_msgs.KnowledgeRDFTriple._TYPE);

                    // set attributes
                    triple.setSubject(statement.getSubject().getURI() == null ?
                            // check blank node
                            statement.getSubject().asNode().getBlankNodeLabel() : statement.getSubject().getLocalName());
                    triple.setProperty(statement.getPredicate().getLocalName());
                    triple.setObject(statement.getObject().asResource().getURI() == null ?
                            // check blank node
                            statement.getObject().asNode().getBlankNodeLabel() : statement.getObject().asResource().getLocalName());

                    // add RDF triple
                    list.add(triple);
                    // set response
                    knowledgeRDFUpdatePointResponse.setResult(list);
                }
                break;

                // remove assertion update
                case REMOVE_ASSERTION: {

                    // check data
                    List<String> data = knowledgeRDFUpdatePointRequest.getData();
                    // three parameters expected
                    if (data == null || data.isEmpty() || data.size() < 3) {
                        // wrong number of parameters
                        throw new ServiceException("Wrong number of parameters:\n" +
                                "- parameters: " + Arrays.toString(UpdateQueryType.REMOVE_ASSERTION.getParameters()));
                    }

                    // get parameters
                    String referenceURI = data.get(0);
                    String propertyURI = data.get(1);
                    String targetURI = data.get(2);

                    // assert property
                    List<Statement> statements = this.knowledge.removeAssertion(referenceURI, propertyURI, targetURI);
                    // prepare response data
                    List<sharework_knowledge_msgs.KnowledgeRDFTriple> list = new ArrayList<>();
                    // check removed statements
                    for (Statement statement : statements) {
                        // print statement information
                        log.info("Removed assertion - " + statement + "\n");
                        // create message triple object
                        sharework_knowledge_msgs.KnowledgeRDFTriple triple = this.cNode
                                .getTopicMessageFactory()
                                .newFromType(sharework_knowledge_msgs.KnowledgeRDFTriple._TYPE);

                        // set attributes
                        triple.setSubject(statement.getSubject().getURI() == null ?
                                // check blank node
                                statement.getSubject().asNode().getBlankNodeLabel() : statement.getSubject().getLocalName());
                        triple.setProperty(statement.getPredicate().getLocalName());
                        triple.setObject(statement.getObject().asResource().getURI() == null ?
                                // check blank node
                                statement.getObject().asNode().getBlankNodeLabel() : statement.getObject().asResource().getLocalName());

                        // add RDF triple
                        list.add(triple);
                    }

                    // set response
                    knowledgeRDFUpdatePointResponse.setResult(list);
                }
                break;

                // create individual
                case CREATE_INDIVIDUAL: {

                    // check data
                    List<String> data = knowledgeRDFUpdatePointRequest.getData();
                    // three parameters expected
                    if (data == null || data.isEmpty()) {
                        // wrong number of parameters
                        throw new ServiceException("Wrong number of parameters:\n" +
                                "- parameters: " + Arrays.toString(UpdateQueryType.CREATE_INDIVIDUAL.getParameters()));
                    }

                    // get class
                    String classURI = data.get(0);
                    // create individual
                    Resource individual = this.knowledge.createIndividual(classURI);
                    this.log.info("Created individual - " + individual + "\n");

                    // prepare response data
                    List<sharework_knowledge_msgs.KnowledgeRDFTriple> list = new ArrayList<>();
                    // create message triple object
                    sharework_knowledge_msgs.KnowledgeRDFTriple triple = this.cNode
                            .getTopicMessageFactory()
                            .newFromType(sharework_knowledge_msgs.KnowledgeRDFTriple._TYPE);

                    // set attributes
                    triple.setSubject(individual.getURI() == null ?
                            // check blank node
                            individual.asNode().getBlankNodeLabel() : individual.getLocalName());
                    triple.setProperty(ProductionKnowledgeDictionary.RDF_NS + "type");
                    triple.setObject(classURI);

                    // add RDF triple
                    list.add(triple);

                    // set response data
                    knowledgeRDFUpdatePointResponse.setResult(list);
                }
                break;

                // create distinct individual
                case CREATE_UNIQUE_INDIVIDUAL: {

                    // check data
                    List<String> data = knowledgeRDFUpdatePointRequest.getData();
                    // three parameters expected
                    if (data == null || data.isEmpty()) {
                        // wrong number of parameters
                        throw new ServiceException("Wrong number of parameters:\n" +
                                "- parameters: " + Arrays.toString(UpdateQueryType.CREATE_UNIQUE_INDIVIDUAL.getParameters()));
                    }

                    // get class
                    String classURI = data.get(0);
                    // create individual
                    Resource individual = this.knowledge.createUniqueIndividual(classURI);
                    this.log.info("Created (unique) individual - " + individual + "\n");

                    // prepare response data
                    List<sharework_knowledge_msgs.KnowledgeRDFTriple> list = new ArrayList<>();
                    // create message triple object
                    sharework_knowledge_msgs.KnowledgeRDFTriple triple = this.cNode
                            .getTopicMessageFactory()
                            .newFromType(sharework_knowledge_msgs.KnowledgeRDFTriple._TYPE);

                    // set attributes
                    triple.setSubject(individual.getURI() == null ?
                            // check blank node
                            individual.asNode().getBlankNodeLabel() : individual.getLocalName());
                    triple.setProperty(ProductionKnowledgeDictionary.RDF_NS + "type");
                    triple.setObject(classURI);

                    // add RDF triple
                    list.add(triple);

                    // set response data
                    knowledgeRDFUpdatePointResponse.setResult(list);
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
