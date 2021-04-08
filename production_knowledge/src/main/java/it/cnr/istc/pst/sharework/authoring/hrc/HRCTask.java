package it.cnr.istc.pst.sharework.authoring.hrc;

import org.apache.jena.rdf.model.Resource;

import java.util.Objects;

/**
 *
 */
public class HRCTask
{
    private long horizon;                   // known plan horizon
    private Resource resource;              // resource denoting a task instance
    private Resource type;                  // resource denoting task type
    private Resource target;                // resource denoting the target of the task

    private String name;                    // unique name of the task
    private String description;             // task description
    private String goal;                    // label denoting the goal of the procedure
    private String agent;                   // label of the agent that would perform the function
    private long duration;                  // known average duration of task execution
    private long uncertainty;               // known uncertainty about the duration of a task
    private double successRate;             // known success rate

    /**
     *
     * @param function
     * @param type
     * @param horizon
     */
    protected HRCTask(Resource function, Resource type, long horizon) {
        // set type
        this.type = type;
        // set default name taking the name associated to the resource
        this.name = function.getLocalName() == null ? function.asNode().getBlankNodeLabel() : function.getLocalName();
        // default agent type
        this.agent = "any";
        // set task description
        this.description = this.name;
        // set function resource
        this.resource = function;
        // set default average duration
        this.duration = 1;
        // set maximum uncertainty [- horizon, +horizon]
        this.uncertainty = horizon;
        // set default success rate
        this.successRate = .99;
    }

    /**
     *
     * @return
     */
    public double getSuccessRate() {
        return successRate;
    }

    /**
     *
     * @param successRate
     */
    public void setSuccessRate(double successRate) {
        this.successRate = successRate;
    }

    /**
     *
     * @param description
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     *
     * @return
     */
    public String getDescription() {
        return description;
    }

    /**
     *
     * @param goal
     */
    public void setGoal(String goal) {
        this.goal = goal;
    }

    /**
     *
     * @return
     */
    public String getGoal() {
        return goal;
    }

    /**
     *
     * @param target
     */
    public void setTarget(Resource target) {
        this.target = target;
    }

    /**
     *
     * @return
     */
    public Resource getTarget() {
        return target;
    }

    /**
     *
     * @param agent
     */
    public void setAgent(String agent) {
        this.agent = agent;
    }

    /**
     *
     * @return
     */
    public String getAgent() {
        return this.agent;
    }

    /**
     *
     * @return
     */
    public Resource getType() {
        return type;
    }

    /**
     *
     * @return
     */
    public Resource getResource() {
        return resource;
    }

    /**
     *
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     *
     * @return
     */
    public String getName() {
        return name;
    }

    /**
     *
     * @param duration
     */
    public void setDuration(long duration) {
        this.duration = duration;
    }

    /**
     *
     * @param uncertainty
     */
    public void setUncertainty(long uncertainty) {
        this.uncertainty = uncertainty;
    }

    /**
     *
     * @return
     */
    public long[] getDuration() {
        // create bounds
        long[] bounds = new long[] {
                Math.max(1, this.duration - this.uncertainty),
                Math.min(this.duration + this.uncertainty, this.horizon)
        };

        // get bounds
        return bounds;
    }

    /**
     *
     * @return
     */
    public long getAverageDuration() {
        return this.duration;
    }

    /**
     *
     * @return
     */
    public long getUncertainty() {
        return uncertainty;
    }

    /**
     *
     * @param o
     * @return
     */
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        HRCTask that = (HRCTask) o;
        return Objects.equals(resource, that.resource);
    }

    /**
     *
     * @return
     */
    @Override
    public int hashCode() {
        return Objects.hash(resource);
    }

    /**
     *
     * @return
     */
    @Override
    public String toString() {
        return "RobotFunction{" +
                "function=" + (resource == null ? resource.asNode().getBlankNodeLabel() : resource.getURI()) +
                '}';
    }
}
