package it.cnr.istc.pst.sharework.knowledge;

import it.cnr.istc.pst.sharework.knowledge.dictionary.KnowledgeDictionary;
import org.apache.jena.rdf.model.Property;
import org.apache.jena.rdf.model.Resource;
import org.apache.jena.rdf.model.Statement;
import org.junit.Assert;
import org.junit.Test;

import java.util.List;

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
     * Test extraction of individuals
     */
    @Test
    public void checkIndividualTest()
    {
        // set ontological model
        String ontoModel = System.getenv("SHAREWORK_KNOWLEDGE_HOME") + "/etc/soho_demo_v1.1.owl";

        // create production knowledge
        ProductionKnowledge knowledge = new ProductionKnowledge(ontoModel);
        Assert.assertNotNull(knowledge);
        try
        {
            // get instances of simple tasks
            List<Resource> list = knowledge.getIndividuals(KnowledgeDictionary.getNS() + "SimpleTask");
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
        String ontoModel = System.getenv("SHAREWORK_KNOWLEDGE_HOME") + "/etc/soho_demo_v1.1.owl";

        // create production knowledge
        ProductionKnowledge knowledge = new ProductionKnowledge(ontoModel);
        Assert.assertNotNull(knowledge);
        try
        {
            // get instances of production goals
            List<Resource> goals = knowledge.getIndividuals(KnowledgeDictionary.getNS() + "ProductionGoal");
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
                Property hasPart = knowledge.getProperty(KnowledgeDictionary.getNS() + "hasPart");
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
                    System.out.println("\tProduction method: " + method.getLocalName() + " (" + method.getURI() + ")");

                    // check constituent property
                    Property hasConstituent = knowledge.getProperty(KnowledgeDictionary.DUL_NS + "hasConstituent");
                    Assert.assertNotNull(hasConstituent);

                    // check statements describing the structure of the method
                    List<Statement> clist = knowledge.listStatements(
                            method.getURI(), hasConstituent.getURI(), null);
                    // check statements
                    Assert.assertNotNull(clist);
                    Assert.assertTrue(clist.size() == 1);       // only one complex task expected
                    for (Statement cs : clist)
                    {
                        // get constituent
                        Resource ctask = cs.getObject().asResource();
                        Assert.assertNotNull(ctask);
                        System.out.println("\t\tComplex task: " + ctask.getLocalName() + " (" + ctask.getURI() + ")");

                        // check if complex
                        boolean isComplex = knowledge.hasResourceType(ctask, KnowledgeDictionary.getNS() + "ComplexTask");
                        // check complex type
                        Assert.assertTrue(isComplex);
                        // if complex retrieve internal structure
                        if (isComplex)
                        {
                            // extract information about internal tasks

                            /*
                             * TODO : check if able to read pick_place_x as subclasses of SOHO:Function
                             *  and not just as instances of SOHO:PickPlace
                             *
                             * (Check transitive relationships of individuals to upper classes of their type)
                             */
                        }
                    }

                }
            }
        }
        catch(Exception ex) {
            System.err.println(ex.getMessage());
        }
    }
}
