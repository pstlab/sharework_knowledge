DOMAIN KNOWLEDGE_PRODUCTION_AUTHORING_GEN {

	TEMPORAL_MODULE temporal_module = [0, 1000], 100;

	COMP_TYPE SingletonStateVariable p3Type (Free(), Busy()) {
		VALUE Free() [1, +INF]
		MEETS {
			Busy();
		}

		VALUE Busy() [1, +INF]
		MEETS {
			Free();
		}

	}

	COMP_TYPE SingletonStateVariable p2Type (Free(), Busy()) {
		VALUE Free() [1, +INF]
		MEETS {
			Busy();
		}

		VALUE Busy() [1, +INF]
		MEETS {
			Free();
		}

	}

	COMP_TYPE SingletonStateVariable p1Type (Free(), Busy()) {
		VALUE Free() [1, +INF]
		MEETS {
			Busy();
		}

		VALUE Busy() [1, +INF]
		MEETS {
			Free();
		}

	}

	COMP_TYPE SingletonStateVariable p0Type (Free(), Busy()) {
		VALUE Free() [1, +INF]
		MEETS {
			Busy();
		}

		VALUE Busy() [1, +INF]
		MEETS {
			Free();
		}

	}

	COMP_TYPE SingletonStateVariable GoalVariableType(goal_a1610(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			goal_a1610();
		}

		VALUE goal_a1610() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable WorkerVariableType(_pickplace-p0-p1-a1610(), _pickplace-p1-p3-a1610(), _pickplace-p1-rbox-a1610-human(), _pickplace-p2-rbox-a1610-human(), _mount-p1-a1610-human(), _unmount-p2-a1610-human(), _pickplace-p1-p2-a1610(), _pickplace-pbox-p1-a1610(), _pickplace-pbox-p2-a1610-human(), _pickplace-p0-p2-a1610(), _mount-p2-a1610(), _unmount-p2-a1610(), _pickplace-p2-p3-a1610(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			_pickplace-p0-p1-a1610();
			_pickplace-p1-p3-a1610();
			_pickplace-p1-rbox-a1610-human();
			_pickplace-p2-rbox-a1610-human();
			_mount-p1-a1610-human();
			_unmount-p2-a1610-human();
			_pickplace-p1-p2-a1610();
			_pickplace-pbox-p1-a1610();
			_pickplace-pbox-p2-a1610-human();
			_pickplace-p0-p2-a1610();
			_mount-p2-a1610();
			_unmount-p2-a1610();
			_pickplace-p2-p3-a1610();
		}

		VALUE _pickplace-p0-p1-a1610() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p1-p3-a1610() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p1-rbox-a1610-human() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p2-rbox-a1610-human() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _mount-p1-a1610-human() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _unmount-p2-a1610-human() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p1-p2-a1610() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _pickplace-pbox-p1-a1610() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _pickplace-pbox-p2-a1610-human() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p0-p2-a1610() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _mount-p2-a1610() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _unmount-p2-a1610() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p2-p3-a1610() [10, 20]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable CobotVariableType(_pickplace-p2-rbox-a1610-robot(), _pickplace-pbox-p2-a1610-robot(), _pickplace-p1-rbox-a1610-robot(), _pickplace-pbox-p1-a1610-robot(), _unmount-p1-a1610-robot(), _mount-p1-a1610-robot(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			_pickplace-p2-rbox-a1610-robot();
			_pickplace-pbox-p2-a1610-robot();
			_pickplace-p1-rbox-a1610-robot();
			_pickplace-pbox-p1-a1610-robot();
			_unmount-p1-a1610-robot();
			_mount-p1-a1610-robot();
		}

		VALUE _pickplace-p2-rbox-a1610-robot() [20, 26]
		MEETS {
			Idle();
		}

		VALUE _pickplace-pbox-p2-a1610-robot() [20, 26]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p1-rbox-a1610-robot() [20, 26]
		MEETS {
			Idle();
		}

		VALUE _pickplace-pbox-p1-a1610-robot() [20, 26]
		MEETS {
			Idle();
		}

		VALUE _unmount-p1-a1610-robot() [20, 26]
		MEETS {
			Idle();
		}

		VALUE _mount-p1-a1610-robot() [20, 26]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG0L0Type(do_process_a1610(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_process_a1610();
		}

		VALUE do_process_a1610() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG0L1Type(do_process_p2_a1610(), do_process_p1_a1610(), do_process_p1p2_a1610(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_process_p2_a1610();
			do_process_p1_a1610();
			do_process_p1p2_a1610();
		}

		VALUE do_process_p2_a1610() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_process_p1_a1610() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_process_p1p2_a1610() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG0L2Type(do_pick_p2_a1610(), do_pick_p1_a1610(), do_place_p2_a1610(), do_release_p2_a1610(), do_finish_p1_a1610(), do_finish_p2_a1610(), do_mount_p2_a1610(), do_release_p1_a1610(), do_place_p1_a1610(), do_mount_p1_a1610(), do_place_p1p2_a1610(), do_unmount_p2_a1610(), do_unmount_p1_a1610(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_pick_p2_a1610();
			do_pick_p1_a1610();
			do_place_p2_a1610();
			do_release_p2_a1610();
			do_finish_p1_a1610();
			do_finish_p2_a1610();
			do_mount_p2_a1610();
			do_release_p1_a1610();
			do_place_p1_a1610();
			do_mount_p1_a1610();
			do_place_p1p2_a1610();
			do_unmount_p2_a1610();
			do_unmount_p1_a1610();
		}

		VALUE do_pick_p2_a1610() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_pick_p1_a1610() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_place_p2_a1610() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_release_p2_a1610() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_finish_p1_a1610() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_finish_p2_a1610() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_mount_p2_a1610() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_release_p1_a1610() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_place_p1_a1610() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_mount_p1_a1610() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_place_p1p2_a1610() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p2_a1610() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p1_a1610() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG0L3Type(do_pick_p1_a1610_robot(), do_unmount_p1_a1610_robot(), do_pick_p2_a1610_robot(), do_release_p2_a1610_robot(), do_release_p1_a1610_robot(), do_pick_p2_a1610_human(), do_pick_p1_a1610_human(), do_unmount_p1_a1610_human(), do_release_p1_a1610_human(), do_release_p2_a1610_human(), do_mount_p1_a1610_human(), do_mount_p1_a1610_robot(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_pick_p1_a1610_robot();
			do_unmount_p1_a1610_robot();
			do_pick_p2_a1610_robot();
			do_release_p2_a1610_robot();
			do_release_p1_a1610_robot();
			do_pick_p2_a1610_human();
			do_pick_p1_a1610_human();
			do_unmount_p1_a1610_human();
			do_release_p1_a1610_human();
			do_release_p2_a1610_human();
			do_mount_p1_a1610_human();
			do_mount_p1_a1610_robot();
		}

		VALUE do_pick_p1_a1610_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p1_a1610_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_pick_p2_a1610_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_release_p2_a1610_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_release_p1_a1610_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_pick_p2_a1610_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_pick_p1_a1610_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p1_a1610_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_release_p1_a1610_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_release_p2_a1610_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_mount_p1_a1610_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_mount_p1_a1610_robot() [1, + INF]
		MEETS {
			Idle();
		}

	}


	COMPONENT p3 {FLEXIBLE p3_state(primitive)} : p3Type;
	COMPONENT p2 {FLEXIBLE p2_state(primitive)} : p2Type;
	COMPONENT p1 {FLEXIBLE p1_state(primitive)} : p1Type;
	COMPONENT p0 {FLEXIBLE p0_state(primitive)} : p0Type;
	COMPONENT Goal {FLEXIBLE goals(functional)} : GoalVariableType;
	COMPONENT Worker {FLEXIBLE operations(primitive)} :  WorkerVariableType;
	COMPONENT Cobot {FLEXIBLE tasks(primitive)} : CobotVariableType;
	COMPONENT ProductionG0L0 {FLEXIBLE tasks_g0_l0(functional)} : ProductionHierarchyG0L0Type;
	COMPONENT ProductionG0L1 {FLEXIBLE tasks_g0_l1(functional)} : ProductionHierarchyG0L1Type;
	COMPONENT ProductionG0L2 {FLEXIBLE tasks_g0_l2(functional)} : ProductionHierarchyG0L2Type;
	COMPONENT ProductionG0L3 {FLEXIBLE tasks_g0_l3(functional)} : ProductionHierarchyG0L3Type;

	SYNCHRONIZE ProductionG0L3.tasks_g0_l3 {

		VALUE do_unmount_p1_a1610_robot() {

			d0 Cobot.tasks._unmount-p1-a1610-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_unmount_p1_a1610_robot() {

			d0 Cobot.tasks._unmount-p1-a1610-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_pick_p1_a1610_robot() {

			d0 Cobot.tasks._pickplace-pbox-p1-a1610-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_pick_p2_a1610_robot() {

			d0 Cobot.tasks._pickplace-pbox-p2-a1610-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_pick_p2_a1610_robot() {

			d0 Cobot.tasks._pickplace-pbox-p2-a1610-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_release_p2_a1610_robot() {

			d0 Cobot.tasks._pickplace-p2-rbox-a1610-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_release_p1_a1610_robot() {

			d0 Cobot.tasks._pickplace-p1-rbox-a1610-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_release_p1_a1610_robot() {

			d0 Cobot.tasks._pickplace-p1-rbox-a1610-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_pick_p2_a1610_human() {

			d0 Worker.operations._pickplace-pbox-p2-a1610-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_pick_p2_a1610_human() {

			d0 Worker.operations._pickplace-pbox-p2-a1610-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_pick_p1_a1610_human() {

			d0 Worker.operations._pickplace-pbox-p1-a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unmount_p1_a1610_human() {

			d0 Worker.operations._unmount-p2-a1610-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_unmount_p1_a1610_human() {

			d0 Worker.operations._unmount-p2-a1610-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_release_p1_a1610_human() {

			d0 Worker.operations._pickplace-p1-rbox-a1610-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_release_p1_a1610_human() {

			d0 Worker.operations._pickplace-p1-rbox-a1610-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_release_p2_a1610_human() {

			d0 Worker.operations._pickplace-p2-rbox-a1610-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_mount_p1_a1610_human() {

			d0 Worker.operations._mount-p1-a1610-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_mount_p1_a1610_robot() {

			d0 Cobot.tasks._mount-p1-a1610-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionG0L1.tasks_g0_l1 {

		 VALUE do_process_p2_a1610() {

			d0 ProductionG0L2.tasks_g0_l2.do_place_p2_a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG0L2.tasks_g0_l2.do_release_p2_a1610();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG0L2.tasks_g0_l2.do_finish_p2_a1610();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionG0L2.tasks_g0_l2.do_mount_p2_a1610();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionG0L2.tasks_g0_l2.do_pick_p2_a1610();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionG0L2.tasks_g0_l2.do_unmount_p2_a1610();
			CONTAINS [0, +INF] [0, +INF] d5;
			d4 BEFORE [0, +INF] d3;
			d3 BEFORE [0, +INF] d2;
			d5 BEFORE [0, +INF] d1;
			d1 BEFORE [0, +INF] d4;
			d0 BEFORE [0, +INF] d5;
		}

		 VALUE do_process_p1_a1610() {

			d0 ProductionG0L2.tasks_g0_l2.do_finish_p1_a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG0L2.tasks_g0_l2.do_release_p1_a1610();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG0L2.tasks_g0_l2.do_place_p1_a1610();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionG0L2.tasks_g0_l2.do_pick_p1_a1610();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionG0L2.tasks_g0_l2.do_mount_p1_a1610();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionG0L2.tasks_g0_l2.do_unmount_p1_a1610();
			CONTAINS [0, +INF] [0, +INF] d5;
			d4 BEFORE [0, +INF] d0;
			d1 BEFORE [0, +INF] d3;
			d3 BEFORE [0, +INF] d4;
			d2 BEFORE [0, +INF] d5;
			d5 BEFORE [0, +INF] d1;
		}

		 VALUE do_process_p1p2_a1610() {

			d0 ProductionG0L2.tasks_g0_l2.do_finish_p2_a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG0L2.tasks_g0_l2.do_place_p1p2_a1610();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG0L2.tasks_g0_l2.do_pick_p2_a1610();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionG0L2.tasks_g0_l2.do_mount_p2_a1610();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionG0L2.tasks_g0_l2.do_place_p1_a1610();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionG0L2.tasks_g0_l2.do_release_p1_a1610();
			CONTAINS [0, +INF] [0, +INF] d5;
			d6 ProductionG0L2.tasks_g0_l2.do_unmount_p1_a1610();
			CONTAINS [0, +INF] [0, +INF] d6;
			d1 BEFORE [0, +INF] d2;
			d2 BEFORE [0, +INF] d3;
			d6 BEFORE [0, +INF] d5;
			d5 BEFORE [0, +INF] d1;
			d4 BEFORE [0, +INF] d6;
			d3 BEFORE [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionG0L2.tasks_g0_l2 {

		 VALUE do_pick_p2_a1610() {

			d0 ProductionG0L3.tasks_g0_l3.do_pick_p2_a1610_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_pick_p2_a1610() {

			d0 ProductionG0L3.tasks_g0_l3.do_pick_p2_a1610_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_pick_p2_a1610() {

			d0 ProductionG0L3.tasks_g0_l3.do_pick_p2_a1610_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_pick_p2_a1610() {

			d0 ProductionG0L3.tasks_g0_l3.do_pick_p2_a1610_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_pick_p1_a1610() {

			d0 ProductionG0L3.tasks_g0_l3.do_pick_p1_a1610_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_pick_p1_a1610() {

			d0 ProductionG0L3.tasks_g0_l3.do_pick_p1_a1610_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_place_p2_a1610() {

			d0 Worker.operations._pickplace-p0-p2-a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		 VALUE do_release_p2_a1610() {

			d0 ProductionG0L3.tasks_g0_l3.do_release_p2_a1610_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_release_p2_a1610() {

			d0 ProductionG0L3.tasks_g0_l3.do_release_p2_a1610_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_finish_p1_a1610() {

			d0 Worker.operations._pickplace-p1-p3-a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p3.p3_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_finish_p2_a1610() {

			d0 Worker.operations._pickplace-p2-p3-a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p3.p3_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_finish_p2_a1610() {

			d0 Worker.operations._pickplace-p2-p3-a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p3.p3_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_mount_p2_a1610() {

			d0 Worker.operations._mount-p2-a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_mount_p2_a1610() {

			d0 Worker.operations._mount-p2-a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_place_p1_a1610() {

			d0 Worker.operations._pickplace-p0-p1-a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_place_p1_a1610() {

			d0 Worker.operations._pickplace-p0-p1-a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		 VALUE do_release_p1_a1610() {

			d0 ProductionG0L3.tasks_g0_l3.do_release_p1_a1610_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_release_p1_a1610() {

			d0 ProductionG0L3.tasks_g0_l3.do_release_p1_a1610_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_release_p1_a1610() {

			d0 ProductionG0L3.tasks_g0_l3.do_release_p1_a1610_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_release_p1_a1610() {

			d0 ProductionG0L3.tasks_g0_l3.do_release_p1_a1610_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_mount_p1_a1610() {

			d0 ProductionG0L3.tasks_g0_l3.do_mount_p1_a1610_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_mount_p1_a1610() {

			d0 ProductionG0L3.tasks_g0_l3.do_mount_p1_a1610_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_place_p1p2_a1610() {

			d0 Worker.operations._pickplace-p1-p2-a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unmount_p2_a1610() {

			d0 Worker.operations._unmount-p2-a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unmount_p1_a1610() {

			d0 ProductionG0L3.tasks_g0_l3.do_unmount_p1_a1610_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unmount_p1_a1610() {

			d0 ProductionG0L3.tasks_g0_l3.do_unmount_p1_a1610_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unmount_p1_a1610() {

			d0 ProductionG0L3.tasks_g0_l3.do_unmount_p1_a1610_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unmount_p1_a1610() {

			d0 ProductionG0L3.tasks_g0_l3.do_unmount_p1_a1610_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionG0L0.tasks_g0_l0 {

		 VALUE do_process_a1610() {

			d0 ProductionG0L1.tasks_g0_l1.do_process_p2_a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_process_a1610() {

			d0 ProductionG0L1.tasks_g0_l1.do_process_p1p2_a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_process_a1610() {

			d0 ProductionG0L1.tasks_g0_l1.do_process_p1_a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE Goal.goals {

		VALUE goal_a1610() {

			d0 ProductionG0L0.tasks_g0_l0.do_process_a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}


}

