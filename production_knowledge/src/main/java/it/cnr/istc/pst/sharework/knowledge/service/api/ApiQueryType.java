package it.cnr.istc.pst.sharework.knowledge.service.api;

import java.util.Arrays;

/**
 * Type of queries the API end-point of the Knowledge Service can deal with.
 *
 * Each element of the enumeration shows the label of a query and a description of
 * the associated parameters, when needed
 *
 */
public enum ApiQueryType
{
    /**
     * Query the knowledge to get a list of known worker operators
     */
    GET_WORKERS(
            "get_workers",
            new String[] {},
            GetWorkersApiQueryHandler.class),

    /**
     * Query the knowledge to get information about a known worker operator
     */
    GET_WORKER_PROFILE(
            "get_worker_profile",
            new String[] {
                    "\"worker_id\": URI of a known worker"
            },
            GetWorkerProfileApiQueryHandler.class),

    /**
     * Query the knowledge to get information about the skills of a worker
     */
    GET_WORKER_SKILLS(
            "get_worker_skills",
            new String[] {
                    "\"worker_id\": URI of a known worker"
            },
            GetWorkerSkillsApiQueryHandler.class),

    /**
     * Query the knowledge to get information about the functions a worker can perform
     */
    GET_WORKER_FUNCTIONS(
            "get_worker_functions",
            new String[] {
                    "\"worker_id\": URI of a known worker"
            },
            GetWorkerFunctionsApiQueryHandler.class),

    /**
     * Query the knowledge to get information about the functions a worker can perform within a specific production goal
     */
    GET_WORKER_FUNCTIONS_GOAL(
            "get_worker_functions_by_goal",
            new String[] {
                    "\"worker_id\": URI of a known worker",
                    "\"goal_id\": URI of a known production goal"
            },
            GetWorkerFunctionsByGoalApiQueryHandler.class),

    /**
     * Query the knowledge to get information about known collaborative robots
     */
    GET_COBOTS(
            "get_cobots",
            new String[] {},
            GetCobotsApiRequestHandler.class),

    /**
     * Query the knowledge to get information about known capabilities of a collaborative robot
     */
    GET_COBOT_CAPABILITIES(
            "get_cobot_capabilities",
            new String[] {
                    "\"cobot_id\": URI of a known collaborative robot"
            },
            GetCobotCapabilitiesApiQueryHandler.class),

    /**
     * Query the knowledge to get information about the functions a collaborative robot can perform
     */
    GET_COBOT_FUNCTIONS(
            "get_cobot_functions",
            new String[] {
                    "\"cobot_id\": URI of a known collaborative robot"
            },
            GetCobotFunctionsApiRequestHandler.class),

    /**
     * Query the knowledge to get information about the functions a collaborative robot
     * can perform within a specific production goal
     */
    GET_COBOT_FUNCTIONS_GOAL(
            "get_cobot_functions_by_goal",
            new String[] {
                    "\"cobot_id\": URI of a known collaborative robot",
                    "\"goal_id\": URI of a known production goal"
            },
            GetCobotFunctionsByGoalApiQueryHandler.class),

    /**
     * Query the knowledge to get information about the effects of a specific known instance of a function
     */
    GET_FUNCTION_EFFECTS(
            "get_function_effects",
            new String[] {
                    "\"function_id\": URI of a known function instance"
            },
            GetFunctionEffectsApiQueryHandler.class),

    /**
     * Query the knowledge to get a list of known production goals
     */
    GET_PRODUCTION_GOALS(
            "get_goals",
            new String[] {},
            GetProductionGoalsApiQueryHandler.class),

    /**
     * Query the knowledge to get a list of methods associated to a known production goal
     */
    GET_PRODUCTION_GOAL_METHODS(
            "get_goal_methods",
            new String[] {
                    "\"goal_id\": URI of a known goal"
            },
            GetProductionGoalMethodsApiQueryHandler.class),

    /**
     * Query the knowledge to get a list of tasks associated to a known production goal
     * within a known production method
     */
    GET_PRODUCTION_GOAL_TASKS(
            "get_goal_tasks",
            new String[] {
                    "\"goal_id\": URI of known goal",
                    "\"method_id\": URI of a known method"
            },
            GetProductionGoalTasksApiQueryHandler.class),

    /**
     * Query the knowledge to get the list of functions that are necessary to carry out a
     * known production goal within a specific production method.
     */
    GET_PRODUCTION_GOAL_FUNCTIONS(
            "get_goal_functions",
            new String[] {
                    "\"goal_id\": URI of a known production goal",
                    "\"method_id\": URI of a known method associated to the production goal"
            },
            GetProductionGoalFunctionsApiQueryHandler.class),

    /**
     * Query the knowledge to get information about the implementation of a specific
     * production task
     */
    GET_PRODUCTION_TASK_IMPLEMENTATION(
            "get_task_implementation",
            new String[] {
                    "\"task_id\": URI of a known production task",
                    "\"method_id\": URI of a known production method",
                    "\"goal_id\": URI of a known production goal"
            },
            GetProductionTaskImplementationApiQueryHandler.class);

    private String label;
    private String[] params;
    private Class<? extends ApiQueryHandler<?>> hClass;

    /**
     *
     * @param type
     * @param params
     * @param hClass
     */
    private ApiQueryType(String type, String[] params, Class<?extends ApiQueryHandler<?>> hClass) {
        this.label = type;
        this.params = params;
        this.hClass = hClass;
    }

    /**
     *
     * @return
     */
    public String getLabel() {
        return this.label;
    }

    /**
     *
     * @return
     */
    public String[] getParameters() {
        return this.params;
    }

    /**
     *
     * @return
     */
    public Class<? extends ApiQueryHandler<?>> getHandlerClass() {
        return hClass;
    }

    /**
     *
     * @param type
     * @return
     * @throws Exception
     */
    public static ApiQueryType getType(String type)
            throws Exception
    {
        // type
        ApiQueryType result = null;
        for (ApiQueryType t : ApiQueryType.values()) {
            if (t.getLabel().equals(type.trim().toLowerCase())) {
                // set result
                result = t;
                // stop search
                break;
            }
        }

        // check if found
        if (result == null) {
            // unknown query
            throw new Exception("Unknown query type \"" + type + "\"");
        }
        return result;
    }

    /**
     *
     * @return
     */
    @Override
    public String toString() {
        // JSON style description
        return "{" +
                "\"label\": \"" + label + "\"" +
                ", \"params\": " + Arrays.toString(params) +
                "}\n";
    }

    /**
     *
     * @param queryType
     * @return
     */
    public static boolean exists(String queryType) {
        boolean exists = false;
        for (ApiQueryType type : ApiQueryType.values()) {
            // check type label
            if (type.getLabel().equalsIgnoreCase(queryType)) {
                exists = true;
                break;
            }
        }

        return exists;
    }
}
