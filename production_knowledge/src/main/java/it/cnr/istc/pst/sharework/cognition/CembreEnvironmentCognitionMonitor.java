package it.cnr.istc.pst.sharework.cognition;

import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;
import geometry_msgs.Point;
import geometry_msgs.Pose;
import geometry_msgs.Quaternion;
import mqtt_scene_integration.Fixture;
import org.apache.commons.logging.Log;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.ros.message.MessageFactory;
import org.ros.message.MessageListener;
import org.ros.node.ConnectedNode;
import org.ros.node.topic.Publisher;
import org.ros.node.topic.Subscriber;
import sharework_cognition_msgs.DetectionResult;
import task_planner_interface_msgs.TaskPlanningRequest;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicLong;

import static com.mongodb.client.model.Filters.eq;

/**
 *
 */
public class CembreEnvironmentCognitionMonitor extends EnvironmentCognitionMonitor {

    // POSITION TOPICS
    private static final String ENV_TOPIC_POSITION_0 = "/JFMX/L1/sharework/station/p0";
    private static final String ENV_TOPIC_POSITION_1 = "/JFMX/L1/sharework/station/p1";
    private static final String ENV_TOPIC_POSITION_2 = "/JFMX/L1/sharework/station/p2";
    private static final String ENV_TOPIC_POSITION_3 = "/JFMX/L1/sharework/station/p3";

    private static final Object lock = new Object();
    private String stateP0 = "Empty";
    private String stateP1 = "Empty";
    private String stateP2 = "Empty";
    private String stateP3 = "Empty";

    private List<Subscriber<Fixture>> subscribers;

    private Publisher<task_planner_interface_msgs.TaskPlanningRequest> publisher;
    private Log log;

    /**
     *
     * @param node
     */
    protected CembreEnvironmentCognitionMonitor(ConnectedNode node) {
        super(node);

        try {

            // get log
            this.log = node.getLog();
            // create mongo db connecting to localhost
            this.client = MongoClients.create();
            // select db
            MongoDatabase db = client.getDatabase("sharework_deployment");
            // set dataset
            this.dataset = db.getCollection("cembre");
            // drop dataset
            this.dataset.drop();

            // initialize list
            this.subscribers = new ArrayList<>();

            // create publisher
            this.publisher = connectedNode.newPublisher(
                    TASKPLANNER_GOAL_TOPIC,
                    task_planner_interface_msgs.TaskPlanningRequest._TYPE);

            // create subscriber of position P0
            Subscriber<Fixture> subscriber = connectedNode.newSubscriber(
                    ENV_TOPIC_POSITION_0,
                    Fixture._TYPE);

            // add message listener for position P0
            subscriber.addMessageListener(new MessageListener<Fixture>() {

                /**
                 *
                 * @param fixture
                 */
                @Override
                public void onNewMessage(Fixture fixture) {

                    // get state and content
                    String state = fixture.getState();
                    String content = fixture.getContent();

                    log.info("[CembreEnvironmentCognitionMonitor] [P0] Observed state \"" + state + "\" with content \"" + content + "\"");

                    // update state
                    synchronized (lock) {

                        // write state of P0
                        stateP0 = state;

                        // check for goal triggering
                        if (stateP0.equalsIgnoreCase("ToUnload")) {

                            // get message factory
                            MessageFactory factory = connectedNode.getTopicMessageFactory();
                            // trigger goal
                            task_planner_interface_msgs.TaskPlanningRequest goal = factory.
                                    newFromType(TaskPlanningRequest._TYPE);

                            // set data
                            goal.setRequestId(RequestIdCounter.getAndIncrement());

                            // set planning goal
                            goal.setComponent("Goal");
                            goal.setGoal("goal_" + content.toLowerCase(Locale.ROOT));

                            // set facts
                            List<String> componentFacts = new ArrayList<>();
                            List<String> componentPredicates = new ArrayList<>();


                            componentFacts.add("p0");
                            componentPredicates.add("Busy");

                            componentFacts.add("p1");
                            componentPredicates.add(stateP1.equalsIgnoreCase("Empty") ? "Free" : "Busy");

                            componentFacts.add("p2");
                            componentPredicates.add(stateP2.equalsIgnoreCase("Empty") ? "Free" : "Busy");

                            componentFacts.add("p3");
                            componentPredicates.add(stateP3.equalsIgnoreCase("Empty") ? "Free" : "Busy");

                            // set facts
                            goal.setFactComponents(componentFacts);
                            goal.setFactPredicates(componentPredicates);

                            log.info("[CembreEnvironmentCognitionMonitor] Triggering task planning goal\n\t- goal: " + goal + "\n");

                            // publish task planning request
                            publisher.publish(goal);
                        }
                    }
                }
            });

            // add subscriber to the list
            this.subscribers.add(subscriber);


            subscriber = connectedNode.newSubscriber(
                    ENV_TOPIC_POSITION_1,
                    Fixture._TYPE);

            // add message listener for position P0
            subscriber.addMessageListener(new MessageListener<Fixture>() {

                /**
                 * 
                 * @param fixture
                 */
                @Override
                public void onNewMessage(Fixture fixture) {

                    // get state and content
                    String state = fixture.getState();
                    String content = fixture.getContent();

                    log.info("[CembreEnvironmentCognitionMonitor] [P1] Observed state \"" + state + "\" with content \"" + content + "\"");

                    // update state
                    synchronized (lock) {

                        // write state of P1
                        stateP1 = state;
                    }
                }
            });

            // add subscriber to the list
            this.subscribers.add(subscriber);


            subscriber = connectedNode.newSubscriber(
                    ENV_TOPIC_POSITION_2,
                    Fixture._TYPE);

            // add message listener for position P0
            subscriber.addMessageListener(new MessageListener<Fixture>() {

                /**
                 *
                 * @param fixture
                 */
                @Override
                public void onNewMessage(Fixture fixture) {

                    // get state and content
                    String state = fixture.getState();
                    String content = fixture.getContent();

                    log.info("[CembreEnvironmentCognitionMonitor] [P2] Observed state \"" + state + "\" with content \"" + content + "\"");

                    // update state
                    synchronized (lock) {

                        // write state of P2
                        stateP2 = state;
                    }
                }
            });

            // add subscriber to the list
            this.subscribers.add(subscriber);


            subscriber = connectedNode.newSubscriber(
                    ENV_TOPIC_POSITION_3,
                    Fixture._TYPE);

            // add message listener for position P0
            subscriber.addMessageListener(new MessageListener<Fixture>() {

                /**
                 *
                 * @param fixture
                 */
                @Override
                public void onNewMessage(Fixture fixture) {

                    // get state and content
                    String state = fixture.getState();
                    String content = fixture.getContent();

                    log.info("[CembreEnvironmentCognitionMonitor] [P3] Observed state \"" + state + "\" with content \"" + content + "\"");

                    // update state
                    synchronized (lock) {

                        // write state of P3
                        stateP3 = state;
                    }
                }
            });

            // add subscriber to the list
            this.subscribers.add(subscriber);





        } catch (Exception ex) {

            // close subscribers
            for (Subscriber<?> s : subscribers) {
                // remove all message listeners
                s.removeAllMessageListeners();
            }

            if (this.publisher != null) {
                this.publisher.shutdown();
            }

            // close connection with the DB if necessary
            if (this.client != null) {
                this.client.close();
            }

            // throw exception
            throw new RuntimeException("[CembreEnvironmentCognitionMonitor] Error while creating environment monitor:\n" +
                    "- message: " + ex.getMessage() + "\n");


        }
    }

    /**
     *
     */
    @Override
    public void close() {

        // clear subscribers check subscriber
        for (Subscriber<?> s : subscribers) {
            s.removeAllMessageListeners();
        }

        if (this.publisher != null) {
            this.publisher.shutdown();
        }

        // close connection with the DB if necessary
        if (this.client != null) {
            this.client.close();
        }
    }
}
