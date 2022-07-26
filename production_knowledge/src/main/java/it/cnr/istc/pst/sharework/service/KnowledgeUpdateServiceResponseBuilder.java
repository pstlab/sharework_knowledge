package it.cnr.istc.pst.sharework.service;

import it.cnr.istc.pst.sharework.cognition.CembreEnvironmentCognitionMonitor;
import it.cnr.istc.pst.sharework.cognition.EnvironmentCognitionMonitor;
import it.cnr.istc.pst.sharework.cognition.GoizperEnvironmentCognitionMonitor;
import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledgeDictionary;
import it.cnr.istc.pst.sharework.service.update.UpdateQueryType;
import org.apache.commons.logging.Log;
import org.apache.jena.rdf.model.Resource;
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
public class KnowledgeUpdateServiceResponseBuilder implements ServiceResponseBuilder<sharework_knowledge_msgs.KnowledgeRDFUpdatePointRequest, sharework_knowledge_msgs.KnowledgeRDFUpdatePointResponse> {

    private Log log;
    private KnowledgeService service;
    private ConnectedNode cNode;



    /**
     *
     * @param log
     * @param service
     * @param node
     */
    protected KnowledgeUpdateServiceResponseBuilder(Log log,
                                                    KnowledgeService service,
                                                    ConnectedNode node) {

        this.log = log;
        this.service = service;
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
            throws ServiceException {

        // check request type
        String updateType = knowledgeRDFUpdatePointRequest.getUpdateType();
        // get update query type
        UpdateQueryType type = null;
        try {

            // get known update
            type = UpdateQueryType.getType(updateType);
        }
        catch (Exception ex) {
            // unknown query type
            throw new ServiceException("\n[ProductionKnowledge] Knowledge update error\n" +
                    "- error: " + ex.getClass().getName() + "\n" +
                    "- message: " + ex.getMessage() + "\n" +
                    "- request type: \"" + updateType + "\"\n" +
                    "- message: " + ex.getMessage() + "\n");
        }

        // check type
        switch (type) {

            // add assertion update
            case ADD_ASSERTION: {

                try {
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
                    Statement statement = this.service.knowledge.addAssertion(referenceURI, propertyURI, targetURI);
                    // prepare response data
                    List<sharework_knowledge_msgs.KnowledgeRDFTriple> list = new ArrayList<>();

                    // print statement information
                    this.log.info("Added assertion - " + statement + "\n");
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
                catch (Exception ex) {
                    // unknown query type
                    throw new ServiceException("\n[ProductionKnowledge] Knowledge update error\n" +
                            "- error: " + ex.getClass().getName() + "\n" +
                            "- message: " + ex.getMessage() + "\n" +
                            "- request type: \"" + updateType + "\"\n" +
                            "- message: " + ex.getMessage() + "\n");
                }
            }
            break;

            // remove assertion update
            case REMOVE_ASSERTION: {

                try {
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
                    List<Statement> statements = this.service.knowledge.removeAssertion(referenceURI, propertyURI, targetURI);
                    // prepare response data
                    List<sharework_knowledge_msgs.KnowledgeRDFTriple> list = new ArrayList<>();
                    // check removed statements
                    for (Statement statement : statements) {
                        // print statement information
                        this.log.info("Removed assertion - " + statement + "\n");
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
                catch (Exception ex) {
                    // unknown query type
                    throw new ServiceException("\n[ProductionKnowledge] Knowledge update error\n" +
                            "- error: " + ex.getClass().getName() + "\n" +
                            "- message: " + ex.getMessage() + "\n" +
                            "- request type: \"" + updateType + "\"\n" +
                            "- message: " + ex.getMessage() + "\n");
                }
            }
            break;

            // create individual
            case CREATE_INDIVIDUAL: {

                try {
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
                    Resource individual = this.service.knowledge.createIndividual(classURI);
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
                catch (Exception ex) {
                    // unknown query type
                    throw new ServiceException("\n[ProductionKnowledge] Knowledge update error\n" +
                            "- error: " + ex.getClass().getName() + "\n" +
                            "- message: " + ex.getMessage() + "\n" +
                            "- request type: \"" + updateType + "\"\n" +
                            "- message: " + ex.getMessage() + "\n");
                }
            }
            break;

            // create distinct individual
            case CREATE_UNIQUE_INDIVIDUAL: {

                try {
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
                    Resource individual = this.service.knowledge.createUniqueIndividual(classURI);
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
                catch (Exception ex) {
                    // unknown query type
                    throw new ServiceException("\n[ProductionKnowledge] Knowledge update error\n" +
                            "- error: " + ex.getClass().getName() + "\n" +
                            "- message: " + ex.getMessage() + "\n" +
                            "- request type: \"" + updateType + "\"\n" +
                            "- message: " + ex.getMessage() + "\n");
                }
            }
            break;

            // load an ontological model from file
            case LOAD : {

                // check data
                List<String> data = knowledgeRDFUpdatePointRequest.getData();
                // three parameters expected
                if (data == null || data.isEmpty()) {
                    // wrong number of parameters
                    throw new ServiceException("Wrong number of parameters:\n" +
                            "- parameters: " + Arrays.toString(UpdateQueryType.LOAD.getParameters()));
                }

                // get ontological model file
                String ontoFile = data.get(0);
                // check rule file
                String ruleFile = data.size() > 1 ? data.get(1) : null;
                // restore flag
                boolean restore = false;

                try
                {
                    // load file
                    if (ruleFile != null) {

                        log.info("[ProductionKnowledge] Loading ontological model \"" + ontoFile + "\" (with rules \"" + ruleFile + "\")");
                        // load ontological model
                        this.service.knowledge.load(ontoFile, ruleFile);

                    }  else  {

                        log.info("[ProductionKnowledge] Loading ontological model \"" + ontoFile + "\"");
                        // load ontological file
                        this.service.knowledge.load(ontoFile);
                        log.info("[ProductionKnowledge] Ontological model successfully loaded...");
                    }

                    log.info("[ProductionKnowledge] Ontological model successfully updated!");

                    // load environment monitor
                    //if (ontoFile.contains("goizper")) {


                    // create environment monitor
                    log.info("[ProductionKnowledge] Load environment monitor for GOIZPER ...");
                    // create monitor
                    EnvironmentCognitionMonitor monitor = EnvironmentCognitionMonitor.create(GoizperEnvironmentCognitionMonitor.class, this.cNode);
                    // register monitor
                    this.service.register(monitor);


                    //}

                    log.info("[ProductionKnowledge] Load environment monitor for CEMBRE ...");
                    // create monitor
                    monitor = EnvironmentCognitionMonitor.create(CembreEnvironmentCognitionMonitor.class, this.cNode);
                    // register monitor
                    this.service.register(monitor);

                    // set (successful) empty response
                    knowledgeRDFUpdatePointResponse.setResult(new ArrayList<KnowledgeRDFTriple>());
                }
                catch (Exception ex) {
                    // set flag
                    restore = true;
                    // throw exception
                    throw new ServiceException("\n[ProductionKnowledge] Failure while loading ontological model\n" +
                            "- error: " + ex.getClass().getName() + "\n" +
                            "- message: " + ex.getMessage() + "\n" +
                            "- file: " + ontoFile + "\n" +
                            "- the default ontological model has been restored...\n");
                }
                finally {

                    try {
                        if (restore) {

                            // restore ontological model
                            this.service.knowledge.restore();
                        }
                    }
                    catch (Exception ex) {
                        if (log != null) {
                            log.error("[ProductionKnowledge] Error while restoring default ontological model...");
                        }
                    }
                }
            }
            break;

            default : {
                // unknown query type
                throw new ServiceException("Unknown update type \"" + updateType + "\"\n" +
                        "Expected types:\n" + Arrays.deepToString(UpdateQueryType.values()));
            }
        }

    }
}
