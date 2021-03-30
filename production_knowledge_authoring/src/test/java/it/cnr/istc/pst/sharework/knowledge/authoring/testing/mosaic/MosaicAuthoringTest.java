package it.cnr.istc.pst.sharework.knowledge.authoring.testing.mosaic;

import it.cnr.istc.pst.platinum.ai.framework.domain.component.PlanDataBase;
import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledgeDictionary;
import it.cnr.istc.pst.sharework.knowledge.authoring.hrc.ftl.TimelineBasedProductionKnowledgeAuthoring;
import org.apache.jena.rdf.model.Resource;
import org.junit.Assert;
import org.junit.Test;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 *
 */
public class MosaicAuthoringTest
{
    // get a reference to the knowledge
    private static final String ONTOLOGY_PATH = ProductionKnowledge.SHAREWORK_KNOWLEDGE +  "etc/ontologies/soho_mosaic_v0.4.owl";
    private static final String RULE_PATH = ProductionKnowledge.SHAREWORK_KNOWLEDGE +  "etc/ontologies/soho_rules_v1.0.rules";

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
        ProductionKnowledge knowledge = new ProductionKnowledge(ONTOLOGY_PATH, RULE_PATH);
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
        ProductionKnowledge knowledge = new ProductionKnowledge(ONTOLOGY_PATH, RULE_PATH);
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
        ProductionKnowledge knowledge = new ProductionKnowledge(ONTOLOGY_PATH, RULE_PATH);
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
    public void componentTest()
    {
        System.out.println("*********************************************");
        System.out.println("***** Test: componentTest() *****");

        // create production knowledge
        ProductionKnowledge knowledge = new ProductionKnowledge(ONTOLOGY_PATH, RULE_PATH);
        Assert.assertNotNull(knowledge);
        try
        {
            // get production goals
            List<Resource> goals = knowledge.getProductionGoals();
            Assert.assertNotNull(goals);
            Assert.assertTrue(goals.size() == 1);

            // create a domain component for each state variable starting from the goal state variable
            String comps = "\tCOMPONENT Goal {FLEXIBLE goals(functional)} : GoalVariableType;\n";

            // create a domain component for a worker and one component for the cobot
            List<Resource> workers = knowledge.getWorkOperators();
            Assert.assertNotNull(workers);
            Assert.assertTrue(workers.size() == 1);
            comps += "\tCOMPONENT Worker {FLEXIBLE operations(primitive}} : WorkerVariableType;\n";

            List<Resource> cobots = knowledge.getCobots();
            Assert.assertNotNull(cobots);
            Assert.assertTrue(cobots.size() == 1);
            comps += "\tCOMPONENT Cobot {FLEXIBLE tasks(primitive)} : CobotVariableType;\n";

            // create a state variable for each decomposition variable
            List<List<Resource>> hierarchy = knowledge.getProductionHierarchy(goals.get(0));
            for (int hlevel = 0; hlevel < hierarchy.size(); hlevel++) {
                // create h-level component
                comps += "\tCOMPONENT ProductionL" + hlevel + " {FLEXIBLE hlevel" + hlevel + "(functional)} : ProductionHierarchyL" + hlevel + "Type;\n";
            }

            // print resulting components
            System.out.println(comps);
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
    public void synchronizationTest()
    {
        System.out.println("*********************************************");
        System.out.println("***** Test: synchronizationTest() *****");

        // create production knowledge
        ProductionKnowledge knowledge = new ProductionKnowledge(ONTOLOGY_PATH, RULE_PATH);
        Assert.assertNotNull(knowledge);
        try
        {
            // get production goals
            List<Resource> goals = knowledge.getProductionGoals();
            Assert.assertNotNull(goals);
            Assert.assertTrue(goals.size() == 1);

            // Synchronization description
            String synch = "";
            // check the decomposition graph of each production goal
            for (Resource goal : goals)
            {
                // define synchronization rules related to the current goal
                System.out.println("Synchronization rules associated to goal " + goal.getLocalName() + " (" + goal.getURI() + "):\n\n");
                // get the decomposition graph
                List<Map<Resource, List<Set<Resource>>>> graphs = knowledge.getDecompositionGraph(goal);
                // check each possible decomposition - method
                for (Map<Resource, List<Set<Resource>>> graph : graphs)
                {
                    // get reference predicates/values
                    for (Resource reference : graph.keySet())
                    {
                        // check if decomposition is empty
                        if (!graph.get(reference).isEmpty())
                        {
                            // check if HRC (simple) task
                            if (knowledge.hasResourceType(reference, ProductionKnowledgeDictionary.SOHO_NS + "HRCTask"))
                            {
                                // check possible HRC task types
                                if (knowledge.hasResourceType(reference, ProductionKnowledgeDictionary.SOHO_NS + "SimultaneousHRCTask")) {
                                    // TODO simultaneous constraint
                                } else if (knowledge.hasResourceType(reference, ProductionKnowledgeDictionary.SOHO_NS + "SupportiveHRCTask")) {
                                    // TODO supportive constraint
                                } else if (knowledge.hasResourceType(reference, ProductionKnowledgeDictionary.SOHO_NS + "SynchronousHRCTask")) {
                                    // TODO synchronous constraint
                                } else    // independent task
                                {
                                    // check possible decompositions
                                    for (Set<Resource> decomposition : graph.get(reference)) {
                                        Assert.assertNotNull(decomposition);
                                        Assert.assertFalse(decomposition.isEmpty());
                                        Assert.assertTrue(decomposition.size() == 1);

                                        // create synchronization
                                        synch += "\tSYNCHRONIZE <component-name> {\n\n" +
                                                "\t\tVALUE " + reference.getLocalName() + "() {\n\n" +
                                                "\t\t\td0 <component-name>." + decomposition.stream().findFirst().get().getLocalName() + " ();\n" +
                                                "\t\t\tCONTAINS [0, +INF] [0, +INF] d0;\n" +
                                                "\t\t}\n\n";
                                    }
                                }
                            } else // any other type of complex task
                            {
                                // check possible decomposition
                                for (Set<Resource> decomposition : graph.get(reference))
                                {
                                    // check if empty
                                    if (!decomposition.isEmpty()) {
                                        // create synchronization
                                        synch += "\tSYNCHRONIZE <component-name> {\n\n" +
                                                "\t\t VALUE " + reference.getLocalName() + "() {\n\n";

                                        int dIndex = 0;
                                        for (Resource dec : decomposition) {
                                            // add decomposition description
                                            synch += "\t\t\td" + dIndex + " <component-name>." + dec.getLocalName() + "();\n" +
                                                    "\t\t\tCONTAINS [0, +INF] [0, +INF] d" + dIndex + ";\n";

                                            // increment
                                            dIndex++;
                                        }

                                        // close synchronization
                                        synch += "\t\t}\n\n";
                                    }
                                }
                            }
                        }
                    }
                }
            }

            // print description
            System.out.println(synch);
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
    public void authoringCompilationTest()
    {
        System.out.println("*********************************************");
        System.out.println("***** Test: authoringCompilationTest() *****");

        // create production knowledge
        TimelineBasedProductionKnowledgeAuthoring authoring = new TimelineBasedProductionKnowledgeAuthoring();
        Assert.assertNotNull(authoring);
        try
        {
            // load knowledge base
            authoring.setProductionKnowledge(ONTOLOGY_PATH, RULE_PATH);
            // get model
            String ddl = authoring.compile();
            System.out.println("Complied timeline-based planning model:\n\n" +
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
            authoring.setProductionKnowledge(ONTOLOGY_PATH, RULE_PATH);
            // get data structure
            PlanDataBase pdb = authoring.compileAndValidate();
            Assert.assertNotNull(pdb);
            System.out.println("Complied timeline-based planning model:\n\n" +
                    "" + pdb + "\n\n");

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
