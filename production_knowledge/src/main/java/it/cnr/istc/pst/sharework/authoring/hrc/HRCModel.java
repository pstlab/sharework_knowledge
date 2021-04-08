package it.cnr.istc.pst.sharework.authoring.hrc;

import org.apache.jena.rdf.model.Resource;

import java.util.*;

/**
 *
 */
public class HRCModel
{
    private long horizon;
    private Map<Resource, HRCTask> tasks;
    private Map<Resource, HRCTask> robotTasks;
    private Map<Resource, HRCTask> humanTasks;



    /**
     *
     * @param horizon
     */
    public HRCModel(long horizon) {
        this.horizon = horizon;
        this.tasks = new HashMap<>();
        this.robotTasks = new HashMap<>();
        this.humanTasks = new HashMap<>();
    }

    /**
     *
     * @param function
     * @param type
     * @return
     */
    public HRCTask createRobotTask(Resource function, Resource type) {
        // create task model
        HRCTask rf = new HRCTask(function, type, this.horizon);
        this.tasks.put(rf.getResource(), rf);
        this.robotTasks.put(rf.getResource(), rf);
        // get function model
        return rf;
    }

    /**
     *
     * @param function
     * @param type
     * @return
     */
    public HRCTask createHumanTask(Resource function, Resource type) {
        // create task model
        HRCTask hf = new HRCTask(function, type, this.horizon);
        this.tasks.put(hf.getResource(), hf);
        this.humanTasks.put(hf.getResource(), hf);
        // get function model
        return hf;
    }

    /**
     *
     * @param resource
     * @param type
     * @return
     */
    public HRCTask createHRCTask(Resource resource, Resource type) {
        // create task model
        HRCTask task = new HRCTask(resource, type, this.horizon);
        this.tasks.put(task.getResource(), task);
        // get task model
        return task;
    }

    /**
     *
     * @param resource
     * @return
     */
    public HRCTask getHRCTask(Resource resource) {
        return this.tasks.get(resource);
    }

    /**
     *
     * @return
     */
    public List<HRCTask> getHRCTasks() {
        return new ArrayList<>(this.tasks.values());
    }

    /**
     *
     * @return
     */
    public List<HRCTask> getRobotTasks() {
        return new ArrayList<>(this.robotTasks.values());
    }

    /**
     *
     * @return
     */
    public List<HRCTask> getHumanTasks() {
        return new ArrayList<>(this.humanTasks.values());
    }
}
