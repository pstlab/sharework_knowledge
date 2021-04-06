package it.cnr.istc.pst.sharework.testing.knowledge;

import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledgeDictionary;
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
    // get a reference to the knowledge
    private static final String ONTOLOGY_PATH = ProductionKnowledge.SHAREWORK_KNOWLEDGE +  "etc/ontologies/soho_nissan_v0.1.owl";
    private static final String RULE_PATH = ProductionKnowledge.SHAREWORK_KNOWLEDGE +  "etc/ontologies/soho_rules_v1.0.rules";


    /**
     * Test production knowledge initialization and extraction of statements
     */
    @Test
    public void createProductionKnowledgeTest()
    {
        System.out.println("*********************************************");
        System.out.println("***** Test: createProductionKnowledgeTest() *****");

        // create production knowledge
        ProductionKnowledge knowledge = new ProductionKnowledge(ONTOLOGY_PATH, RULE_PATH);
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
        }

        // close test
        System.out.println("*********************************************");
    }

    /**
     * Test extraction of individuals and structures
     */
    @Test
    public void checkIndividualAndStructuresTest()
    {
        System.out.println("*********************************************");
        System.out.println("***** Test: checkIndividualAndStructuresTest() *****");

        // create production knowledge
        ProductionKnowledge knowledge = new ProductionKnowledge(ONTOLOGY_PATH, RULE_PATH);
        Assert.assertNotNull(knowledge);
        try
        {
            // get instances of simple tasks
            List<Resource> list = knowledge.getInstances(ProductionKnowledgeDictionary.SOHO_NS + "SimpleTask");
            // check list of individuals
            Assert.assertNotNull(list);
            Assert.assertFalse(list.isEmpty());
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
        finally
        {
            // close test
            System.out.println("*********************************************");
        }
    }

    /**
     * Test the extraction of the structure of production goals
     */
    @Test
    public void checkProductionGoalStructureTest()
    {
        System.out.println("*********************************************");
        System.out.println("***** Test: checkProductionGoalStructureTest() *****");

        // create production knowledge
        ProductionKnowledge knowledge = new ProductionKnowledge(ONTOLOGY_PATH, RULE_PATH);
        Assert.assertNotNull(knowledge);
        try
        {
            // get instances of production goals
            List<Resource> goals = knowledge.getInstances(ProductionKnowledgeDictionary.SOHO_NS + "ProductionGoal");
            // check list of individuals
            Assert.assertNotNull(goals);
            Assert.assertFalse(goals.isEmpty());
            Assert.assertTrue(goals.size() == 1);
            // print extracted individuals
            for (Resource g : goals)
            {
                // check resource
                Assert.assertNotNull(g);
                System.out.println("ProductionGoal: " + g.getLocalName() + " (" + g.getURI() + ")");

                // get property
                Property hasConstituent = knowledge.getProperty(ProductionKnowledgeDictionary.DUL_NS + "hasConstituent");
                Assert.assertNotNull(hasConstituent);

                // check associated production methods
                List<Statement> mlist = knowledge.listStatements(
                        g.getURI(), hasConstituent.getURI(), null);
                Assert.assertNotNull(mlist);
                Assert.assertTrue(mlist.size() == 1);
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
                    // print complex tasks
                    System.out.println("\tComplex tasks");
                    for (Resource ctask : ctasks) {
                        System.out.println("\t- " + ctask.getLocalName() + " (" + ctask.getURI() + ")");
                    }

                    Assert.assertFalse(stasks.isEmpty());
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
                    Assert.assertTrue(new ArrayList<>(unks).get(0).equals(method));
                }
            }
        }
        catch(Exception ex) {
            System.err.println(ex.getMessage());
            Assert.assertTrue(false);
        }
        finally
        {
            // close test
            System.out.println("*********************************************");
        }
    }


    /**
     * Test the extraction of known production goals
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
            Assert.assertTrue(goals.size() == 1);
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
        }
    }

    /**
     *
     */
    @Test
    public void createIndividualTest()
    {
        System.out.println("*********************************************");
        System.out.println("***** Test: createIndividualTest() *****");

        // create production knowledge
        ProductionKnowledge knowledge = new ProductionKnowledge(ONTOLOGY_PATH, RULE_PATH);
        Assert.assertNotNull(knowledge);
        try
        {
            // check number of known agents
            List<Resource> agents = knowledge.getAgents();
            // create an individual of class SOHO:Cobot
            Resource cobot = knowledge.createUniqueIndividual(ProductionKnowledgeDictionary.SOHO_NS + "Cobot");
            Assert.assertNotNull(cobot);
            System.out.println("> " + (cobot.getLocalName() == null ? "blank-node" : cobot.getLocalName()) + " (" + (cobot.getURI() == null ? cobot.asNode().getBlankNodeLabel() : cobot.getURI()) + ")");


            // check again the list of agents
            agents = knowledge.getAgents();
            Assert.assertNotNull(agents);
            Assert.assertFalse(agents.isEmpty());
            Assert.assertTrue(agents.size() == 3);
            System.out.println("Known agents (" + agents.size() + ")");
            for (Resource agent : agents) {
                // print known agent
                System.out.println("\t> " + agent + "");
            }

            // check cobot's functions
            List<Resource> funcs = knowledge.getFunctionsByAgent(cobot);
            Assert.assertNotNull(funcs);
            Assert.assertTrue(funcs.isEmpty());

            // create and individual of class SOHO:PickPlace
            Resource function = knowledge.createUniqueIndividual(ProductionKnowledgeDictionary.SOHO_NS + "PickPlace");
            Assert.assertNotNull(function);
            System.out.println("> " + (function.getLocalName() == null ? "blank-node" : function.getLocalName()) + " (" + (function.getURI() == null ? function.asNode().getBlankNodeLabel() : function.getURI()) + ")");

            // assert property
            Statement stat = knowledge.addAssertion(
                    function.getURI() == null ? function.asNode().getBlankNodeLabel() : function.getURI(),
                    ProductionKnowledgeDictionary.SOHO_NS + "canBePerformedBy",
                    cobot.getURI() == null ? cobot.asNode().getBlankNodeLabel() : cobot.getURI());
            Assert.assertNotNull(stat);
            System.out.println(stat);


            // check again cobot's functions
            funcs = knowledge.getFunctionsByAgent(cobot);
            Assert.assertNotNull(funcs);
            Assert.assertFalse(funcs.isEmpty());
            Assert.assertTrue(funcs.size() == 1);
            System.out.println("Functions of agent " + cobot + " (" + funcs.size() + ")");
            for (Resource fun : funcs) {
                System.out.println("\t> Function " + fun + "");
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
        }
    }


}
