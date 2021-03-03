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
     * Query the knowledge to get a list of all known production goals
     */
    GET_PRODUCTION_GOALS(
            "get_prod_goals",
            new String[] {},
            GetProductionGoalsApiQueryHandler.class),

    /**
     * Query the knowledge to get the list of functions (i.e., human/robot skills or
     * operations) that are necessary to carry out a given known production goal.
     */
    GET_PRODUCTION_GOAL_FUNCTIONS(
            "get_prod_goal_funcs",
            new String[] {"\"prod_goal\": URI of a known production goal"},
            GetProductionGoalFunctionsApiQueryHandler.class);

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
}
