package it.cnr.istc.pst.sharework.knowledge;

import org.apache.jena.rdf.model.Property;
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
public class ProductionKnowledgeTest
{
    /**
     * Test production knowledge initialization and extraction of statements
     */
    @Test
    public void createProductionKnowledgeTest()
    {
        // create production knowledge
        ProductionKnowledge knowledge = new ProductionKnowledge();
        Assert.assertNotNull(knowledge);

        // list statements
        List<Statement> list = knowledge.listStatements(null, null, null);
        Assert.assertNotNull(list);
        Assert.assertFalse(list.isEmpty());
        // print number of statements
        System.out.println("Number of statements: " + list.size() + "\n");

        // iterate over statements
        for (Statement s : list) {
            // check statement
            Assert.assertNotNull(s);
            // print statement
            System.out.println(s);
        }
    }

    /**
     * Test extraction of individuals and structures
     */
    @Test
    public void checkIndividualAndStructuresTest()
    {
        // set ontological model
        String ontoModel = System.getenv("SHAREWORK_KNOWLEDGE") + "/etc/soho_demo_v1.1.owl";

        // create production knowledge
        ProductionKnowledge knowledge = new ProductionKnowledge(ontoModel);
        Assert.assertNotNull(knowledge);
        try
        {
            // get instances of simple tasks
            List<Resource> list = knowledge.getIndividuals(ProductionKnowledgeDictionary.SOHO_NS + "SimpleTask");
            // check list of individuals
            Assert.assertNotNull(list);
            Assert.assertFalse(list.isEmpty());
            Assert.assertTrue(list.size() == 5);        // all the do_row_x tasks
            // print extracted individuals
            for (Resource r : list) {
                // check resource
                Assert.assertNotNull(r);
                System.out.println("Individual: " + r.getLocalName() + " (" + r.getURI() + ")");
            }
        }
        catch(Exception ex) {
            System.err.println(ex.getMessage());
        }
    }

    /**
     * Test the extraction of the structure of production goals
     */
    @Test
    public void checkProductionGoalStructureTest()
    {
        // set ontological model
        String ontoModel = System.getenv("SHAREWORK_KNOWLEDGE") + "/etc/soho_demo_v1.1.owl";

        // create production knowledge
        ProductionKnowledge knowledge = new ProductionKnowledge(ontoModel);
        Assert.assertNotNull(knowledge);
        try
        {
            // get instances of production goals
            List<Resource> goals = knowledge.getIndividuals(ProductionKnowledgeDictionary.SOHO_NS + "ProductionGoal");
            // check list of individuals
            Assert.assertNotNull(goals);
            Assert.assertFalse(goals.isEmpty());
            Assert.assertTrue(goals.size() == 1);        // the hrc_mosaic production goal
            // print extracted individuals
            for (Resource g : goals)
            {
                // check resource
                Assert.assertNotNull(g);
                System.out.println("ProductionGoal: " + g.getLocalName() + " (" + g.getURI() + ")");

                // get property
                Property hasPart = knowledge.getProperty(ProductionKnowledgeDictionary.SOHO_NS + "hasPart");
                Assert.assertNotNull(hasPart);

                // check associated production methods
                List<Statement> mlist = knowledge.listStatements(
                        g.getURI(), hasPart.getURI(), null);
                Assert.assertNotNull(mlist);
                Assert.assertTrue(mlist.size() == 1);       // only one decomposition method expected
                for (Statement ms : mlist)
                {
                    // get the method
                    Resource method = ms.getObject().asResource();
                    System.out.println("Production method: " + method.getLocalName() + " (" + method.getURI() + ")");

                    // get method structure
                    Map<Resource, Set<Resource>> structure = knowledge.retrieveResourceStructure(method);
                    Assert.assertNotNull(structure);
                    Assert.assertTrue(structure.containsKey(method));
                    Assert.assertTrue(structure.size() > 1);

                    // get all tasks
                    Set<Resource> tasks = structure.keySet();
                    Assert.assertNotNull(tasks);
                    // set of complex tasks
                    Set<Resource> ctasks = new HashSet<>();
                    // set of simple tasks
                    Set<Resource> stasks = new HashSet<>();
                    // set of functions
                    Set<Resource> funcs = new HashSet<>();
                    // set of "unknown" resources
                    Set<Resource> unks = new HashSet<>();
                    // check tasks
                    for (Resource task : tasks)
                    {
                        // check task type
                        if (knowledge.hasResourceType(task, ProductionKnowledgeDictionary.SOHO_NS + "ComplexTask")) {
                            // complex task
                            ctasks.add(task);
                        }
                        else if (knowledge.hasResourceType(task, ProductionKnowledgeDictionary.SOHO_NS + "SimpleTask")) {
                            // simple task
                            stasks.add(task);
                        }
                        else if (knowledge.hasResourceType(task, ProductionKnowledgeDictionary.SOHO_NS + "Function")) {
                            // function
                            funcs.add(task);
                        }
                        else {
                            // unknown
                            unks.add(task);
                        }
                    }

                    // check extracted information
                    Assert.assertFalse(ctasks.isEmpty());
                    Assert.assertTrue(ctasks.size() == 1);
                    // print complex tasks
                    System.out.println("\tComplex tasks");
                    for (Resource ctask : ctasks) {
                        System.out.println("\t- " + ctask.getLocalName() + " (" + ctask.getURI() + ")");
                    }

                    Assert.assertFalse(stasks.isEmpty());
                    Assert.assertTrue(stasks.size() == 5);
                    // print simple tasks
                    System.out.println("\t\tSimple tasks");
                    for (Resource stask : stasks) {
                        System.out.println("\t\t- " + stask.getLocalName() + " (" + stask.getURI() + ")");
                    }

                    Assert.assertFalse(funcs.isEmpty());
                    // print functions
                    System.out.println("\t\t\tFunctions");
                    for (Resource func : funcs) {
                        System.out.println("\t\t\t- " + func.getLocalName() + " (" + func.getURI() + ")");
                    }

                    // only the method is expected in this set
                    Assert.assertFalse(unks.isEmpty());
                    Assert.assertTrue(unks.size() == 1);
                    Assert.assertTrue(new ArrayList<>(unks).get(0).equals(method));
                }
            }
        }
        catch(Exception ex) {
            System.err.println(ex.getMessage());
            Assert.assertTrue(false);
        }
    }


    /**
     * Test the extraction of known production goals
     */
    @Test
    public void getProductionGoalsTest()
    {
        // set ontological model
        String ontoModel = System.getenv("SHAREWORK_KNOWLEDGE") + "/etc/soho_demo_v1.1.owl";

        // create production knowledge
        ProductionKnowledge knowledge = new ProductionKnowledge(ontoModel);
        Assert.assertNotNull(knowledge);
        try
        {
            // get the goals
            List<Resource> goals = knowledge.getProductionGoals();
            Assert.assertNotNull(goals);
            Assert.assertFalse(goals.isEmpty());
            Assert.assertTrue(goals.size() == 1);
        }
        catch (Exception ex) {
            // print error message
            System.err.println(ex.getMessage());
            Assert.assertTrue(false);
        }
    }

    /**
     * Test the extraction of production graphs associated to production goals
     *
     */
    @Test
    public void getProductionGraphsTest()
    {
        // set ontological model
        String ontoModel = System.getenv("SHAREWORK_KNOWLEDGE") + "/etc/soho_demo_v1.1.owl";

        // create production knowledge
        ProductionKnowledge knowledge = new ProductionKnowledge(ontoModel);
        Assert.assertNotNull(knowledge);
        try
        {
            // get the goals
            List<Resource> goals = knowledge.getProductionGoals();
            Assert.assertNotNull(goals);
            Assert.assertFalse(goals.isEmpty());
            Assert.assertTrue(goals.size() == 1);

            // get the only production goal expected
            Resource goal = goals.get(0);
            // get production graphs
            List<Map<Resource, Set<Resource>>> graphs = knowledge.getProductionGraph(goal);
            Assert.assertNotNull(graphs);
            Assert.assertFalse(graphs.isEmpty());
            // only one production graph expected
            Assert.assertTrue(graphs.size() == 1);

            // get the only graph expected
            Map<Resource, Set<Resource>> graph = graphs.get(0);
            // get set of tasks
            Set<Resource> tasks = graph.keySet();
            Assert.assertNotNull(tasks);
            Assert.assertFalse(tasks.isEmpty());
            // list of complex tasks
            List<Resource> ctasks = new ArrayList<>();
            // list of simple tasks
            List<Resource> stasks = new ArrayList<>();
            // list of functions
            List<Resource> funcs = new ArrayList<>();
            // check structure
            for (Resource task : tasks)
            {
                // check type
                if (knowledge.hasResourceType(task, ProductionKnowledgeDictionary.SOHO_NS + "ComplexTask")) {
                    // complex task
                    ctasks.add(task);
                }
                else if (knowledge.hasResourceType(task, ProductionKnowledgeDictionary.SOHO_NS + "SimpleTask")) {
                    // simple tasks
                    stasks.add(task);
                }
                else if (knowledge.hasResourceType(task, ProductionKnowledgeDictionary.SOHO_NS + "Function")) {
                    // function
                    funcs.add(task);
                }
                else {
                    // no task expected
                    Assert.assertFalse(true);
                }
            }

            // check retrieved data
            Assert.assertFalse(ctasks.isEmpty());
            Assert.assertTrue(ctasks.size() == 1);
            Assert.assertFalse(stasks.isEmpty());
            Assert.assertTrue(stasks.size() == 5);
            Assert.assertFalse(funcs.isEmpty());
            Assert.assertTrue(funcs.size() > 1);


            try
            {
                // check behavior in case of wrong parameter
                knowledge.getProductionGraph(ctasks.get(0));
                // error
                Assert.assertTrue(false);
            }
            catch (Exception ex) {
                // error expected
                Assert.assertTrue(true);
            }
        }
        catch (Exception ex) {
            // print error message
            System.err.println(ex.getMessage());
            Assert.assertTrue(false);
        }
    }
}
