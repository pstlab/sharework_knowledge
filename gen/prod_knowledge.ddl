DOMAIN KNOWLEDGE_PRODUCTION_AUTHORING_GEN {

	TEMPORAL_MODULE temporal_module = [0, 1000], 100;

	COMP_TYPE SingletonStateVariable GoalVariableType(nissan-case(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			nissan-case();
		}

		VALUE nissan-case() [1, +INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable WorkerVariableType(assembleNutsFrontDoor(), settingNutsFrontDoor(), manualGuidanceFrontDoor(), connectHarnessFrontDoor(), manualGuidanceRearDoor(), assembleNutsRearDoor(), screwBoltsRearDoor(), connectHarnessRearDoor(), settingNutsRearDoor(), screwBoltsFrontDoor(), moveToBedArea(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			assembleNutsFrontDoor();
			settingNutsFrontDoor();
			manualGuidanceFrontDoor();
			connectHarnessFrontDoor();
			manualGuidanceRearDoor();
			assembleNutsRearDoor();
			screwBoltsRearDoor();
			connectHarnessRearDoor();
			settingNutsRearDoor();
			screwBoltsFrontDoor();
			moveToBedArea();
		}

		VALUE assembleNutsFrontDoor() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE settingNutsFrontDoor() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE manualGuidanceFrontDoor() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE connectHarnessFrontDoor() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE manualGuidanceRearDoor() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE assembleNutsRearDoor() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE screwBoltsRearDoor() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE connectHarnessRearDoor() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE settingNutsRearDoor() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE screwBoltsFrontDoor() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE moveToBedArea() [1, +INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable CobotVariableType(pickPlaceRearDoor(), pickPlaceFrontDoor(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			pickPlaceRearDoor();
			pickPlaceFrontDoor();
		}

		VALUE pickPlaceRearDoor() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickPlaceFrontDoor() [1, +INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL0Type(nissan-task(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			nissan-task();
		}

		VALUE nissan-task() [1, +INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL1Type(r01(), r02(), h09(), h10(), h11(), h07(), h08(), h05(), h06(), h03(), h04(), h12(), h01(), h02(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			r01();
			r02();
			h09();
			h10();
			h11();
			h07();
			h08();
			h05();
			h06();
			h03();
			h04();
			h12();
			h01();
			h02();
		}

		VALUE r01() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE r02() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE h09() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE h10() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE h11() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE h07() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE h08() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE h05() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE h06() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE h03() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE h04() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE h12() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE h01() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE h02() [1, +INF]
		MEETS {
			Idle();
		}

	}


	COMPONENT Goal {FLEXIBLE goals(functional)} : GoalVariableType;
	COMPONENT Worker {FLEXIBLE operations(primitive)} :  WorkerVariableType;
	COMPONENT Cobot {FLEXIBLE tasks(primitive)} : CobotVariableType;
	COMPONENT ProductionL0 {FLEXIBLE tasks_l0(primitive)} : ProductionHierarchyL0Type;
	COMPONENT ProductionL1 {FLEXIBLE tasks_l1(primitive)} : ProductionHierarchyL1Type;

	SYNCHRONIZE ProductionL0.tasks_l0 {

		 VALUE nissan-task() {

			d0 ProductionL1.tasks_l1.r01();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL1.tasks_l1.r02();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionL1.tasks_l1.h09();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionL1.tasks_l1.h10();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionL1.tasks_l1.h11();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionL1.tasks_l1.h07();
			CONTAINS [0, +INF] [0, +INF] d5;
			d6 ProductionL1.tasks_l1.h08();
			CONTAINS [0, +INF] [0, +INF] d6;
			d7 ProductionL1.tasks_l1.h05();
			CONTAINS [0, +INF] [0, +INF] d7;
			d8 ProductionL1.tasks_l1.h06();
			CONTAINS [0, +INF] [0, +INF] d8;
			d9 ProductionL1.tasks_l1.h03();
			CONTAINS [0, +INF] [0, +INF] d9;
			d10 ProductionL1.tasks_l1.h04();
			CONTAINS [0, +INF] [0, +INF] d10;
			d11 ProductionL1.tasks_l1.h12();
			CONTAINS [0, +INF] [0, +INF] d11;
			d12 ProductionL1.tasks_l1.h01();
			CONTAINS [0, +INF] [0, +INF] d12;
			d13 ProductionL1.tasks_l1.h02();
			CONTAINS [0, +INF] [0, +INF] d13;
		}

	}

	SYNCHRONIZE ProductionL1.tasks_l1 {

		VALUE r01() {

			d0 Cobot.tasks.pickPlaceFrontDoor();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE h09() {

			d0 Worker.operations.settingNutsRearDoor();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE h10() {

			d0 Worker.operations.assembleNutsRearDoor();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE h08() {

			d0 Worker.operations.settingNutsRearDoor();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE h06() {

			d0 Worker.operations.moveToBedArea();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE h04() {

			d0 Worker.operations.screwBoltsFrontDoor();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE h12() {

			d0 Worker.operations.moveToBedArea();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE h02() {

			d0 Worker.operations.manualGuidanceFrontDoor();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE r02() {

			d0 Cobot.tasks.pickPlaceRearDoor();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE h11() {

			d0 Worker.operations.assembleNutsRearDoor();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE h07() {

			d0 Worker.operations.connectHarnessRearDoor();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE h05() {

			d0 Worker.operations.assembleNutsFrontDoor();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE h03() {

			d0 Worker.operations.settingNutsFrontDoor();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE h01() {

			d0 Worker.operations.connectHarnessFrontDoor();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE Goal.goals {

		VALUE nissan-case() {

			d0 ProductionL0.tasks_l0.nissan-task();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}


}

