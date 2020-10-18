package it.cnr.istc.pst.sharework.service;

import java.util.Arrays;

/**
 * Type of queries the API end-point of the Knowledge Service can deal with.
 *
 * Each element of the enumeration shows the label of a query and a description of
 * the associated parameters, when needed
 *
 */
public enum KnowledgeServiceAPIQueryType
{
    /**
     * Query the knowledge to get a list of all known production goals
     */
    GET_PRODUCTION_GOALS(
            "get_prod_goals",
            new String[] {}),

    /**
     * Query the knowledge to get the list of functions (i.e., human/robot skills or
     * operations) that are necessary to carry out a given known production goal.
     */
    GET_PRODUCTION_GOAL_FUNCTIONS(
            "get_prod_goal_funcs",
            new String[] {"\"prod_goal\": URI of a known production goal"});

    private String label;
    private String[] params;

    /**
     *
     * @param type
     * @param params
     */
    private KnowledgeServiceAPIQueryType(String type, String[] params) {
        this.label = type;
        this.params = params;
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
     * @param type
     * @return
     * @throws Exception
     */
    public static KnowledgeServiceAPIQueryType getType(String type)
            throws Exception
    {
        // type
        KnowledgeServiceAPIQueryType result = null;
        for (KnowledgeServiceAPIQueryType t : KnowledgeServiceAPIQueryType.values()) {
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
