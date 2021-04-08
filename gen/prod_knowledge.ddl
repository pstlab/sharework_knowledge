DOMAIN KNOWLEDGE_PRODUCTION_AUTHORING_GEN {

	TEMPORAL_MODULE temporal_module = [0, 1000], 100;

	COMP_TYPE SingletonStateVariable GoalVariableType(cembre_goal(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			cembre_goal();
		}

		VALUE cembre_goal() [1, +INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable WorkerVariableType(place_box_B(), place_box_A(), pick_squadra_piccola(), pick_squadra_grande(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			place_box_B();
			place_box_A();
			pick_squadra_piccola();
			pick_squadra_grande();
		}

		VALUE place_box_B() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE place_box_A() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pick_squadra_piccola() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pick_squadra_grande() [1, +INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable CobotVariableType(place_box_B(), place_box_A(), pick_squadra_piccola(), pick_squadra_grande(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			place_box_B();
			place_box_A();
			pick_squadra_piccola();
			pick_squadra_grande();
		}

		VALUE place_box_B() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE place_box_A() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pick_squadra_piccola() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pick_squadra_grande() [1, +INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL0Type(doCembreAssembly(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			doCembreAssembly();
		}

		VALUE doCembreAssembly() [1, +INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL1Type(doPickPlaceSquadraGrande2(), doPickPlaceSquadraGrande1(), doPickPlaceSquadraPiccola1(), doPickPlaceSquadraPiccola2(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			doPickPlaceSquadraGrande2();
			doPickPlaceSquadraGrande1();
			doPickPlaceSquadraPiccola1();
			doPickPlaceSquadraPiccola2();
		}

		VALUE doPickPlaceSquadraGrande2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doPickPlaceSquadraGrande1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doPickPlaceSquadraPiccola1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doPickPlaceSquadraPiccola2() [1, +INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL2Type(doPickPlaceSquadraGrandeHuman(), doPickPlaceSquadraGrandeRobot(), doPickPlaceSquadraPiccolaRobot(), doPickPlaceSquadraPiccolaHuman(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			doPickPlaceSquadraGrandeHuman();
			doPickPlaceSquadraGrandeRobot();
			doPickPlaceSquadraPiccolaRobot();
			doPickPlaceSquadraPiccolaHuman();
		}

		VALUE doPickPlaceSquadraGrandeHuman() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doPickPlaceSquadraGrandeRobot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doPickPlaceSquadraPiccolaRobot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doPickPlaceSquadraPiccolaHuman() [1, +INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL3Type(doPickSquadraPiccolaHuman(), doPlaceSquadraPiccolaRobot(), doPlaceSquadraPiccolaHuman(), doPickSquadraGrandeHuman(), doPlaceSquadraGrandeHuman(), doPlaceSquadraGrandeRobot(), doPickSquadraPiccolaRobot(), doPickSquadraGrandeRobot(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			doPickSquadraPiccolaHuman();
			doPlaceSquadraPiccolaRobot();
			doPlaceSquadraPiccolaHuman();
			doPickSquadraGrandeHuman();
			doPlaceSquadraGrandeHuman();
			doPlaceSquadraGrandeRobot();
			doPickSquadraPiccolaRobot();
			doPickSquadraGrandeRobot();
		}

		VALUE doPickSquadraPiccolaHuman() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doPlaceSquadraPiccolaRobot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doPlaceSquadraPiccolaHuman() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doPickSquadraGrandeHuman() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doPlaceSquadraGrandeHuman() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doPlaceSquadraGrandeRobot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doPickSquadraPiccolaRobot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doPickSquadraGrandeRobot() [1, +INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL4Type(doPlaceBoxARobot(), doPlaceBoxBRobot(), doPlaceBoxAHuman(), doPlaceBoxBHuman(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			doPlaceBoxARobot();
			doPlaceBoxBRobot();
			doPlaceBoxAHuman();
			doPlaceBoxBHuman();
		}

		VALUE doPlaceBoxARobot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doPlaceBoxBRobot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doPlaceBoxAHuman() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doPlaceBoxBHuman() [1, +INF]
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
	COMPONENT ProductionL4 {FLEXIBLE tasks_l4(primitive)} : ProductionHierarchyL4Type;

	SYNCHRONIZE ProductionL4.tasks_l4 {

		VALUE doPlaceBoxBRobot() {

			d0 Cobot.tasks.place_box_B();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doPlaceBoxBRobot() {

			d0 Cobot.tasks.place_box_B();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doPlaceBoxBRobot() {

			d0 Cobot.tasks.place_box_B();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doPlaceBoxBRobot() {

			d0 Cobot.tasks.place_box_B();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doPlaceBoxBHuman() {

			d0 Worker.operations.place_box_B();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doPlaceBoxBHuman() {

			d0 Worker.operations.place_box_B();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doPlaceBoxBHuman() {

			d0 Worker.operations.place_box_B();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doPlaceBoxBHuman() {

			d0 Worker.operations.place_box_B();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doPlaceBoxARobot() {

			d0 Cobot.tasks.place_box_A();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doPlaceBoxARobot() {

			d0 Cobot.tasks.place_box_A();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doPlaceBoxARobot() {

			d0 Cobot.tasks.place_box_A();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doPlaceBoxARobot() {

			d0 Cobot.tasks.place_box_A();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doPlaceBoxAHuman() {

			d0 Worker.operations.place_box_A();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doPlaceBoxAHuman() {

			d0 Worker.operations.place_box_A();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doPlaceBoxAHuman() {

			d0 Worker.operations.place_box_A();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doPlaceBoxAHuman() {

			d0 Worker.operations.place_box_A();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionL2.tasks_l2 {

		 VALUE doPickPlaceSquadraGrandeRobot() {

			d0 ProductionL3.tasks_l3.doPlaceSquadraGrandeRobot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL3.tasks_l3.doPickSquadraGrandeRobot();
			CONTAINS [0, +INF] [0, +INF] d1;
		}

		 VALUE doPickPlaceSquadraGrandeRobot() {

			d0 ProductionL3.tasks_l3.doPlaceSquadraGrandeRobot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL3.tasks_l3.doPickSquadraGrandeRobot();
			CONTAINS [0, +INF] [0, +INF] d1;
		}

		 VALUE doPickPlaceSquadraPiccolaHuman() {

			d0 ProductionL3.tasks_l3.doPlaceSquadraPiccolaHuman();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL3.tasks_l3.doPickSquadraPiccolaHuman();
			CONTAINS [0, +INF] [0, +INF] d1;
		}

		 VALUE doPickPlaceSquadraPiccolaHuman() {

			d0 ProductionL3.tasks_l3.doPlaceSquadraPiccolaHuman();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL3.tasks_l3.doPickSquadraPiccolaHuman();
			CONTAINS [0, +INF] [0, +INF] d1;
		}

		 VALUE doPickPlaceSquadraGrandeHuman() {

			d0 ProductionL3.tasks_l3.doPickSquadraGrandeHuman();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL3.tasks_l3.doPlaceSquadraGrandeHuman();
			CONTAINS [0, +INF] [0, +INF] d1;
		}

		 VALUE doPickPlaceSquadraGrandeHuman() {

			d0 ProductionL3.tasks_l3.doPickSquadraGrandeHuman();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL3.tasks_l3.doPlaceSquadraGrandeHuman();
			CONTAINS [0, +INF] [0, +INF] d1;
		}

		 VALUE doPickPlaceSquadraPiccolaRobot() {

			d0 ProductionL3.tasks_l3.doPickSquadraPiccolaRobot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL3.tasks_l3.doPlaceSquadraPiccolaRobot();
			CONTAINS [0, +INF] [0, +INF] d1;
		}

		 VALUE doPickPlaceSquadraPiccolaRobot() {

			d0 ProductionL3.tasks_l3.doPickSquadraPiccolaRobot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL3.tasks_l3.doPlaceSquadraPiccolaRobot();
			CONTAINS [0, +INF] [0, +INF] d1;
		}

	}

	SYNCHRONIZE ProductionL0.tasks_l0 {

		 VALUE doCembreAssembly() {

			d0 ProductionL1.tasks_l1.doPickPlaceSquadraGrande2();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL1.tasks_l1.doPickPlaceSquadraGrande1();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionL1.tasks_l1.doPickPlaceSquadraPiccola1();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionL1.tasks_l1.doPickPlaceSquadraPiccola2();
			CONTAINS [0, +INF] [0, +INF] d3;
		}

	}

	SYNCHRONIZE ProductionL3.tasks_l3 {

		 VALUE doPlaceSquadraPiccolaRobot() {

			d0 ProductionL4.tasks_l4.doPlaceBoxBRobot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doPlaceSquadraPiccolaRobot() {

			d0 ProductionL4.tasks_l4.doPlaceBoxARobot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doPlaceSquadraPiccolaRobot() {

			d0 ProductionL4.tasks_l4.doPlaceBoxBRobot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doPlaceSquadraPiccolaRobot() {

			d0 ProductionL4.tasks_l4.doPlaceBoxARobot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doPickSquadraPiccolaRobot() {

			d0 Cobot.tasks.pick_squadra_piccola();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doPickSquadraPiccolaRobot() {

			d0 Cobot.tasks.pick_squadra_piccola();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doPlaceSquadraGrandeRobot() {

			d0 ProductionL4.tasks_l4.doPlaceBoxBRobot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doPlaceSquadraGrandeRobot() {

			d0 ProductionL4.tasks_l4.doPlaceBoxARobot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doPlaceSquadraGrandeRobot() {

			d0 ProductionL4.tasks_l4.doPlaceBoxBRobot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doPlaceSquadraGrandeRobot() {

			d0 ProductionL4.tasks_l4.doPlaceBoxARobot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doPickSquadraGrandeRobot() {

			d0 Cobot.tasks.pick_squadra_grande();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doPickSquadraGrandeRobot() {

			d0 Cobot.tasks.pick_squadra_grande();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doPickSquadraPiccolaHuman() {

			d0 Worker.operations.pick_squadra_piccola();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doPickSquadraPiccolaHuman() {

			d0 Worker.operations.pick_squadra_piccola();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doPlaceSquadraPiccolaHuman() {

			d0 ProductionL4.tasks_l4.doPlaceBoxBHuman();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doPlaceSquadraPiccolaHuman() {

			d0 ProductionL4.tasks_l4.doPlaceBoxAHuman();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doPlaceSquadraPiccolaHuman() {

			d0 ProductionL4.tasks_l4.doPlaceBoxBHuman();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doPlaceSquadraPiccolaHuman() {

			d0 ProductionL4.tasks_l4.doPlaceBoxAHuman();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doPickSquadraGrandeHuman() {

			d0 Worker.operations.pick_squadra_grande();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doPickSquadraGrandeHuman() {

			d0 Worker.operations.pick_squadra_grande();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doPlaceSquadraGrandeHuman() {

			d0 ProductionL4.tasks_l4.doPlaceBoxBHuman();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doPlaceSquadraGrandeHuman() {

			d0 ProductionL4.tasks_l4.doPlaceBoxAHuman();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doPlaceSquadraGrandeHuman() {

			d0 ProductionL4.tasks_l4.doPlaceBoxBHuman();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doPlaceSquadraGrandeHuman() {

			d0 ProductionL4.tasks_l4.doPlaceBoxAHuman();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionL1.tasks_l1 {

		 VALUE doPickPlaceSquadraGrande2() {

			d0 ProductionL2.tasks_l2.doPickPlaceSquadraGrandeRobot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doPickPlaceSquadraGrande2() {

			d0 ProductionL2.tasks_l2.doPickPlaceSquadraGrandeHuman();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doPickPlaceSquadraPiccola1() {

			d0 ProductionL2.tasks_l2.doPickPlaceSquadraPiccolaRobot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doPickPlaceSquadraPiccola1() {

			d0 ProductionL2.tasks_l2.doPickPlaceSquadraPiccolaHuman();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doPickPlaceSquadraGrande1() {

			d0 ProductionL2.tasks_l2.doPickPlaceSquadraGrandeRobot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doPickPlaceSquadraGrande1() {

			d0 ProductionL2.tasks_l2.doPickPlaceSquadraGrandeHuman();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doPickPlaceSquadraPiccola2() {

			d0 ProductionL2.tasks_l2.doPickPlaceSquadraPiccolaRobot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doPickPlaceSquadraPiccola2() {

			d0 ProductionL2.tasks_l2.doPickPlaceSquadraPiccolaHuman();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE Goal.goals {

		VALUE cembre_goal() {

			d0 ProductionL0.tasks_l0.doCembreAssembly();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}


}

