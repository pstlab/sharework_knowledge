package it.cnr.istc.pst.sharework.authoring;

import it.cnr.istc.pst.sharework.authoring.ex.ProductionKnowledgeAuthoringException;
import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledge;
import it.cnr.istc.pst.sharework.knowledge.ProductionKnowledgeUpdateSubscriber;
import org.apache.commons.logging.Log;
import org.ros.node.ConnectedNode;



/**
 *
 */
public abstract class ProductionKnowledgeAuthoring implements ProductionKnowledgeUpdateSubscriber {

    protected ProductionKnowledge knowledge;
    private Thread process;

    private static final Object signal = new Object();

    protected Log log;
    protected ConnectedNode node;

    /**
     *
     * @param node
     */
    public ProductionKnowledgeAuthoring(ConnectedNode node) {
        this();
        this.node = node;
        this.log = this.node != null ? this.node.getLog() : null;
    }

    /**
     *
     */
    private ProductionKnowledgeAuthoring() {

        // initialize variable
        this.knowledge = null;
        // create listener thread
        this.process = new Thread(new Runnable() {

            /**
             *
             */
            @Override
            public void run() {
                boolean run = true;
                while (run) {
                    try {

                        log.info("[Authoring] Wait for some update signal...");
                        synchronized (signal) {
                            // wait an update signal
                            signal.wait();
                        }

                        log.info("[Authoring] compiling production knowledge... ");
                        // compile production knowledge
                        String model = compile();
                        log.info("[Authoring] validating planning model... ");

                        // validate
                        if (validate(model)) {

                            log.info("[Authoring] Planning model successfully validated... ");
                            // prepare task planning data
                            prepare(model);
                            log.info("[Authoring] Data ready for planning and execution! ");

                        } else {

                            // restore knowledge
                            log.warn("[Authoring] Not valid planning model - restoring default production knowledge");
                            // not valid - reset production knowledge
                            knowledge.restore();
                        }

                    } catch (InterruptedException ex) {
                        // stop running
                        run = false;

                    }  catch (Exception ex) {

                        // model compilation or validation error, keep running but restore knowledge
                        if (log != null) {
                            log.error("[Authoring] Task planning model generation error:\n" +
                                    "- exception: " + ex.getClass().getName() + "\n" +
                                    "- message: " + ex.getMessage() + "\n");
                        }

                        try {

                            // restore knowledge
                            log.warn("[Authoring] Not valid planning model - restoring default production knowledge");
                            // not valid - reset production knowledge
                            knowledge.restore();

                        } catch (InterruptedException exx) {
                            // sto running
                            run = false;
                        }
                    }
                }
            }
        });
    }

    /**
     *
     */
    @Override
    public void update() {
        synchronized (signal) {
            // notify listeners
            signal.notifyAll();
        }
    }

    /**
     *
     * @param ontoPath
     * @param rulePath
     */
    public void setProductionKnowledge(String ontoPath, String rulePath) {
        this.knowledge = new ProductionKnowledge(ontoPath, rulePath);
    }

    /**
     *
     * @param knowledge
     */
    public void setProductionKnowledge(ProductionKnowledge knowledge) {
        this.knowledge = knowledge;
    }

    /**
     *
     * @param knowledge
     * @throws Exception
     */
    public void bind(ProductionKnowledge knowledge)
            throws Exception
    {
        // set knowledge
        this.knowledge = knowledge;
        // check if listener thread is alive
        if (this.process.isAlive()) {
            this.process.interrupt();
            this.process.join();
        }


        // start listener thread
        this.process.start();
        // subscribe to updates
        this.knowledge.subscribe(this);
    }

    /**
     *
     * @throws Exception
     */
    public void unbind()
            throws Exception
    {
        // unsubscribe to knowledge
        this.knowledge.unsubscribe(this);

        // stop listener thread
        if (this.process.isAlive()) {
            this.process.interrupt();
            this.process.join();
        }

        // clear reference
        this.knowledge = null;
    }

    /**
     * s
     * @return
     * @throws Exception
     */
    public String compile()
            throws InterruptedException, ProductionKnowledgeAuthoringException
    {
        // check knowledge
        if (this.knowledge == null) {
            throw new ProductionKnowledgeAuthoringException("No production knowledge has been set!");
        }

        // domain description
        String dom = null;
        try {

            // read transaction
            this.knowledge.beginReadTransaction();
            // actually compile the knowledge
            dom = this.doCompile();
        }
        finally  {

            // finish read transaction
            this.knowledge.finishReadTransaction();
        }

        // get domain description
        return dom;
    }

    /**
     *
     * @return
     * @throws InterruptedException
     * @throws ProductionKnowledgeAuthoringException
     */
    protected abstract String doCompile()
            throws InterruptedException, ProductionKnowledgeAuthoringException;

    /**
     *
     * @param model
     * @return
     * @throws ProductionKnowledgeAuthoringException
     */
    public boolean validate(String model)
            throws ProductionKnowledgeAuthoringException {
        // actually validate the model
        return this.doValidate(model);
    }


    /**
     *
     * @param model
     * @return
     * @throws ProductionKnowledgeAuthoringException
     */
    protected abstract boolean doValidate(String model)
            throws ProductionKnowledgeAuthoringException;


    /**
     *
     * @return
     * @throws InterruptedException
     * @throws ProductionKnowledgeAuthoringException
     */
    public boolean compileAndValidate()
            throws InterruptedException, ProductionKnowledgeAuthoringException {

        // first compile
        String model = this.compile();
        // validate the model
        return this.validate(model);
    }

    /**
     *
     * @param model
     */
    protected abstract void prepare(String model);
}
