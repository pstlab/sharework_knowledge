DOMAIN KNOWLEDGE_PRODUCTION_AUTHORING_GEN {

	TEMPORAL_MODULE temporal_module = [0, 10000], 100;

	PAR_TYPE EnumerationParameterType holes = {h1, h2, h3, h4, h5, h6, h7, h8};
	PAR_TYPE NumericParameterType pose = [0, 10000];

	COMP_TYPE SingletonStateVariable GoalVariableType(table-assembly-goal(), screw-goal(holes), screw-on-pose(pose), terminate(), Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			table-assembly-goal();
			screw-goal(?h);
			screw-on-pose(?p);
			terminate();
		}

		VALUE table-assembly-goal() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE screw-goal(?h) [1, + INF]
        MEETS {
            Idle();
        }

        VALUE screw-on-pose(?p) [1, +INF]
        MEETS {
            Idle();
        }

        VALUE terminate() [1, +INF]
        MEETS {
            Idle();
        }

	}

	COMP_TYPE SingletonStateVariable WorkerVariableType(_PickPlace(holes),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			_PickPlace(?h);
		}

		VALUE _PickPlace(?h) [1, 15]
		MEETS {
			Idle();
		}
	}

	COMP_TYPE SingletonStateVariable CobotVariableType(ScrewOnPose(pose), _Screw(holes),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			ScrewOnPose(?goal);
			_Screw(?hole);
		}

		VALUE ScrewOnPose(?goal) [1, +INF]
		MEETS {
		    Idle();
		}
		VALUE _Screw(?hole) [1, +INF]
        MEETS {
            Idle();
        }

	}

	COMP_TYPE SingletonStateVariable CobotMotionType(At(pose), _MoveToPose(pose)) {

	    VALUE At(?p) [1, +INF]
	    MEETS {
	        _MoveToPose(?goal);
	    }

	    VALUE _MoveToPose(?goal) [1, 100]
	    MEETS {
	        At(?pose);
	        ?pose = ?goal;
	    }

	}

	COMP_TYPE SingletonStateVariable CobotScrewDriverType(Idle(), _Screw(), _Unscrew()) {

        VALUE Idle() [1, +INF]
        MEETS {
            _Screw();
            _Unscrew();
        }

        VALUE _Screw() [1, 100]
        MEETS {
            Idle();
        }

        VALUE _Unscrew() [1, 100]
        MEETS {
            Idle();
        }
	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL0Type(doAutonomousScrew(holes), doScrewOnPose(pose), doRotaryTable(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			doRotaryTable();
			doAutonomousScrew(?h);
			doScrewOnPose(?p);
		}

		VALUE doAutonomousScrew(?h) [1, + INF]
        MEETS {
            Idle();
        }

		VALUE doRotaryTable() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doScrewOnPose(?p) [1, +INF]
		MEETS {
		    Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL1Type(doCollaborativeScrewH7(), doCollaborativeScrewH8(), doCollaborativeScrewH1(), doCollaborativeScrewH2(), doCollaborativeScrewH3(), doCollaborativeScrewH4(), doCollaborativeScrewH5(), doCollaborativeScrewH6(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			doCollaborativeScrewH7();
			doCollaborativeScrewH8();
			doCollaborativeScrewH1();
			doCollaborativeScrewH2();
			doCollaborativeScrewH3();
			doCollaborativeScrewH4();
			doCollaborativeScrewH5();
			doCollaborativeScrewH6();
		}

		VALUE doCollaborativeScrewH7() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCollaborativeScrewH8() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCollaborativeScrewH1() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCollaborativeScrewH2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCollaborativeScrewH3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCollaborativeScrewH4() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCollaborativeScrewH5() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCollaborativeScrewH6() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable HumanRobotInterfaceType (Idle(), ScrewingComplete()) {

	    VALUE Idle() [1, +INF]
	    MEETS {
	        ScrewingComplete();
	    }

	    VALUE ScrewingComplete() [1, 1]
	    MEETS {
	        Idle();
	    }
	}


	COMPONENT Goal {FLEXIBLE goals(functional)} : GoalVariableType;
	COMPONENT Worker {FLEXIBLE operations(primitive)} :  WorkerVariableType;
	COMPONENT HumanRobotInterface {FLEXIBLE msgs(primitive)} : HumanRobotInterfaceType;
	COMPONENT Cobot {FLEXIBLE tasks(primitive)} : CobotVariableType;
	COMPONENT CobotMotion {FLEXIBLE arm(primitive)} : CobotMotionType;
	COMPONENT CobotScrewDriver {FLEXIBLE tool(primitive)} : CobotScrewDriverType;
	COMPONENT ProductionL0 {FLEXIBLE tasks_l0(functional)} : ProductionHierarchyL0Type;
	COMPONENT ProductionL1 {FLEXIBLE tasks_l1(functional)} : ProductionHierarchyL1Type;

	SYNCHRONIZE ProductionL0.tasks_l0 {

		 VALUE doRotaryTable() {

			d0 ProductionL1.tasks_l1.doCollaborativeScrewH7();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL1.tasks_l1.doCollaborativeScrewH8();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionL1.tasks_l1.doCollaborativeScrewH1();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionL1.tasks_l1.doCollaborativeScrewH2();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionL1.tasks_l1.doCollaborativeScrewH3();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionL1.tasks_l1.doCollaborativeScrewH4();
			CONTAINS [0, +INF] [0, +INF] d5;
			d6 ProductionL1.tasks_l1.doCollaborativeScrewH5();
			CONTAINS [0, +INF] [0, +INF] d6;
			d7 ProductionL1.tasks_l1.doCollaborativeScrewH6();
			CONTAINS [0, +INF] [0, +INF] d7;
		}

		VALUE doAutonomousScrew(?h) {


		    d0 Cobot.tasks._Screw(?h0);

		    CONTAINS [0, +INF] [0, +INF] d0;

		    ?h0 = ?h;
		}

		VALUE doScrewOnPose(?goal) {

		    d0 Cobot.tasks.ScrewOnPose(?h0);

            CONTAINS [0, +INF] [0, +INF] d0;

            ?h0 = ?goal;
		}

	}

	SYNCHRONIZE ProductionL1.tasks_l1 {

		VALUE doCollaborativeScrewH7() {

			d0 Worker.operations._PickPlace(?hh);
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Cobot.tasks._Screw(?hr);
			CONTAINS [0, +INF] [0, +INF] d1;
			d0 BEFORE [0, +INF] d1;

			?hh = h7;
			?hr = h7;
		}

		VALUE doCollaborativeScrewH1() {

			d1 Cobot.tasks._Screw(?hr);
			CONTAINS [0, +INF] [0, +INF] d0;
			d0 Worker.operations._PickPlace(?hh);
			CONTAINS [0, +INF] [0, +INF] d1;
			d0 BEFORE [0, +INF] d1;

			?hh = h1;
			?hr = h1;
		}

		VALUE doCollaborativeScrewH3() {

            d0 Worker.operations._PickPlace(?hh);
            CONTAINS [0, +INF] [0, +INF] d0;
            d1 Cobot.tasks._Screw(?hr);
            CONTAINS [0, +INF] [0, +INF] d1;
            d0 BEFORE [0, +INF] d1;

            ?hh = h3;
            ?hr = h3;
        }

        VALUE doCollaborativeScrewH5() {

            d0 Worker.operations._PickPlace(?hh);
            CONTAINS [0, +INF] [0, +INF] d0;
            d1 Cobot.tasks._Screw(?hr);
            CONTAINS [0, +INF] [0, +INF] d1;
            d0 BEFORE [0, +INF] d1;

            ?hr = h5;
            ?hh = h5;
        }

        VALUE doCollaborativeScrewH8() {

            d1 Cobot.tasks._Screw(?hr);
            CONTAINS [0, +INF] [0, +INF] d0;
            d0 Worker.operations._PickPlace(?hh);
            CONTAINS [0, +INF] [0, +INF] d1;
            d0 BEFORE [0, +INF] d1;

            ?hh = h8;
            ?hr = h8;
        }

        VALUE doCollaborativeScrewH2() {

            d0 Worker.operations._PickPlace(?hh);
            CONTAINS [0, +INF] [0, +INF] d0;
            d1 Cobot.tasks._Screw(?hr);
            CONTAINS [0, +INF] [0, +INF] d1;
            d0 BEFORE [0, +INF] d1;

            ?hh = h2;
            ?hr = h2;
        }


        VALUE doCollaborativeScrewH4() {

            d0 Worker.operations._PickPlace(?hh);
            CONTAINS [0, +INF] [0, +INF] d0;
            d1 Cobot.tasks._Screw(?hr);
            CONTAINS [0, +INF] [0, +INF] d1;
            d0 BEFORE [0, +INF] d1;

            ?hh = h4;
            ?hr = h4;
        }

        VALUE doCollaborativeScrewH6() {

            d0 Worker.operations._PickPlace(?hh);
            CONTAINS [0, +INF] [0, +INF] d0;
            d1 Cobot.tasks._Screw(?hr);
            CONTAINS [0, +INF] [0, +INF] d1;
            d0 BEFORE [0, +INF] d1;

            ?hh = h6;
            ?hr = h6;
        }

	}

	SYNCHRONIZE Goal.goals {

	    VALUE terminate() {

            cd0 HumanRobotInterface.msgs.ScrewingComplete();

            CONTAINS [0, +INF] [0, +INF] cd0;
        }

		VALUE table-assembly-goal() {

			d0 ProductionL0.tasks_l0.doRotaryTable();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE screw-goal(?h) {

		    d0 ProductionL0.tasks_l0.doAutonomousScrew(?h0);

		    CONTAINS [0, +INF] [0, +INF] d0;

            ?h0 = ?h;
		}


		VALUE screw-on-pose(?goal) {

		    d0 ProductionL0.tasks_l0.doScrewOnPose(?h0);

            CONTAINS [0, +INF] [0, +INF] d0;

            ?h0 = ?goal;
		}

	}

	SYNCHRONIZE Cobot.tasks {

	    VALUE ScrewOnPose(?goal) {

	        cd0 CobotMotion.arm._MoveToPose(?pose);
	        cd1 CobotScrewDriver.tool._Screw();

	        CONTAINS [0, +INF] [0, +INF] cd0;
	        CONTAINS [0, +INF] [0, +INF] cd1;

	        cd0 BEFORE [0, +INF] cd1;

	        ?pose = ?goal;

	    }

	}


}

