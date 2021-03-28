package it.cnr.istc.pst.sharework.knowledge.authoring.ftl;

import it.cnr.istc.pst.sharework.knowledge.authoring.ProductionKnowledgeAuthoring;
import org.apache.jena.rdf.model.Resource;

import java.util.List;

/**
 *
 */
public class TimelineBasedProductionKnowledgeAuthoring extends ProductionKnowledgeAuthoring
{
    private int numberOfVariables;                      // number of generated variables
    private int numberOfPredicates;                     // number of generated predicates
    private int numberOfSynchronizations;               // number of generated synchronizations
    private int numberOfConstraints;                    // number of generated constraints
    private long time;                                  // model generation time (in milliseconds)

    /**
     *
     */
    public TimelineBasedProductionKnowledgeAuthoring() {
        super();
    }

    /**
     *
     * @return
     */
    public int getNumberOfConstraints() {
        return numberOfConstraints;
    }

    /**
     *
     * @return
     */
    public int getNumberOfPredicates() {
        return numberOfPredicates;
    }

    /**
     *
     * @return
     */
    public int getNumberOfSynchronizations() {
        return numberOfSynchronizations;
    }

    /**
     *
     * @return
     */
    public int getNumberOfVariables() {
        return numberOfVariables;
    }

    /**
     *
     * @return
     */
    public long getTime() {
        return time;
    }

    /**
     *
     * @return
     * @throws Exception
     */
    @Override
    public String compile()
            throws Exception
    {
        // check knowledge
        if (this.knowledge == null) {
            throw new Exception("No production knowledge has been set!");
        }

        // get start
        long start = System.currentTimeMillis();
        // set statistic data
        this.numberOfVariables = 0;
        this.numberOfPredicates = 0;
        this.numberOfConstraints = 0;
        this.numberOfSynchronizations = 0;
        this.time = 0;

        // prepare domain description
        String ddl = "DOMAIN KNOWLEDGE_PRODUCTION_AUTHORING_GEN {\n\n";

        // get production goals
        List<Resource> goals = this.knowledge.getProductionGoals();
        // add SV description
        ddl += this.sv("GoalVariableType", goals);

        // get workers
        List<Resource> workers = knowledge.getWorkOperators();
        // get functions
        List<Resource> hFuncs = knowledge.getFunctionsByAgent(workers.get(0));
        // add SV description
        ddl += this.sv("WorkerVariableType", hFuncs);

        // get cobots
        List<Resource> cobots = knowledge.getCobots();
        // get functions
        List<Resource> rFuncs = knowledge.getFunctionsByAgent(cobots.get(0));
        // add SV description
        ddl += this.sv("CobotVariableType", rFuncs);

        // get hierarchy
        List<List<Resource>> hierarchy = knowledge.getProductionHierarchy(goals.get(0));
        // create a SV for each hierarchical level
        for (int index = 0; index < hierarchy.size(); index++)
        {
            // get values
            List<Resource> values = hierarchy.get(index);
            // get production values
            ddl += this.sv("ProductionHierarchyL" + index + "Type", values);
        }

        // close domain description
        ddl += "\n}\n\n";
        // get compilation time
        this.time = System.currentTimeMillis() - start;
        // get domain description
        return ddl;
    }


    /**
     *
     * @param typeName
     * @param values
     * @return
     */
    private String sv(String typeName, List<Resource> values)
    {
        // increment the number of generated state variables
        this.numberOfVariables++;
        // prepare SV description
        String sv = "\tCOMP_TYPE SingletonStateVariable " + typeName + "(";
        for (Resource val : values) {
            // add predicate
            sv += val.getLocalName() + "(), ";
            // increment the number of created predicates
            this.numberOfPredicates++;
        }

        // add idle predicate
        sv += " Idle()) {\n\n";
        this.numberOfPredicates++;

        // add idle transitions
        sv += "\t\tVALUE Idle() [1, +INF]\n" +
                "\t\tMEETS {\n";
        // add transitions
        for (Resource val : values) {
            sv += "\t\t\t" + val.getLocalName() + "();\n";
        }
        // close transition
        sv += "\t\t}\n\n";

        // add transitions for all goals
        for (Resource val : values) {
            sv += "\t\tVALUE " + val.getLocalName() + "() [1, +INF]\n" +
                    "\t\tMEETS {\n" +
                    "\t\t\tIdle();\n" +
                    "\t\t}\n\n";
        }

        // close SV
        sv += "\t}\n\n";
        // get SV description
        return sv;
    }

}
