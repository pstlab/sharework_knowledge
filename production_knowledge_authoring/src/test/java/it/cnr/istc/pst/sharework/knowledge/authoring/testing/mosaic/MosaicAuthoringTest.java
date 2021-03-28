package it.cnr.istc.pst.sharework.knowledge.authoring.testing.mosaic;

import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import it.cnr.istc.pst.sharework.knowledge.authoring.ftl.TimelineBasedProductionKnowledgeAuthoring;
import org.apache.jena.rdf.model.Resource;
import org.junit.Assert;
import org.junit.Test;

import java.util.List;

/**
 *
 */
public class MosaicAuthoringTest
{
    // get a reference to the knowledge
    private static final String ONTOLOGY_PATH = ProductionKnowledge.SHAREWORK_KNOWLEDGE +  "etc/ontologies/soho_mosaic_v0.3.owl";

    /**
     *
     * @param typeName
     * @param values
     * @return
     */
    private static String prepareStandardStateVariable(String typeName, List<Resource> values)
    {
        // prepare SV description
        String sv = "\tCOMP_TYPE SingletonStateVariable " + typeName + "(";
        for (Resource val : values) {
            // add predicate
            sv += val.getLocalName() + "(), ";
        }

        // add idle predicate
        sv += " Idle()) {\n\n";

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

    /**
     *
     */
    @Test
    public void goalStateVariablesTest()
    {
        System.out.println("*********************************************");
        System.out.println("***** Test: goalStateVariablesTest() *****");

        // create production knowledge
        ProductionKnowledge knowledge = new ProductionKnowledge(ONTOLOGY_PATH);
        Assert.assertNotNull(knowledge);
        try
        {
            // get production goals
            List<Resource> goals = knowledge.getProductionGoals();
            Assert.assertNotNull(goals);
            Assert.assertTrue(goals.size() >= 1);
            // get goal SV description
            String goalSV = prepareStandardStateVariable("GoalVariableType", goals);
            // print state variable
            System.out.println(goalSV);
        }
        catch (Exception ex) {
            // print error message
            System.err.println(ex.getMessage());
            Assert.assertTrue(false);
        }
        finally
        {
            // close test
            System.out.println("*********************************************");
            System.out.println();
        }
    }

    /**
     *
     */
    @Test
    public void agentFunctionsVariablesTest()
    {
        System.out.println("*********************************************");
        System.out.println("***** Test: agentFunctionsVariablesTest() *****");

        // create production knowledge
        ProductionKnowledge knowledge = new ProductionKnowledge(ONTOLOGY_PATH);
        Assert.assertNotNull(knowledge);
        try
        {
            // get workers
            List<Resource> workers = knowledge.getWorkOperators();
            Assert.assertNotNull(workers);
            Assert.assertTrue(workers.size() == 1);

            // get functions
            List<Resource> hFuncs = knowledge.getFunctionsByAgent(workers.get(0));
            // prepare agent SV description
            String hSV = prepareStandardStateVariable("WorkerVariableType", hFuncs);
            // print worker state variable
            System.out.println(hSV);


            // get cobots
            List<Resource> cobots = knowledge.getCobots();
            Assert.assertNotNull(cobots);
            Assert.assertTrue(cobots.size() == 1);
            // get functions
            List<Resource> rFuncs = knowledge.getFunctionsByAgent(cobots.get(0));
            // prepare agent SV description
            String rSV = prepareStandardStateVariable("CobotVariableType", rFuncs);
            // print worker state variable
            System.out.println(rSV);
        }
        catch (Exception ex) {
            // print error message
            System.err.println(ex.getMessage());
            Assert.assertTrue(false);
        }
        finally
        {
            // close test
            System.out.println("*********************************************");
            System.out.println();
        }
    }

    /**
     *
     */
    @Test
    public void productionVariablesTest()
    {
        System.out.println("*********************************************");
        System.out.println("***** Test: productionVariablesTest() *****");

        // create production knowledge
        ProductionKnowledge knowledge = new ProductionKnowledge(ONTOLOGY_PATH);
        Assert.assertNotNull(knowledge);
        try
        {
            // get production goals
            List<Resource> goals = knowledge.getProductionGoals();
            Assert.assertNotNull(goals);
            Assert.assertTrue(goals.size() == 1);
            // get hierarchy
            List<List<Resource>> hierarchy = knowledge.getProductionHierarchy(goals.get(0));
            // create a SV for each hierarchical level
            for (int index = 0; index < hierarchy.size(); index++)
            {
                // get values
                List<Resource> values = hierarchy.get(index);
                // get production values
                String sv = prepareStandardStateVariable("ProductionHierarchyL" + index + "Type", values);
                System.out.println(sv);
            }
        }
        catch (Exception ex) {
            // print error message
            System.err.println(ex.getMessage());
            Assert.assertTrue(false);
        }
        finally
        {
            // close test
            System.out.println("*********************************************");
            System.out.println();
        }
    }

    /**
     *
     */
    @Test
    public void authoringTest()
    {
        System.out.println("*********************************************");
        System.out.println("***** Test: authoringTest() *****");

        // create production knowledge
        TimelineBasedProductionKnowledgeAuthoring authoring = new TimelineBasedProductionKnowledgeAuthoring();
        Assert.assertNotNull(authoring);
        try
        {
            // load knowledge base
            authoring.setProductionKnowledge(ONTOLOGY_PATH);
            // get model
            String ddl = authoring.compile();
            System.out.println("Complied timeline-based planning model:\n" +
                    "" + ddl + "\n\n");

            // print some statistics
            System.out.println("Authoring statistics:\n" +
                    "- Number of SV: " + authoring.getNumberOfVariables() + "\n" +
                    "- Number of predicates: " + authoring.getNumberOfPredicates() + "\n" +
                    "- Number of synchronizations: " + authoring.getNumberOfSynchronizations() + "\n" +
                    "- Number of constraints: " + authoring.getNumberOfConstraints() + "\n" +
                    "- Time: " + authoring.getTime() + " (msecs)\n\n");
        }
        catch (Exception ex) {
            // print error message
            System.err.println(ex.getMessage());
            Assert.assertTrue(false);
        }
        finally
        {
            // close test
            System.out.println("*********************************************");
            System.out.println();
        }
    }

}
