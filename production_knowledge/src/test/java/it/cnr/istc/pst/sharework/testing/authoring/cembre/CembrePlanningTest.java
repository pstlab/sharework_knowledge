package it.cnr.istc.pst.sharework.testing.authoring.cembre;

import it.cnr.istc.pst.platinum.ai.deliberative.Planner;
import it.cnr.istc.pst.platinum.ai.deliberative.PlannerBuilder;
import it.cnr.istc.pst.platinum.ai.framework.domain.component.PlanDataBase;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.lang.plan.SolutionPlan;
import it.cnr.istc.pst.sharework.authoring.hrc.ftl.TimelineBasedProductionKnowledgeAuthoring;
import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;

/**
 *
 */
public class CembrePlanningTest
{
    private static final String ONTOLOGY_PATH = ProductionKnowledge.SHAREWORK_KNOWLEDGE +  "etc/ontologies/soho_cembre_v0.1.owl";
    private static final String RULE_PATH = ProductionKnowledge.SHAREWORK_KNOWLEDGE +  "etc/ontologies/soho_rules_v1.0.rules";
    private static final String PDL = ProductionKnowledge.SHAREWORK_KNOWLEDGE +  "gen/cembre.pdl";

    /**
     *
     * @param args
     */
    public static void main(String[] args)
    {
        try
        {
            TimelineBasedProductionKnowledgeAuthoring authoring = new TimelineBasedProductionKnowledgeAuthoring(PDL);
            // load knowledge base
            authoring.setProductionKnowledge(ONTOLOGY_PATH, RULE_PATH);
            // get plan database
            if (authoring.compileAndValidate())
            {
                // get the PDB
                PlanDataBase pdb = authoring.pdb();

                // create planner
                Planner planner = PlannerBuilder.createAndSet(pdb);
                SolutionPlan solution = planner.plan();
                System.out.println(solution);
                planner.display();
            }
            else {
                // not valid
            }
        }
        catch (Exception ex) {
            System.err.println(ex.getMessage());
        }
    }
}