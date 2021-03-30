package it.cnr.istc.pst.sharework.knowledge.service.update;

import it.cnr.istc.pst.sharework.knowledge.service.api.*;

import java.util.Arrays;

/**
 * Type of queries the API end-point of the Knowledge Service can deal with.
 *
 * Each element of the enumeration shows the label of a query and a description of
 * the associated parameters, when needed
 *
 */
public enum UpdateQueryType
{
    /**
     * Update the knowledge by creating a new individual of a given class
     */
    CREATE_INDIVIDUAL(
            "create_individual",
            new String[] {
                    "\"class\": URI of the class/concept to be instantiate"
            },
            null),

    /**
     * Update the knowledge by creating a new individual of a given class and
     * explicitly stating that the resource represents a different instances
     * with respect to its siblings
     */
    CREATE_DISTINCT_INDIVIDUAL(
            "create_distinct_individual",
            new String[] {
                    "\"class\": URI of the class/concept to be instantiate"
            },
            null),

    /**
     * Update the knowledge by asserting a new property.
     *
     * Properties are asserted as statements (i.e., RDF triples):
     *
     *              <subject> <property> <object>
     */
    ASSERT_PROPERTY(
            "assert_property",
            new String[] {
                    "\"subject\": URI of the reference/subject of the property",
                    "\"property\": URI of the property to assert",
                    "\"object\": URI of the object/target of the property"
            },
            null),

    /**
     * Update the knowledge by removing an asserted property.
     *
     * Properties are asserted as statements (i.e., RDF triples):
     *
     *              <subject> <property> <object>
     */
    DELETE_PROPERTY(
            "delete_property",
            new String[] {
                    "\"subject\": URI of the reference/subject of the property",
                    "\"property\": URI of the property to assert",
                    "\"object\": URI of the object/target of the property"
            },
            null);

    private String label;
    private String[] params;
    private Class hClass;

    /**
     *
     * @param label
     * @param params
     * @param hClass
     */
    private UpdateQueryType(String label, String[] params, Class hClass) {
        this.label = label;
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
    public Class getHandlerClass() {
        return hClass;
    }

    /**
     *
     * @param type
     * @return
     * @throws Exception
     */
    public static UpdateQueryType getType(String type)
            throws Exception
    {
        // type
        UpdateQueryType result = null;
        for (UpdateQueryType t : UpdateQueryType.values()) {
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
        for (UpdateQueryType type : UpdateQueryType.values()) {
            // check type label
            if (type.getLabel().equalsIgnoreCase(queryType)) {
                exists = true;
                break;
            }
        }

        return exists;
    }
}
