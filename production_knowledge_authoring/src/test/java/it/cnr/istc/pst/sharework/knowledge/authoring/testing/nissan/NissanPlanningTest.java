package it.cnr.istc.pst.sharework.knowledge.authoring.testing.nissan;

import it.cnr.istc.pst.platinum.ai.deliberative.Planner;
import it.cnr.istc.pst.platinum.ai.deliberative.PlannerBuilder;
import it.cnr.istc.pst.platinum.ai.framework.domain.component.PlanDataBase;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.lang.plan.SolutionPlan;
import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import it.cnr.istc.pst.sharework.knowledge.authoring.hrc.ftl.TimelineBasedProductionKnowledgeAuthoring;

/**
 *
 */
public class NissanPlanningTest
{
    private static final String ONTOLOGY_PATH = ProductionKnowledge.SHAREWORK_KNOWLEDGE +  "etc/ontologies/soho_nissan_v0.1.owl";
    private static final String PDL = ProductionKnowledge.SHAREWORK_KNOWLEDGE +  "gen/nissan.pdl";

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
            authoring.setProductionKnowledge(ONTOLOGY_PATH);
            // get plan database
            PlanDataBase pdb = authoring.compileAndValidate();

            // create planner
            Planner planner = PlannerBuilder.createAndSet(pdb);
            SolutionPlan solution = planner.plan();
            System.out.println(solution);
            planner.display();
        }
        catch (Exception ex) {
            System.err.println(ex.getMessage());
        }
    }
}
