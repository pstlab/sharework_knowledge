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

	COMP_TYPE SingletonStateVariable WorkerVariableType(tightening-nuts-frontdoor(), setting-nuts-frontdoor(), manualguidance-frontdoor(), connect-harness-frontdoor(), manualguidance-reardoor(), tightening-nuts-reardoor(), tightening-bolts-reardoor(), connect-harness-reardoor(), setting-nuts-reardoor(), tightening-bolts-frontdoor(), moveto-bedarea(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			tightening-nuts-frontdoor();
			setting-nuts-frontdoor();
			manualguidance-frontdoor();
			connect-harness-frontdoor();
			manualguidance-reardoor();
			tightening-nuts-reardoor();
			tightening-bolts-reardoor();
			connect-harness-reardoor();
			setting-nuts-reardoor();
			tightening-bolts-frontdoor();
			moveto-bedarea();
		}

		VALUE tightening-nuts-frontdoor() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE setting-nuts-frontdoor() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE manualguidance-frontdoor() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE connect-harness-frontdoor() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE manualguidance-reardoor() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE tightening-nuts-reardoor() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE tightening-bolts-reardoor() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE connect-harness-reardoor() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE setting-nuts-reardoor() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE tightening-bolts-frontdoor() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE moveto-bedarea() [1, +INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable CobotVariableType(pickplace-reardoor(), pickplace-frontdoor(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			pickplace-reardoor();
			pickplace-frontdoor();
		}

		VALUE pickplace-reardoor() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-frontdoor() [1, +INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL0Type(r01(), r02(), h09(), h10(), h11(), h07(), h08(), h05(), h06(), h03(), h04(), h12(), h01(), h02(),  Idle()) {

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

	SYNCHRONIZE ProductionL0.tasks_l0 {

		VALUE r01() {

			d0 Cobot.tasks.pickplace-frontdoor();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE h09() {

			d0 Worker.operations.setting-nuts-reardoor();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE h10() {

			d0 Worker.operations.tightening-nuts-reardoor();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE h08() {

			d0 Worker.operations.setting-nuts-reardoor();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE h06() {

			d0 Worker.operations.moveto-bedarea();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE h04() {

			d0 Worker.operations.tightening-bolts-frontdoor();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE h12() {

			d0 Worker.operations.moveto-bedarea();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE h02() {

			d0 Worker.operations.manualguidance-frontdoor();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE r02() {

			d0 Cobot.tasks.pickplace-reardoor();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE h11() {

			d0 Worker.operations.tightening-nuts-reardoor();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE h07() {

			d0 Worker.operations.connect-harness-reardoor();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE h05() {

			d0 Worker.operations.tightening-nuts-frontdoor();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE h03() {

			d0 Worker.operations.setting-nuts-frontdoor();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE h01() {

			d0 Worker.operations.connect-harness-frontdoor();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}


}

