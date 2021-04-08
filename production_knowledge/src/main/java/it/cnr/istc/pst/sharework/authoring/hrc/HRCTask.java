package it.cnr.istc.pst.sharework.authoring.hrc;

import org.apache.jena.rdf.model.Resource;

import java.util.Objects;

/**
 *
 */
public class HRCTask
{
    private Resource resource;              // resource denoting a task instance
    private Resource type;                  // resource denoting task type
    private String name;
    private long[] duration;
    private double uncertainty;

    /**
     *
     * @param function
     * @param type
     * @param horizon
     */
    protected HRCTask(Resource function, Resource type, long horizon) {
        // set type
        this.type = type;
        // set function resource
        this.resource = function;
        // set default duration with maximum uncertainty
        this.duration = new long[] {
                1,
                horizon
        };
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
        this.duration = new long[] {
                duration,
                duration
        };
    }

    /**
     *
     * @param duration
     */
    public void setDuration(long[] duration) {
        this.duration = duration;
    }

    /**
     *
     * @param duration
     * @param uncertainty
     */
    public void setDuration(long duration, long uncertainty) {
        this.uncertainty = uncertainty;
        this.duration = new long[] {
                Math.max(1, duration - uncertainty),
                Math.min(duration + uncertainty, Long.MAX_VALUE - 1)
        };
    }

    /**
     *
     * @return
     */
    public long[] getDuration() {
        return duration;
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
