package it.cnr.istc.pst.sharework.testing.knowledge.nissan;

import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import org.apache.jena.rdf.model.Resource;
import org.apache.jena.rdf.model.Statement;
import org.junit.Assert;
import org.junit.Test;

import java.util.*;

/**
 * JUnit class to test knowledge access and knowledge reasoning functionalities
 * encapsulated by the component ProductionKnowledge
 *
 */
public class NissanKnowledgeExtractionTest
{
    // get a reference to the knowledge
    private static final String ONTOLOGY_PATH = ProductionKnowledge.SHAREWORK_KNOWLEDGE +  "etc/ontologies/soho_nissan_v0.1.owl";
    private static final String RULE_PATH = ProductionKnowledge.SHAREWORK_KNOWLEDGE +  "etc/ontologies/soho_rules_v1.0.rules";

    /**
     * Test the extraction of known production goals from knowledge
     */
    @Test
    public void getProductionGoalsTest()
    {
        System.out.println("*********************************************");
        System.out.println("***** Test: getProductionGoalsTest() *****");

        // create production knowledge
        ProductionKnowledge knowledge = new ProductionKnowledge(ONTOLOGY_PATH, RULE_PATH);
        Assert.assertNotNull(knowledge);
        try
        {
            // get the goals
            List<Resource> goals = knowledge.getProductionGoals();
            Assert.assertNotNull(goals);
            Assert.assertFalse(goals.isEmpty());
            Assert.assertTrue(goals.size() == 1);       // expected one production goal

            for (Resource goal : goals) {
                Assert.assertNotNull(goal);
                System.out.println("> goal: " + goal.getLocalName() + " (" + goal.getURI() + ")");
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
     * Test the extraction of known autonomous agents from knowledge
     */
    @Test
    public void getAutonomousAgentsTest()
    {
        System.out.println("*********************************************");
        System.out.println("***** Test: getAutonomousAgentsTest() *****");

        // create production knowledge
        ProductionKnowledge knowledge = new ProductionKnowledge(ONTOLOGY_PATH, RULE_PATH);
        Assert.assertNotNull(knowledge);
        try
        {
            // get the goals
            List<Resource> agents = knowledge.getAgents();
            Assert.assertNotNull(agents);
            Assert.assertFalse(agents.isEmpty());
            Assert.assertTrue(agents.size() == 2);       // expected one robot and one human

            for (Resource agent: agents) {
                Assert.assertNotNull(agent);
                System.out.println("> agent: " + agent.getLocalName() + " (" + agent.getURI() + ")");
            }

            // check the exact number of operators
            List<Resource> operators = knowledge.getWorkOperators();
            Assert.assertNotNull(operators);
            Assert.assertTrue(operators.size() == 1);               // 1 operator expected

            // check the exact number of cobots
            List<Resource> cobots = knowledge.getCobots();
            Assert.assertNotNull(cobots);
            Assert.assertTrue(cobots.size() == 1);                  // 1 collaborative robot expected
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
     * Test the extraction of known (implemented) functions from knowledge
     */
    @Test
    public void getFunctionsTest()
    {
        System.out.println("*********************************************");
        System.out.println("***** Test: getFunctionsTest() *****");

        // create production knowledge
        ProductionKnowledge knowledge = new ProductionKnowledge(ONTOLOGY_PATH, RULE_PATH);
        Assert.assertNotNull(knowledge);
        try
        {
            // get the goals
            List<Resource> funcs = knowledge.getFunctions();
            Assert.assertNotNull(funcs);
            Assert.assertFalse(funcs.isEmpty());
            Assert.assertFalse(funcs.isEmpty());
            Assert.assertTrue(funcs.size() == 13);      // 13 functions expected in the NISSAN case

            for (Resource func : funcs)
            {
                // get function type
                Resource funcType = knowledge.getResourceType(func);
                Assert.assertNotNull(func);

                System.out.println("> [" + funcType.getLocalName() +"] function: " + func.getLocalName() + " (" + func.getURI() + ")");

                // retrieve function data properties
                List<Statement> stats = knowledge.getFunctionDataProperties(func);
                Assert.assertNotNull(stats);
                Assert.assertFalse(stats.isEmpty());
                System.out.println("\tFunction data properties:");
                for (Statement stat : stats) {
                    Assert.assertNotNull(stat);
                    String value = (String) stat.getObject().asNode().getLiteralValue();
                    Assert.assertNotNull(value);
                    System.out.println("\t\t" + stat + " ---> [" + value + "]");
                }



            }

            // check the number of functions of the cobot
            List<Resource> cobots = knowledge.getCobots();
            Assert.assertTrue(cobots.size() == 1);
            // get the only cobot expected
            Resource cobot = cobots.get(0);
            // check cobot's functions
            List<Resource> cFuncs = knowledge.getFunctionsByAgent(cobot);
            Assert.assertNotNull(cFuncs);
            Assert.assertTrue(cFuncs.size() == 2);
            System.out.println("Functions that can be performed by Cobot: " + cobot.getLocalName() + " (" + cobot.getURI() + ")");
            for (Resource f : cFuncs) {
                System.out.println("\t> function: " +  f.getLocalName() + " (" + f.getURI() + ")");
            }


            // check the number of functions of the operator
            List<Resource> workers = knowledge.getWorkOperators();
            Assert.assertTrue(workers.size() == 1);
            // get the only worker expected
            Resource worker = workers.get(0);
            // check worker's functions
            List<Resource> wFuncs = knowledge.getFunctionsByAgent(worker);
            Assert.assertNotNull(wFuncs);
            Assert.assertTrue(wFuncs.size() == 11);
            System.out.println("Functions that can be performed by Worker: " + worker.getLocalName() + " (" + worker.getURI() + ")");
            for (Resource f : wFuncs) {
                System.out.println("\t> function: " +  f.getLocalName() + " (" + f.getURI() + ")");
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
     * Test the extraction of the decomposition structure of production processes
     */
    @Test
    public void getDecompositionGraphTest()
    {
        System.out.println("*********************************************");
        System.out.println("***** Test: getDecompositionGraphTest() *****");

        // create production knowledge
        ProductionKnowledge knowledge = new ProductionKnowledge(ONTOLOGY_PATH, RULE_PATH);
        Assert.assertNotNull(knowledge);
        try
        {
            // get production goals
            List<Resource> goals = knowledge.getProductionGoals();
            Assert.assertNotNull(goals);
            // only one goal expected
            Assert.assertTrue(goals.size() == 1);

            // get the goal
            Resource goal = goals.get(0);
            // get production graphs for a given goal
            List<Map<Resource, List<Set<Resource>>>> graphs = knowledge.getDecompositionGraph(goal);
            // each graph is associated to a specific SOHO:ProductionMethod
            Assert.assertNotNull(graphs);
            // only one graph expected for a single production method
            Assert.assertTrue(graphs.size() == 1);
            // get the graph
            Map<Resource, List<Set<Resource>>> graph = graphs.get(0);
            Assert.assertNotNull(graph);

            // print retrieved production decomposition
            System.out.println("(Hierarchical) Production process for goal " + goal.getLocalName() + " (" + goal.getURI() + ")");
            // print graph structure
            for (Resource key : graph.keySet()) {
                // print key
                System.out.println("> Task " + key.getLocalName() + " (" + key.getURI() + ") has " +  graph.get(key).size() +" disjunctions:");
                int counter = 0;
                for (Set<Resource> decomposition : graph.get(key)) {
                    System.out.println("\t[" + counter +"] Possible decomposition:");
                    for (Resource subtask : decomposition) {
                        System.out.println("\t\tTask " + subtask.getLocalName() + " (" + subtask.getURI() + ")");
                    }

                    // increment decomposition counter
                    counter++;
                }
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
     * Test the extraction of the dependency graph structure of production processes
     */
    @Test
    public void getDependencyGraphTest()
    {
        System.out.println("*********************************************");
        System.out.println("***** Test: getDependencyGraphTest() *****");

        // create production knowledge
        ProductionKnowledge knowledge = new ProductionKnowledge(ONTOLOGY_PATH, RULE_PATH);
        Assert.assertNotNull(knowledge);
        try
        {
            // get production goals
            List<Resource> goals = knowledge.getProductionGoals();
            Assert.assertNotNull(goals);
            // only one goal expected
            Assert.assertTrue(goals.size() == 1);

            // get the goal
            Resource goal = goals.get(0);
            // get dependency graph for the considered production goal
            Map<Resource, Set<Resource>> graph = knowledge.getDependencyGraph(goal);
            // each graph is associated to a specific SOHO:ProductionMethod
            Assert.assertNotNull(graph);

            // print retrieved production decomposition
            System.out.println("Dependency graph for production goal " + goal.getLocalName() + " (" + goal.getURI() + ")");
            // print graph structure
            for (Resource key : graph.keySet()) {
                // print key
                System.out.println("> Task " + key.getLocalName() + " (" + key.getURI() + ") has " +  graph.get(key).size() +" disjunctions:");
                for (Resource subtask : graph.get(key)) {
                    System.out.println("\t\tTask " + subtask.getLocalName() + " (" + subtask.getURI() + ")");
                }
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
     * Test the extraction of the production hierarchy of production processes
     */
    @Test
    public void getProdutionHierarchyTest()
    {
        System.out.println("*********************************************");
        System.out.println("***** Test: getProdutionHierarchyTest() *****");

        // create production knowledge
        ProductionKnowledge knowledge = new ProductionKnowledge(ONTOLOGY_PATH, RULE_PATH);
        Assert.assertNotNull(knowledge);
        try
        {
            // get production goals
            List<Resource> goals = knowledge.getProductionGoals();
            Assert.assertNotNull(goals);
            // only one goal expected
            Assert.assertTrue(goals.size() == 1);

            // get the goal
            Resource goal = goals.get(0);
            // get production hierarchy
            List<List<Resource>> hierarchy = knowledge.getProductionHierarchy(goal);
            // check object
            Assert.assertNotNull(hierarchy);

            // print retrieved production hierarchy
            System.out.println("Production hierarhcy for production goal " + goal.getLocalName() + " (" + goal.getURI() + ")");
            // print graph structure
            for (int h = 0; h < hierarchy.size(); h++) {
                // print key
                System.out.println("> Hierarchical level [" + h + "]:");
                for (Resource task : hierarchy.get(h)) {
                    System.out.println("\t\tTask " + task.getLocalName() + " (" + task.getURI() + ")");
                }
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

}
