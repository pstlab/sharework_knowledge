package it.cnr.istc.pst.sharework.cognition;

import com.mongodb.BasicDBObject;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;
import geometry_msgs.Point;
import geometry_msgs.Pose;
import geometry_msgs.Quaternion;
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
    private static final AtomicLong PoseIdCounter = new AtomicLong(1);                  // pose 0 is reserved for default
    private static final String ENVIRONMENT_TOPIC = "/screw_detector/screw_to_be_tightened";
    private static final String TASKPLANNER_GOAL_TOPIC = "/sharework/taskplanner/request";
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

            // create topic listener
            this.subscriber = this.connectedNode.newSubscriber(
                    ENVIRONMENT_TOPIC,
                    sharework_cognition_msgs.DetectionResult._TYPE);

            // create task planner goal publisher
            this.publisher = connectedNode.newPublisher(
                    TASKPLANNER_GOAL_TOPIC,
                    task_planner_interface_msgs.TaskPlanningRequest._TYPE);

            // message listener
            this.subscriber.addMessageListener(new MessageListener<DetectionResult>() {

                /**
                 *
                 * @param detection
                 */
                @Override
                public void onNewMessage(DetectionResult detection) {

                // get received data
                log.info("[GoizperEnvironmentCognitionMonitor] Received data from environment cognition module:\n" +
                        "- #points: " + detection.getPoints().size() + "\n");

                // create documents for received Poses
                Document[] docs = new Document[detection.getPoints().size()];
                // check received points
                for (int index = 0; index < detection.getPoints().size(); index++) {

                    // get pose
                    Pose pose = detection.getPoints().get(index);
                    // get position point
                    Point point = pose.getPosition();
                    // get orientation
                    Quaternion quat = pose.getOrientation();

                    // create document
                    Document doc = new Document();
                    // get an ID for the detected pose
                    doc.put("poseId", PoseIdCounter.getAndIncrement());

                    // create point document
                    Document dPoint = new Document();
                    dPoint.put("x", point.getX());
                    dPoint.put("y", point.getY());
                    dPoint.put("z", point.getZ());

                    // add points
                    doc.append("point", dPoint);

                    // create quaternion document
                    Document dQuat = new Document();
                    dQuat.put("x", quat.getX());
                    dQuat.put("y", quat.getY());
                    dQuat.put("z", quat.getZ());
                    dQuat.put("w", quat.getW());

                    // add quaternion
                    doc.append("quaternion", dQuat);

                    // get result
                    short result = detection.getResults()[index];
                    // put result
                    doc.put("result", result);

                    // save document into the local DB
                    Bson filter = eq("poseId", PoseIdCounter.getAndIncrement());
                    Document qResult = dataset.find(filter).first();
                    // delete data if already stored
                    if (qResult != null) {
                        // update collection
                        dataset.deleteOne(filter);
                    }

                    // store document
                    dataset.insertOne(doc);

                    // add stored document to the list
                    docs[index] = doc;
                }


                // get message factory for task requets
                MessageFactory factory = connectedNode.getTopicMessageFactory();
                // create a task planning request for each detected screw
                for (Document doc : docs) {

                    // create task planning request from factory
                    task_planner_interface_msgs.TaskPlanningRequest goal = factory.
                            newFromType(task_planner_interface_msgs.TaskPlanningRequest._TYPE);

                    // set request data
                    goal.setRequestId(RequestIdCounter.getAndIncrement());

                    // set planning goal
                    goal.setComponent("Goal");
                    goal.setGoal("screw-on-pose");
                    goal.setParameters(Arrays.asList(new String[] {
                            Long.toString(doc.getLong("poseId"))
                    }));

                    // print info
                    log.info("[GoizperEnvironmentCognitionMonitor] Publishing task planning request on topic \"" + TASKPLANNER_GOAL_TOPIC + "\":\n" +
                            "- ID: " + goal.getRequestId() + "\n" +
                            "- Component: " + goal.getComponent() + "\n" +
                            "- Goal: " + goal.getGoal() + "\n");
                    
                    // publish task planning request on topic
                    publisher.publish(goal);

                }


                // create task planning request from factory
                task_planner_interface_msgs.TaskPlanningRequest terminate = factory.
                        newFromType(task_planner_interface_msgs.TaskPlanningRequest._TYPE);

                // set request info
                terminate.setRequestId(RequestIdCounter.getAndIncrement());
                terminate.setComponent("Goal");
                terminate.setGoal("terminate");

                // print info
                log.info("[GoizperEnvironmentCognitionMonitor] Publishing task planning request on topic \"" + TASKPLANNER_GOAL_TOPIC + "\":\n" +
                            "- ID: " + terminate.getRequestId() + "\n" +
                            "- Component: " + terminate.getComponent() + "\n" +
                            "- Goal: " + terminate.getGoal() + "\n");

                // publish request
                publisher.publish(terminate);

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
