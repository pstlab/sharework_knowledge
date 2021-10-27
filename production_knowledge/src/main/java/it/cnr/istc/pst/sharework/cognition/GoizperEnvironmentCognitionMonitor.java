package it.cnr.istc.pst.sharework.cognition;

import com.mongodb.BasicDBObject;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;
import geometry_msgs.Point;
import org.apache.commons.logging.Log;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.ros.message.MessageFactory;
import org.ros.message.MessageListener;
import org.ros.node.ConnectedNode;
import org.ros.node.topic.Publisher;
import org.ros.node.topic.Subscriber;
import sharework_cognition_msgs.DetectionResult;

import java.util.Arrays;
import java.util.concurrent.atomic.AtomicLong;

import static com.mongodb.client.model.Filters.eq;

/**
 *
 */
public class GoizperEnvironmentCognitionMonitor extends EnvironmentCognitionMonitor {

    private static final AtomicLong RequestIdCounter = new AtomicLong(0);
    private static final AtomicLong PoseIdCounter = new AtomicLong(1);              // pose 0 is reserved for default
    private static final String ENVIRONMENT_TOPIC = "/screw_detector/screw_to_be_tightened";
    private static final String TASKPLANNER_GOAL_TOPIC = "/sharework/taskplanner/goal";
    private Subscriber<DetectionResult> subscriber;
    private Publisher<task_planner_interface_msgs.TaskPlanningRequest> publisher;
    private Log log;

    /**
     *
     * @param node
     */
    protected GoizperEnvironmentCognitionMonitor(ConnectedNode node) {
        super(node);

        try {

            // get log
            this.log = node.getLog();
            // create mongo db connecting to localhost
            this.client = MongoClients.create();
            // select db
            MongoDatabase db = client.getDatabase("sharework_deployment");
            // set dataset
            this.dataset = db.getCollection("goizper");


            // create task planner goal publisher
            this.publisher = connectedNode.newPublisher(
                    TASKPLANNER_GOAL_TOPIC,
                    task_planner_interface_msgs.TaskPlanningRequest._TYPE);


            // create topic listener
            this.subscriber = this.connectedNode.newSubscriber(
                    ENVIRONMENT_TOPIC,
                    sharework_cognition_msgs.DetectionResult._TYPE);

            // message listener
            this.subscriber.addMessageListener(new MessageListener<DetectionResult>() {

                /**
                 *
                 * @param detection
                 */
                @Override
                public void onNewMessage(DetectionResult detection) {

                    // get an ID for the detected pose
                    long poseId = PoseIdCounter.getAndIncrement();
                    // get received data
                    log.info("[GoizperEnvironmentCognitionMonitor] Received data from environment cognition module:\n" +
                            "- poseId: " + poseId + "\n" +
                            "- data: " + detection + "\n");

                    // create document to insert into the dataset
                    Document doc = new Document();
                    // set data
                    doc.put("poseId", poseId);
                    // append detected points
                    for (Point point : detection.getPoints()) {

                        // create point document
                        Document dPoint = new Document();
                        dPoint.put("x", point.getX());
                        dPoint.put("y", point.getY());
                        dPoint.put("z", point.getZ());
                        // add points
                        doc.append("points", dPoint);
                    }

                    // append results
                    for (short result : detection.getResults()) {
                        //  append result data
                        doc.append("results", result);
                    }

                    Bson filter = eq("poseId", poseId);
                    Document result = dataset.find(filter).first();
                    // delete data if already stored
                    if (result != null) {
                        // update collection
                        dataset.deleteOne(filter);
                    }

                    // store document
                    dataset.insertOne(doc);


                    // get message factory
                    MessageFactory factory = connectedNode.getTopicMessageFactory();
                    // create task planning request from factory
                    task_planner_interface_msgs.TaskPlanningRequest goal = factory.
                            newFromType(task_planner_interface_msgs.TaskPlanningRequest._TYPE);

                    // set request data
                    goal.setRequestId(RequestIdCounter.getAndIncrement());

                    // set planning goal
                    goal.setComponent("Goal");
                    goal.setGoal("screw-on-pose");
                    goal.setParameters(Arrays.asList(new String[] {
                            Long.toString(poseId)
                    }));

                    // print info
                    log.info("[GoizperEnvironmentCognitionMonitor] Publishing task planning request on topic \"" + TASKPLANNER_GOAL_TOPIC + "\":\n" +
                            "- request: " + goal + "\n");
                    // publish task planning request on topic
                    publisher.publish(goal);
                }
            });

        } catch (Exception ex) {
            throw new RuntimeException("[GoizperEnvironmentCognitionMonitor] Error while creating monitor:\n" +
                    "- message: " + ex.getMessage() + "\n");
        }
    }

    /**
     *
     */
    @Override
    public void close() {

        // close connection with the DB if necessary
        if (this.client != null) {
            this.client.close();
        }

        // check subscriber
        if (this.subscriber != null) {
            // clear subscriber
            this.subscriber.removeAllMessageListeners();
        }
    }
}
