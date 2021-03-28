package it.cnr.istc.pst.sharework.knowledge.authoring.testing.mosaic;

import it.cnr.istc.pst.platinum.ai.deliberative.Planner;
import it.cnr.istc.pst.platinum.ai.deliberative.PlannerBuilder;
import it.cnr.istc.pst.platinum.ai.framework.domain.component.PlanDataBase;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.lang.plan.SolutionPlan;
import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import it.cnr.istc.pst.sharework.knowledge.authoring.hrc.ftl.TimelineBasedProductionKnowledgeAuthoring;
import javafx.animation.Timeline;

/**
 *
 */
public class MosaicPlanningTest
{
    private static final String ONTOLOGY_PATH = ProductionKnowledge.SHAREWORK_KNOWLEDGE +  "etc/ontologies/soho_mosaic_v0.4.owl";
    private static final String PDL = ProductionKnowledge.SHAREWORK_KNOWLEDGE +  "gen/mosaic.pdl";

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
