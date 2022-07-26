package it.cnr.istc.pst.sharework.cognition;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;
import org.bson.Document;
import org.ros.node.ConnectedNode;

import java.lang.reflect.Constructor;
import java.util.concurrent.atomic.AtomicLong;

/**
 *
 */
public abstract class EnvironmentCognitionMonitor {

    protected static final AtomicLong RequestIdCounter = new AtomicLong(0);

    protected final ConnectedNode connectedNode;
    protected MongoClient client;
    protected MongoCollection<Document> dataset;

    protected static final String TASKPLANNER_GOAL_TOPIC = "/sharework/taskplanner/goal";

    /**
     *
     * @param node
     */
    protected EnvironmentCognitionMonitor(ConnectedNode node) {
        this.connectedNode = node;
    }

    /**
     *
     */
    public abstract void close();

    /**
     *
     * @param clazz
     * @param node
     * @param <T>
     * @return
     */
    public static <T extends EnvironmentCognitionMonitor> T create(Class<T> clazz, ConnectedNode node) {

        // initialize object
        T o = null;
        try {

            // get empty constructor
            Constructor<T> c = clazz.getDeclaredConstructor(ConnectedNode.class);
            // set accessible
            c.setAccessible(true);
            // create instance
            o = c.newInstance(node);

        } catch (Exception ex) {
            throw new RuntimeException("Error while creating environment cognition module:\n" +
                    "- class: " + clazz + "\n" +
                    "- message: " + ex.getMessage() + "\n");
        }

        // get object
        return o;
    }
}
