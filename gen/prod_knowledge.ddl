DOMAIN KNOWLEDGE_PRODUCTION_AUTHORING_GEN {

	TEMPORAL_MODULE temporal_module = [0, 1000], 100;

	COMP_TYPE SingletonStateVariable GoalVariableType(mosaic-goal(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			mosaic-goal();
		}

		VALUE mosaic-goal() [1, +INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable WorkerVariableType(pickplace-e1-human(), pickplace-d1-human(), pickplace-i1-human(), pickplace-h1-human(), pickplace-g1-human(), pickplace-f1-human(), pickplace-j1-human(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			pickplace-e1-human();
			pickplace-d1-human();
			pickplace-i1-human();
			pickplace-h1-human();
			pickplace-g1-human();
			pickplace-f1-human();
			pickplace-j1-human();
		}

		VALUE pickplace-e1-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-d1-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-i1-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-h1-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-g1-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-f1-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-j1-human() [1, +INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable CobotVariableType(pickplace-h1-robot(), pickplace-a1-robot(), pickplace-d1-robot(), pickplace-b1-robot(), pickplace-f1-robot(), pickplace-c1-robot(), pickplace-j1-robot(), pickplace-g1-robot(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			pickplace-h1-robot();
			pickplace-a1-robot();
			pickplace-d1-robot();
			pickplace-b1-robot();
			pickplace-f1-robot();
			pickplace-c1-robot();
			pickplace-j1-robot();
			pickplace-g1-robot();
		}

		VALUE pickplace-h1-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-a1-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-d1-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-b1-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-f1-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-c1-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-j1-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-g1-robot() [1, +INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL0Type(doMosaic(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			doMosaic();
		}

		VALUE doMosaic() [1, +INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL1Type(doRow4(), doRow2(), doRow5(), doRow1(), doRow3(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			doRow4();
			doRow2();
			doRow5();
			doRow1();
			doRow3();
		}

		VALUE doRow4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doRow2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doRow5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doRow1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doRow3() [1, +INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL2Type(doCellF1(), doCellG1(), doCellH1(), doCellI1(), doCellJ1(), doCellA1(), doCellB1(), doCellC1(), doCellD1(), doCellE1(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			doCellF1();
			doCellG1();
			doCellH1();
			doCellI1();
			doCellJ1();
			doCellA1();
			doCellB1();
			doCellC1();
			doCellD1();
			doCellE1();
		}

		VALUE doCellF1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellG1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellH1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellI1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellA1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellB1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellC1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellD1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellE1() [1, +INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL3Type(doCellG1robot(), doCellF1robot(), doCellH1robot(), doCellD1robot(), doCellJ1robot(), doCellG1human(), doCellF1human(), doCellH1human(), doCellJ1human(), doCellD1human(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			doCellG1robot();
			doCellF1robot();
			doCellH1robot();
			doCellD1robot();
			doCellJ1robot();
			doCellG1human();
			doCellF1human();
			doCellH1human();
			doCellJ1human();
			doCellD1human();
		}

		VALUE doCellG1robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellF1robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellH1robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellD1robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ1robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellG1human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellF1human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellH1human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ1human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellD1human() [1, +INF]
		MEETS {
			Idle();
		}

	}


	COMPONENT Goal {FLEXIBLE goals(functional)} : GoalVariableType;
	COMPONENT Worker {FLEXIBLE operations(primitive)} :  WorkerVariableType;
	COMPONENT Cobot {FLEXIBLE tasks(primitive)} : CobotVariableType;
	COMPONENT ProductionL0 {FLEXIBLE tasks_l0(primitive)} : ProductionHierarchyL0Type;
	COMPONENT ProductionL1 {FLEXIBLE tasks_l1(primitive)} : ProductionHierarchyL1Type;
	COMPONENT ProductionL2 {FLEXIBLE tasks_l2(primitive)} : ProductionHierarchyL2Type;
	COMPONENT ProductionL3 {FLEXIBLE tasks_l3(primitive)} : ProductionHierarchyL3Type;

	SYNCHRONIZE ProductionL2.tasks_l2 {

		 VALUE doCellF1() {

			d0 ProductionL3.tasks_l3.doCellF1robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellF1() {

			d0 ProductionL3.tasks_l3.doCellF1human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellG1() {

			d0 ProductionL3.tasks_l3.doCellG1robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellG1() {

			d0 ProductionL3.tasks_l3.doCellG1human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellH1() {

			d0 ProductionL3.tasks_l3.doCellH1robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellH1() {

			d0 ProductionL3.tasks_l3.doCellH1human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellI1() {

			d0 Worker.operations.pickplace-i1-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellJ1() {

			d0 ProductionL3.tasks_l3.doCellJ1robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellJ1() {

			d0 ProductionL3.tasks_l3.doCellJ1human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellA1() {

			d0 Cobot.tasks.pickplace-a1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellB1() {

			d0 Cobot.tasks.pickplace-b1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellC1() {

			d0 Cobot.tasks.pickplace-c1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellD1() {

			d0 ProductionL3.tasks_l3.doCellD1robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellD1() {

			d0 ProductionL3.tasks_l3.doCellD1human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellE1() {

			d0 Worker.operations.pickplace-e1-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionL0.tasks_l0 {

		 VALUE doMosaic() {

			d0 ProductionL1.tasks_l1.doRow5();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL1.tasks_l1.doRow4();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionL1.tasks_l1.doRow1();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionL1.tasks_l1.doRow3();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionL1.tasks_l1.doRow2();
			CONTAINS [0, +INF] [0, +INF] d4;
		}

	}

	SYNCHRONIZE ProductionL3.tasks_l3 {

		VALUE doCellG1robot() {

			d0 Cobot.tasks.pickplace-g1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellD1robot() {

			d0 Cobot.tasks.pickplace-d1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellF1robot() {

			d0 Cobot.tasks.pickplace-f1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellH1robot() {

			d0 Cobot.tasks.pickplace-h1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellJ1robot() {

			d0 Cobot.tasks.pickplace-j1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellG1human() {

			d0 Worker.operations.pickplace-g1-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellF1human() {

			d0 Worker.operations.pickplace-f1-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellH1human() {

			d0 Worker.operations.pickplace-h1-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellJ1human() {

			d0 Worker.operations.pickplace-j1-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellD1human() {

			d0 Worker.operations.pickplace-d1-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionL1.tasks_l1 {

		 VALUE doRow1() {

			d0 ProductionL2.tasks_l2.doCellF1();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL2.tasks_l2.doCellG1();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionL2.tasks_l2.doCellH1();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionL2.tasks_l2.doCellI1();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionL2.tasks_l2.doCellJ1();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionL2.tasks_l2.doCellA1();
			CONTAINS [0, +INF] [0, +INF] d5;
			d6 ProductionL2.tasks_l2.doCellB1();
			CONTAINS [0, +INF] [0, +INF] d6;
			d7 ProductionL2.tasks_l2.doCellC1();
			CONTAINS [0, +INF] [0, +INF] d7;
			d8 ProductionL2.tasks_l2.doCellD1();
			CONTAINS [0, +INF] [0, +INF] d8;
			d9 ProductionL2.tasks_l2.doCellE1();
			CONTAINS [0, +INF] [0, +INF] d9;
		}

	}


}

