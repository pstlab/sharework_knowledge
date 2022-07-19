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

	COMP_TYPE SingletonStateVariable GoalVariableType(goal_a1653(), goal_a1652(), goal_a1610(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			goal_a1653();
			goal_a1652();
			goal_a1610();
		}

		VALUE goal_a1653() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE goal_a1652() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE goal_a1610() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable WorkerVariableType(_unscrew-p1-a1653-human(), _pickplace-p0-p1-a1610(), _screw-p2-a1610-human(), _pickplace-p0-p2-a1652(), _screw-p1-a1652-human(), _pickplace-p2-p3-a1653(), _screw-p1-a1610-human(), _pickplace-p0-p1-a1652(), _mount-p2-a1652(), _unscrew-p2-a1610-human(), _unmount-p2-a1652(), _pickplace-p0-p2-a1653(), _mount-p1-a1652-human(), _unscrew-p2-a1652-human(), _screw-p2-a1653-human(), _mount-p2-a1653(), _pickplace-p1-p3-a1610(), _unmount-p2-a1653(), _unscrew-p1-a1610-human(), _pickplace-p2-p3-a1652(), _mount-p1-a1610-human(), _pickplace-p1-p2-a1653(), _unmount-p2-a1653-human(), _pickplace-p1-p2-a1610(), _unmount-p2-a1652-human(), _unmount-p2-a1610-human(), _unscrew-p2-a1653-human(), _unscrew-p1-a1652-human(), _screw-p1-a1653-human(), _pickplace-p1-p3-a1652(), _pickplace-p1-p2-a1652(), _pickplace-p0-p2-a1610(), _mount-p2-a1610(), _unmount-p2-a1610(), _pickplace-p1-p3-a1653(), _pickplace-p0-p1-a1653(), _mount-p1-a1653-human(), _screw-p2-a1652-human(), _pickplace-p2-p3-a1610(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			_unscrew-p1-a1653-human();
			_pickplace-p0-p1-a1610();
			_screw-p2-a1610-human();
			_pickplace-p0-p2-a1652();
			_screw-p1-a1652-human();
			_pickplace-p2-p3-a1653();
			_screw-p1-a1610-human();
			_pickplace-p0-p1-a1652();
			_mount-p2-a1652();
			_unscrew-p2-a1610-human();
			_unmount-p2-a1652();
			_pickplace-p0-p2-a1653();
			_mount-p1-a1652-human();
			_unscrew-p2-a1652-human();
			_screw-p2-a1653-human();
			_mount-p2-a1653();
			_pickplace-p1-p3-a1610();
			_unmount-p2-a1653();
			_unscrew-p1-a1610-human();
			_pickplace-p2-p3-a1652();
			_mount-p1-a1610-human();
			_pickplace-p1-p2-a1653();
			_unmount-p2-a1653-human();
			_pickplace-p1-p2-a1610();
			_unmount-p2-a1652-human();
			_unmount-p2-a1610-human();
			_unscrew-p2-a1653-human();
			_unscrew-p1-a1652-human();
			_screw-p1-a1653-human();
			_pickplace-p1-p3-a1652();
			_pickplace-p1-p2-a1652();
			_pickplace-p0-p2-a1610();
			_mount-p2-a1610();
			_unmount-p2-a1610();
			_pickplace-p1-p3-a1653();
			_pickplace-p0-p1-a1653();
			_mount-p1-a1653-human();
			_screw-p2-a1652-human();
			_pickplace-p2-p3-a1610();
		}

		VALUE _unscrew-p1-a1653-human() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p0-p1-a1610() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _screw-p2-a1610-human() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p0-p2-a1652() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _screw-p1-a1652-human() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p2-p3-a1653() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _screw-p1-a1610-human() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p0-p1-a1652() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _mount-p2-a1652() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _unscrew-p2-a1610-human() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _unmount-p2-a1652() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p0-p2-a1653() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _mount-p1-a1652-human() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _unscrew-p2-a1652-human() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _screw-p2-a1653-human() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _mount-p2-a1653() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p1-p3-a1610() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _unmount-p2-a1653() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _unscrew-p1-a1610-human() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p2-p3-a1652() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _mount-p1-a1610-human() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p1-p2-a1653() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _unmount-p2-a1653-human() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p1-p2-a1610() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _unmount-p2-a1652-human() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _unmount-p2-a1610-human() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _unscrew-p2-a1653-human() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _unscrew-p1-a1652-human() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _screw-p1-a1653-human() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p1-p3-a1652() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p1-p2-a1652() [10, 20]
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

		VALUE _pickplace-p1-p3-a1653() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p0-p1-a1653() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _mount-p1-a1653-human() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _screw-p2-a1652-human() [10, 20]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p2-p3-a1610() [10, 20]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable CobotVariableType(_mount-p1-a1653-robot(), _screw-p2-a1610-robot(), _unscrew-p1-a1653-robot(), _unscrew-p2-a1652-robot(), _unscrew-p1-a1652-robot(), _mount-p1-a1610-robot(), _screw-p1-a1610-robot(), _mount-p1-a1652-robot(), _unmount-p1-a1653-robot(), _unmount-p1-a1610-robot(), _screw-p1-a1653-robot(), _unscrew-p1-a1610-robot(), _unscrew-p2-a1610-robot(), _screw-p1-a1652-robot(), _unmount-p1-a1652-robot(), _screw-p2-a1652-robot(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			_mount-p1-a1653-robot();
			_screw-p2-a1610-robot();
			_unscrew-p1-a1653-robot();
			_unscrew-p2-a1652-robot();
			_unscrew-p1-a1652-robot();
			_mount-p1-a1610-robot();
			_screw-p1-a1610-robot();
			_mount-p1-a1652-robot();
			_unmount-p1-a1653-robot();
			_unmount-p1-a1610-robot();
			_screw-p1-a1653-robot();
			_unscrew-p1-a1610-robot();
			_unscrew-p2-a1610-robot();
			_screw-p1-a1652-robot();
			_unmount-p1-a1652-robot();
			_screw-p2-a1652-robot();
		}

		VALUE _mount-p1-a1653-robot() [20, 26]
		MEETS {
			Idle();
		}

		VALUE _screw-p2-a1610-robot() [20, 26]
		MEETS {
			Idle();
		}

		VALUE _unscrew-p1-a1653-robot() [20, 26]
		MEETS {
			Idle();
		}

		VALUE _unscrew-p2-a1652-robot() [20, 26]
		MEETS {
			Idle();
		}

		VALUE _unscrew-p1-a1652-robot() [20, 26]
		MEETS {
			Idle();
		}

		VALUE _mount-p1-a1610-robot() [20, 26]
		MEETS {
			Idle();
		}

		VALUE _screw-p1-a1610-robot() [20, 26]
		MEETS {
			Idle();
		}

		VALUE _mount-p1-a1652-robot() [20, 26]
		MEETS {
			Idle();
		}

		VALUE _unmount-p1-a1653-robot() [20, 26]
		MEETS {
			Idle();
		}

		VALUE _unmount-p1-a1610-robot() [20, 26]
		MEETS {
			Idle();
		}

		VALUE _screw-p1-a1653-robot() [20, 26]
		MEETS {
			Idle();
		}

		VALUE _unscrew-p1-a1610-robot() [20, 26]
		MEETS {
			Idle();
		}

		VALUE _unscrew-p2-a1610-robot() [20, 26]
		MEETS {
			Idle();
		}

		VALUE _screw-p1-a1652-robot() [20, 26]
		MEETS {
			Idle();
		}

		VALUE _unmount-p1-a1652-robot() [20, 26]
		MEETS {
			Idle();
		}

		VALUE _screw-p2-a1652-robot() [20, 26]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG0L0Type(do_process_a1653(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_process_a1653();
		}

		VALUE do_process_a1653() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG0L1Type(do_process_p2_a1653(), do_process_p1_a1653(), do_process_p1p2_a1653(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_process_p2_a1653();
			do_process_p1_a1653();
			do_process_p1p2_a1653();
		}

		VALUE do_process_p2_a1653() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_process_p1_a1653() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_process_p1p2_a1653() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG0L2Type(do_place_p2_a1653(), do_finish_p2_a1653(), do_finish_p1_a1653(), do_place_p1_a1653(), do_mount_p2_a1653(), do_place_p1p2_a1653(), do_mount_p1_a1653(), do_unmount_p2_a1653(), do_unmount_p1_a1653(), do_unscrew_p2_a1653(), do_screw_p2_a1653(), do_screw_p1_a1653(), do_unscrew_p1_a1653(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_place_p2_a1653();
			do_finish_p2_a1653();
			do_finish_p1_a1653();
			do_place_p1_a1653();
			do_mount_p2_a1653();
			do_place_p1p2_a1653();
			do_mount_p1_a1653();
			do_unmount_p2_a1653();
			do_unmount_p1_a1653();
			do_unscrew_p2_a1653();
			do_screw_p2_a1653();
			do_screw_p1_a1653();
			do_unscrew_p1_a1653();
		}

		VALUE do_place_p2_a1653() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_finish_p2_a1653() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_finish_p1_a1653() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_place_p1_a1653() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_mount_p2_a1653() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_place_p1p2_a1653() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_mount_p1_a1653() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p2_a1653() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p1_a1653() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unscrew_p2_a1653() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_screw_p2_a1653() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_screw_p1_a1653() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unscrew_p1_a1653() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG0L3Type(do_mount_p1_a1653_robot(), do_unscrew_p1_a1653_human(), do_unmount_p1_a1653_robot(), do_screw_p1_a1653_human(), do_screw_p1_a1653_robot(), do_unscrew_p1_a1653_robot(), do_unmount_p1_a1653_human(), do_mount_p1_a1653_human(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_mount_p1_a1653_robot();
			do_unscrew_p1_a1653_human();
			do_unmount_p1_a1653_robot();
			do_screw_p1_a1653_human();
			do_screw_p1_a1653_robot();
			do_unscrew_p1_a1653_robot();
			do_unmount_p1_a1653_human();
			do_mount_p1_a1653_human();
		}

		VALUE do_mount_p1_a1653_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unscrew_p1_a1653_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p1_a1653_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_screw_p1_a1653_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_screw_p1_a1653_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unscrew_p1_a1653_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p1_a1653_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_mount_p1_a1653_human() [1, + INF]
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

		VALUE do_mount_p1_a1653_robot() {

			d0 Cobot.tasks._mount-p1-a1653-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unscrew_p1_a1653_human() {

			d0 Worker.operations._unscrew-p1-a1653-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unscrew_p1_a1653_human() {

			d0 Worker.operations._unscrew-p1-a1653-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unmount_p1_a1653_robot() {

			d0 Cobot.tasks._unmount-p1-a1653-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unmount_p1_a1653_robot() {

			d0 Cobot.tasks._unmount-p1-a1653-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_screw_p1_a1653_human() {

			d0 Worker.operations._screw-p1-a1653-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_screw_p1_a1653_robot() {

			d0 Cobot.tasks._screw-p1-a1653-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unscrew_p1_a1653_robot() {

			d0 Cobot.tasks._unscrew-p1-a1653-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unscrew_p1_a1653_robot() {

			d0 Cobot.tasks._unscrew-p1-a1653-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unmount_p1_a1653_human() {

			d0 Worker.operations._unmount-p2-a1653-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unmount_p1_a1653_human() {

			d0 Worker.operations._unmount-p2-a1653-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_mount_p1_a1653_human() {

			d0 Worker.operations._mount-p1-a1653-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

	}

	SYNCHRONIZE ProductionG0L1.tasks_g0_l1 {

		 VALUE do_process_p2_a1653() {

			d0 ProductionG0L2.tasks_g0_l2.do_place_p2_a1653();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG0L2.tasks_g0_l2.do_unscrew_p2_a1653();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG0L2.tasks_g0_l2.do_finish_p2_a1653();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionG0L2.tasks_g0_l2.do_mount_p2_a1653();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionG0L2.tasks_g0_l2.do_screw_p2_a1653();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionG0L2.tasks_g0_l2.do_unmount_p2_a1653();
			CONTAINS [0, +INF] [0, +INF] d5;
			d4 BEFORE [0, +INF] d3;
			d3 BEFORE [0, +INF] d2;
			d5 BEFORE [0, +INF] d4;
			d0 BEFORE [0, +INF] d1;
			d1 BEFORE [0, +INF] d5;
		}

		 VALUE do_process_p1_a1653() {

			d0 ProductionG0L2.tasks_g0_l2.do_finish_p1_a1653();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG0L2.tasks_g0_l2.do_place_p1_a1653();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG0L2.tasks_g0_l2.do_screw_p1_a1653();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionG0L2.tasks_g0_l2.do_mount_p1_a1653();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionG0L2.tasks_g0_l2.do_unmount_p1_a1653();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionG0L2.tasks_g0_l2.do_unscrew_p1_a1653();
			CONTAINS [0, +INF] [0, +INF] d5;
			d2 BEFORE [0, +INF] d3;
			d3 BEFORE [0, +INF] d0;
			d5 BEFORE [0, +INF] d4;
			d4 BEFORE [0, +INF] d2;
			d1 BEFORE [0, +INF] d5;
		}

		 VALUE do_process_p1p2_a1653() {

			d0 ProductionG0L2.tasks_g0_l2.do_finish_p2_a1653();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG0L2.tasks_g0_l2.do_place_p1p2_a1653();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG0L2.tasks_g0_l2.do_place_p1_a1653();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionG0L2.tasks_g0_l2.do_mount_p2_a1653();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionG0L2.tasks_g0_l2.do_screw_p2_a1653();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionG0L2.tasks_g0_l2.do_unmount_p1_a1653();
			CONTAINS [0, +INF] [0, +INF] d5;
			d6 ProductionG0L2.tasks_g0_l2.do_unscrew_p1_a1653();
			CONTAINS [0, +INF] [0, +INF] d6;
			d4 BEFORE [0, +INF] d3;
			d3 BEFORE [0, +INF] d0;
			d5 BEFORE [0, +INF] d1;
			d1 BEFORE [0, +INF] d4;
			d2 BEFORE [0, +INF] d6;
			d6 BEFORE [0, +INF] d5;
		}

	}

	SYNCHRONIZE ProductionG0L2.tasks_g0_l2 {

		VALUE do_place_p2_a1653() {

			d0 Worker.operations._pickplace-p0-p2-a1653();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_finish_p2_a1653() {

			d0 Worker.operations._pickplace-p2-p3-a1653();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p3.p3_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_finish_p2_a1653() {

			d0 Worker.operations._pickplace-p2-p3-a1653();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p3.p3_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_finish_p1_a1653() {

			d0 Worker.operations._pickplace-p1-p3-a1653();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p3.p3_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_place_p1_a1653() {

			d0 Worker.operations._pickplace-p0-p1-a1653();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_place_p1_a1653() {

			d0 Worker.operations._pickplace-p0-p1-a1653();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_mount_p2_a1653() {

			d0 Worker.operations._mount-p2-a1653();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_mount_p2_a1653() {

			d0 Worker.operations._mount-p2-a1653();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_place_p1p2_a1653() {

			d0 Worker.operations._pickplace-p1-p2-a1653();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		 VALUE do_mount_p1_a1653() {

			d0 ProductionG0L3.tasks_g0_l3.do_mount_p1_a1653_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_mount_p1_a1653() {

			d0 ProductionG0L3.tasks_g0_l3.do_mount_p1_a1653_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_unmount_p2_a1653() {

			d0 Worker.operations._unmount-p2-a1653();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		 VALUE do_unmount_p1_a1653() {

			d0 ProductionG0L3.tasks_g0_l3.do_unmount_p1_a1653_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unmount_p1_a1653() {

			d0 ProductionG0L3.tasks_g0_l3.do_unmount_p1_a1653_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unmount_p1_a1653() {

			d0 ProductionG0L3.tasks_g0_l3.do_unmount_p1_a1653_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unmount_p1_a1653() {

			d0 ProductionG0L3.tasks_g0_l3.do_unmount_p1_a1653_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_unscrew_p2_a1653() {

			d0 Worker.operations._unscrew-p2-a1653-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_screw_p2_a1653() {

			d0 Worker.operations._screw-p2-a1653-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_screw_p2_a1653() {

			d0 Worker.operations._screw-p2-a1653-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		 VALUE do_screw_p1_a1653() {

			d0 ProductionG0L3.tasks_g0_l3.do_screw_p1_a1653_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_screw_p1_a1653() {

			d0 ProductionG0L3.tasks_g0_l3.do_screw_p1_a1653_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unscrew_p1_a1653() {

			d0 ProductionG0L3.tasks_g0_l3.do_unscrew_p1_a1653_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unscrew_p1_a1653() {

			d0 ProductionG0L3.tasks_g0_l3.do_unscrew_p1_a1653_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unscrew_p1_a1653() {

			d0 ProductionG0L3.tasks_g0_l3.do_unscrew_p1_a1653_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unscrew_p1_a1653() {

			d0 ProductionG0L3.tasks_g0_l3.do_unscrew_p1_a1653_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionG0L0.tasks_g0_l0 {

		 VALUE do_process_a1653() {

			d0 ProductionG0L1.tasks_g0_l1.do_process_p2_a1653();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_process_a1653() {

			d0 ProductionG0L1.tasks_g0_l1.do_process_p1p2_a1653();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_process_a1653() {

			d0 ProductionG0L1.tasks_g0_l1.do_process_p1_a1653();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE Goal.goals {

		VALUE goal_a1653() {

			d0 ProductionG0L0.tasks_g0_l0.do_process_a1653();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG1L0Type(do_process_a1652(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_process_a1652();
		}

		VALUE do_process_a1652() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG1L1Type(do_process_p2_a1652(), do_process_p1_a1652(), do_process_p1p2_a1652(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_process_p2_a1652();
			do_process_p1_a1652();
			do_process_p1p2_a1652();
		}

		VALUE do_process_p2_a1652() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_process_p1_a1652() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_process_p1p2_a1652() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG1L2Type(do_screw_p1_a1652(), do_unscrew_p2_a1652(), do_screw_p2_a1652(), do_unscrew_p1_a1652(), do_finish_p2_a1652(), do_place_p2_a1652(), do_finish_p1_a1652(), do_place_p1_a1652(), do_unmount_p1_a1652(), do_place_p1p2_a1652(), do_mount_p1_a1652(), do_mount_p2_a1652(), do_unmount_p2_a1652(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_screw_p1_a1652();
			do_unscrew_p2_a1652();
			do_screw_p2_a1652();
			do_unscrew_p1_a1652();
			do_finish_p2_a1652();
			do_place_p2_a1652();
			do_finish_p1_a1652();
			do_place_p1_a1652();
			do_unmount_p1_a1652();
			do_place_p1p2_a1652();
			do_mount_p1_a1652();
			do_mount_p2_a1652();
			do_unmount_p2_a1652();
		}

		VALUE do_screw_p1_a1652() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unscrew_p2_a1652() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_screw_p2_a1652() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unscrew_p1_a1652() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_finish_p2_a1652() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_place_p2_a1652() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_finish_p1_a1652() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_place_p1_a1652() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p1_a1652() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_place_p1p2_a1652() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_mount_p1_a1652() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_mount_p2_a1652() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p2_a1652() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG1L3Type(do_mount_p1_a1652_robot(), do_unmount_p1_a1652_robot(), do_unscrew_p2_a1652_human(), do_unscrew_p1_a1652_human(), do_screw_p1_a1652_human(), do_screw_p2_a1652_human(), do_screw_p2_a1652_robot(), do_screw_p1_a1652_robot(), do_unscrew_p2_a1652_robot(), do_unmount_p1_a1652_human(), do_unscrew_p1_a1652_robot(), do_mount_p1_a1652_human(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_mount_p1_a1652_robot();
			do_unmount_p1_a1652_robot();
			do_unscrew_p2_a1652_human();
			do_unscrew_p1_a1652_human();
			do_screw_p1_a1652_human();
			do_screw_p2_a1652_human();
			do_screw_p2_a1652_robot();
			do_screw_p1_a1652_robot();
			do_unscrew_p2_a1652_robot();
			do_unmount_p1_a1652_human();
			do_unscrew_p1_a1652_robot();
			do_mount_p1_a1652_human();
		}

		VALUE do_mount_p1_a1652_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p1_a1652_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unscrew_p2_a1652_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unscrew_p1_a1652_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_screw_p1_a1652_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_screw_p2_a1652_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_screw_p2_a1652_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_screw_p1_a1652_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unscrew_p2_a1652_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p1_a1652_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unscrew_p1_a1652_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_mount_p1_a1652_human() [1, + INF]
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
	COMPONENT ProductionG1L0 {FLEXIBLE tasks_g1_l0(functional)} : ProductionHierarchyG1L0Type;
	COMPONENT ProductionG1L1 {FLEXIBLE tasks_g1_l1(functional)} : ProductionHierarchyG1L1Type;
	COMPONENT ProductionG1L2 {FLEXIBLE tasks_g1_l2(functional)} : ProductionHierarchyG1L2Type;
	COMPONENT ProductionG1L3 {FLEXIBLE tasks_g1_l3(functional)} : ProductionHierarchyG1L3Type;

	SYNCHRONIZE ProductionG1L3.tasks_g1_l3 {

		VALUE do_mount_p1_a1652_robot() {

			d0 Cobot.tasks._mount-p1-a1652-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unmount_p1_a1652_robot() {

			d0 Cobot.tasks._unmount-p1-a1652-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unmount_p1_a1652_robot() {

			d0 Cobot.tasks._unmount-p1-a1652-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unscrew_p2_a1652_human() {

			d0 Worker.operations._unscrew-p2-a1652-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unscrew_p1_a1652_human() {

			d0 Worker.operations._unscrew-p1-a1652-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unscrew_p1_a1652_human() {

			d0 Worker.operations._unscrew-p1-a1652-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_screw_p1_a1652_human() {

			d0 Worker.operations._screw-p1-a1652-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_screw_p2_a1652_human() {

			d0 Worker.operations._screw-p2-a1652-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_screw_p2_a1652_human() {

			d0 Worker.operations._screw-p2-a1652-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_screw_p2_a1652_robot() {

			d0 Cobot.tasks._screw-p2-a1652-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_screw_p2_a1652_robot() {

			d0 Cobot.tasks._screw-p2-a1652-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_screw_p1_a1652_robot() {

			d0 Cobot.tasks._screw-p1-a1652-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unscrew_p2_a1652_robot() {

			d0 Cobot.tasks._unscrew-p2-a1652-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unmount_p1_a1652_human() {

			d0 Worker.operations._unmount-p2-a1652-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unmount_p1_a1652_human() {

			d0 Worker.operations._unmount-p2-a1652-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unscrew_p1_a1652_robot() {

			d0 Cobot.tasks._unscrew-p1-a1652-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unscrew_p1_a1652_robot() {

			d0 Cobot.tasks._unscrew-p1-a1652-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_mount_p1_a1652_human() {

			d0 Worker.operations._mount-p1-a1652-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

	}

	SYNCHRONIZE ProductionG1L0.tasks_g1_l0 {

		 VALUE do_process_a1652() {

			d0 ProductionG1L1.tasks_g1_l1.do_process_p2_a1652();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_process_a1652() {

			d0 ProductionG1L1.tasks_g1_l1.do_process_p1p2_a1652();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_process_a1652() {

			d0 ProductionG1L1.tasks_g1_l1.do_process_p1_a1652();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionG1L2.tasks_g1_l2 {

		 VALUE do_screw_p1_a1652() {

			d0 ProductionG1L3.tasks_g1_l3.do_screw_p1_a1652_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_screw_p1_a1652() {

			d0 ProductionG1L3.tasks_g1_l3.do_screw_p1_a1652_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unscrew_p2_a1652() {

			d0 ProductionG1L3.tasks_g1_l3.do_unscrew_p2_a1652_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unscrew_p2_a1652() {

			d0 ProductionG1L3.tasks_g1_l3.do_unscrew_p2_a1652_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_screw_p2_a1652() {

			d0 ProductionG1L3.tasks_g1_l3.do_screw_p2_a1652_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_screw_p2_a1652() {

			d0 ProductionG1L3.tasks_g1_l3.do_screw_p2_a1652_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_screw_p2_a1652() {

			d0 ProductionG1L3.tasks_g1_l3.do_screw_p2_a1652_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_screw_p2_a1652() {

			d0 ProductionG1L3.tasks_g1_l3.do_screw_p2_a1652_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unscrew_p1_a1652() {

			d0 ProductionG1L3.tasks_g1_l3.do_unscrew_p1_a1652_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unscrew_p1_a1652() {

			d0 ProductionG1L3.tasks_g1_l3.do_unscrew_p1_a1652_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unscrew_p1_a1652() {

			d0 ProductionG1L3.tasks_g1_l3.do_unscrew_p1_a1652_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unscrew_p1_a1652() {

			d0 ProductionG1L3.tasks_g1_l3.do_unscrew_p1_a1652_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_finish_p2_a1652() {

			d0 Worker.operations._pickplace-p2-p3-a1652();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p3.p3_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_finish_p2_a1652() {

			d0 Worker.operations._pickplace-p2-p3-a1652();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p3.p3_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_place_p2_a1652() {

			d0 Worker.operations._pickplace-p0-p2-a1652();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_finish_p1_a1652() {

			d0 Worker.operations._pickplace-p1-p3-a1652();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p3.p3_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_place_p1_a1652() {

			d0 Worker.operations._pickplace-p0-p1-a1652();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_place_p1_a1652() {

			d0 Worker.operations._pickplace-p0-p1-a1652();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		 VALUE do_unmount_p1_a1652() {

			d0 ProductionG1L3.tasks_g1_l3.do_unmount_p1_a1652_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unmount_p1_a1652() {

			d0 ProductionG1L3.tasks_g1_l3.do_unmount_p1_a1652_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unmount_p1_a1652() {

			d0 ProductionG1L3.tasks_g1_l3.do_unmount_p1_a1652_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unmount_p1_a1652() {

			d0 ProductionG1L3.tasks_g1_l3.do_unmount_p1_a1652_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_place_p1p2_a1652() {

			d0 Worker.operations._pickplace-p1-p2-a1652();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		 VALUE do_mount_p1_a1652() {

			d0 ProductionG1L3.tasks_g1_l3.do_mount_p1_a1652_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_mount_p1_a1652() {

			d0 ProductionG1L3.tasks_g1_l3.do_mount_p1_a1652_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_mount_p2_a1652() {

			d0 Worker.operations._mount-p2-a1652();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_mount_p2_a1652() {

			d0 Worker.operations._mount-p2-a1652();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unmount_p2_a1652() {

			d0 Worker.operations._unmount-p2-a1652();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

	}

	SYNCHRONIZE Goal.goals {

		VALUE goal_a1652() {

			d0 ProductionG1L0.tasks_g1_l0.do_process_a1652();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionG1L1.tasks_g1_l1 {

		 VALUE do_process_p2_a1652() {

			d0 ProductionG1L2.tasks_g1_l2.do_finish_p2_a1652();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG1L2.tasks_g1_l2.do_place_p2_a1652();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG1L2.tasks_g1_l2.do_unscrew_p2_a1652();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionG1L2.tasks_g1_l2.do_screw_p2_a1652();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionG1L2.tasks_g1_l2.do_mount_p2_a1652();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionG1L2.tasks_g1_l2.do_unmount_p2_a1652();
			CONTAINS [0, +INF] [0, +INF] d5;
			d3 BEFORE [0, +INF] d4;
			d4 BEFORE [0, +INF] d0;
			d2 BEFORE [0, +INF] d5;
			d5 BEFORE [0, +INF] d3;
			d1 BEFORE [0, +INF] d2;
		}

		 VALUE do_process_p1_a1652() {

			d0 ProductionG1L2.tasks_g1_l2.do_screw_p1_a1652();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG1L2.tasks_g1_l2.do_unmount_p1_a1652();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG1L2.tasks_g1_l2.do_finish_p1_a1652();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionG1L2.tasks_g1_l2.do_place_p1_a1652();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionG1L2.tasks_g1_l2.do_mount_p1_a1652();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionG1L2.tasks_g1_l2.do_unscrew_p1_a1652();
			CONTAINS [0, +INF] [0, +INF] d5;
			d4 BEFORE [0, +INF] d2;
			d0 BEFORE [0, +INF] d4;
			d5 BEFORE [0, +INF] d1;
			d1 BEFORE [0, +INF] d0;
			d3 BEFORE [0, +INF] d5;
		}

		 VALUE do_process_p1p2_a1652() {

			d0 ProductionG1L2.tasks_g1_l2.do_finish_p2_a1652();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG1L2.tasks_g1_l2.do_unmount_p1_a1652();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG1L2.tasks_g1_l2.do_place_p1p2_a1652();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionG1L2.tasks_g1_l2.do_place_p1_a1652();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionG1L2.tasks_g1_l2.do_screw_p2_a1652();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionG1L2.tasks_g1_l2.do_mount_p2_a1652();
			CONTAINS [0, +INF] [0, +INF] d5;
			d6 ProductionG1L2.tasks_g1_l2.do_unscrew_p1_a1652();
			CONTAINS [0, +INF] [0, +INF] d6;
			d5 BEFORE [0, +INF] d0;
			d2 BEFORE [0, +INF] d4;
			d4 BEFORE [0, +INF] d5;
			d1 BEFORE [0, +INF] d2;
			d3 BEFORE [0, +INF] d6;
			d6 BEFORE [0, +INF] d1;
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG2L0Type(do_process_a1610(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_process_a1610();
		}

		VALUE do_process_a1610() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG2L1Type(do_process_p2_a1610(), do_process_p1_a1610(), do_process_p1p2_a1610(),  Idle()) {

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

	COMP_TYPE SingletonStateVariable ProductionHierarchyG2L2Type(do_unscrew_p2_a1610(), do_screw_p2_a1610(), do_screw_p1_a1610(), do_unscrew_p1_a1610(), do_place_p2_a1610(), do_finish_p1_a1610(), do_finish_p2_a1610(), do_mount_p2_a1610(), do_place_p1_a1610(), do_mount_p1_a1610(), do_place_p1p2_a1610(), do_unmount_p2_a1610(), do_unmount_p1_a1610(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_unscrew_p2_a1610();
			do_screw_p2_a1610();
			do_screw_p1_a1610();
			do_unscrew_p1_a1610();
			do_place_p2_a1610();
			do_finish_p1_a1610();
			do_finish_p2_a1610();
			do_mount_p2_a1610();
			do_place_p1_a1610();
			do_mount_p1_a1610();
			do_place_p1p2_a1610();
			do_unmount_p2_a1610();
			do_unmount_p1_a1610();
		}

		VALUE do_unscrew_p2_a1610() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_screw_p2_a1610() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_screw_p1_a1610() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unscrew_p1_a1610() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_place_p2_a1610() [1, + INF]
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

	COMP_TYPE SingletonStateVariable ProductionHierarchyG2L3Type(do_unscrew_p1_a1610_human(), do_unscrew_p2_a1610_human(), do_unmount_p1_a1610_robot(), do_unscrew_p1_a1610_robot(), do_unscrew_p2_a1610_robot(), do_unmount_p1_a1610_human(), do_screw_p1_a1610_robot(), do_screw_p2_a1610_robot(), do_mount_p1_a1610_human(), do_screw_p2_a1610_human(), do_screw_p1_a1610_human(), do_mount_p1_a1610_robot(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_unscrew_p1_a1610_human();
			do_unscrew_p2_a1610_human();
			do_unmount_p1_a1610_robot();
			do_unscrew_p1_a1610_robot();
			do_unscrew_p2_a1610_robot();
			do_unmount_p1_a1610_human();
			do_screw_p1_a1610_robot();
			do_screw_p2_a1610_robot();
			do_mount_p1_a1610_human();
			do_screw_p2_a1610_human();
			do_screw_p1_a1610_human();
			do_mount_p1_a1610_robot();
		}

		VALUE do_unscrew_p1_a1610_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unscrew_p2_a1610_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p1_a1610_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unscrew_p1_a1610_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unscrew_p2_a1610_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p1_a1610_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_screw_p1_a1610_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_screw_p2_a1610_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_mount_p1_a1610_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_screw_p2_a1610_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_screw_p1_a1610_human() [1, + INF]
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
	COMPONENT ProductionG1L0 {FLEXIBLE tasks_g1_l0(functional)} : ProductionHierarchyG1L0Type;
	COMPONENT ProductionG1L1 {FLEXIBLE tasks_g1_l1(functional)} : ProductionHierarchyG1L1Type;
	COMPONENT ProductionG1L2 {FLEXIBLE tasks_g1_l2(functional)} : ProductionHierarchyG1L2Type;
	COMPONENT ProductionG1L3 {FLEXIBLE tasks_g1_l3(functional)} : ProductionHierarchyG1L3Type;
	COMPONENT ProductionG2L0 {FLEXIBLE tasks_g2_l0(functional)} : ProductionHierarchyG2L0Type;
	COMPONENT ProductionG2L1 {FLEXIBLE tasks_g2_l1(functional)} : ProductionHierarchyG2L1Type;
	COMPONENT ProductionG2L2 {FLEXIBLE tasks_g2_l2(functional)} : ProductionHierarchyG2L2Type;
	COMPONENT ProductionG2L3 {FLEXIBLE tasks_g2_l3(functional)} : ProductionHierarchyG2L3Type;

	SYNCHRONIZE ProductionG2L0.tasks_g2_l0 {

		 VALUE do_process_a1610() {

			d0 ProductionG2L1.tasks_g2_l1.do_process_p2_a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_process_a1610() {

			d0 ProductionG2L1.tasks_g2_l1.do_process_p1p2_a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_process_a1610() {

			d0 ProductionG2L1.tasks_g2_l1.do_process_p1_a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionG2L3.tasks_g2_l3 {

		VALUE do_unscrew_p1_a1610_human() {

			d0 Worker.operations._unscrew-p1-a1610-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unscrew_p1_a1610_human() {

			d0 Worker.operations._unscrew-p1-a1610-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unscrew_p2_a1610_human() {

			d0 Worker.operations._unscrew-p2-a1610-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unmount_p1_a1610_robot() {

			d0 Cobot.tasks._unmount-p1-a1610-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unmount_p1_a1610_robot() {

			d0 Cobot.tasks._unmount-p1-a1610-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unscrew_p1_a1610_robot() {

			d0 Cobot.tasks._unscrew-p1-a1610-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unscrew_p1_a1610_robot() {

			d0 Cobot.tasks._unscrew-p1-a1610-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unscrew_p2_a1610_robot() {

			d0 Cobot.tasks._unscrew-p2-a1610-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unmount_p1_a1610_human() {

			d0 Worker.operations._unmount-p2-a1610-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unmount_p1_a1610_human() {

			d0 Worker.operations._unmount-p2-a1610-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_screw_p1_a1610_robot() {

			d0 Cobot.tasks._screw-p1-a1610-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_screw_p2_a1610_robot() {

			d0 Cobot.tasks._screw-p2-a1610-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_screw_p2_a1610_robot() {

			d0 Cobot.tasks._screw-p2-a1610-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_mount_p1_a1610_human() {

			d0 Worker.operations._mount-p1-a1610-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_screw_p2_a1610_human() {

			d0 Worker.operations._screw-p2-a1610-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_screw_p2_a1610_human() {

			d0 Worker.operations._screw-p2-a1610-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_screw_p1_a1610_human() {

			d0 Worker.operations._screw-p1-a1610-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_mount_p1_a1610_robot() {

			d0 Cobot.tasks._mount-p1-a1610-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p1.p1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

	}

	SYNCHRONIZE ProductionG2L1.tasks_g2_l1 {

		 VALUE do_process_p2_a1610() {

			d0 ProductionG2L2.tasks_g2_l2.do_place_p2_a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG2L2.tasks_g2_l2.do_unscrew_p2_a1610();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG2L2.tasks_g2_l2.do_finish_p2_a1610();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionG2L2.tasks_g2_l2.do_screw_p2_a1610();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionG2L2.tasks_g2_l2.do_mount_p2_a1610();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionG2L2.tasks_g2_l2.do_unmount_p2_a1610();
			CONTAINS [0, +INF] [0, +INF] d5;
			d3 BEFORE [0, +INF] d4;
			d4 BEFORE [0, +INF] d2;
			d1 BEFORE [0, +INF] d5;
			d5 BEFORE [0, +INF] d3;
			d0 BEFORE [0, +INF] d1;
		}

		 VALUE do_process_p1_a1610() {

			d0 ProductionG2L2.tasks_g2_l2.do_finish_p1_a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG2L2.tasks_g2_l2.do_screw_p1_a1610();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG2L2.tasks_g2_l2.do_place_p1_a1610();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionG2L2.tasks_g2_l2.do_mount_p1_a1610();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionG2L2.tasks_g2_l2.do_unscrew_p1_a1610();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionG2L2.tasks_g2_l2.do_unmount_p1_a1610();
			CONTAINS [0, +INF] [0, +INF] d5;
			d3 BEFORE [0, +INF] d0;
			d5 BEFORE [0, +INF] d1;
			d1 BEFORE [0, +INF] d3;
			d2 BEFORE [0, +INF] d4;
			d4 BEFORE [0, +INF] d5;
		}

		 VALUE do_process_p1p2_a1610() {

			d0 ProductionG2L2.tasks_g2_l2.do_finish_p2_a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG2L2.tasks_g2_l2.do_place_p1p2_a1610();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG2L2.tasks_g2_l2.do_screw_p2_a1610();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionG2L2.tasks_g2_l2.do_mount_p2_a1610();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionG2L2.tasks_g2_l2.do_place_p1_a1610();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionG2L2.tasks_g2_l2.do_unscrew_p1_a1610();
			CONTAINS [0, +INF] [0, +INF] d5;
			d6 ProductionG2L2.tasks_g2_l2.do_unmount_p1_a1610();
			CONTAINS [0, +INF] [0, +INF] d6;
			d1 BEFORE [0, +INF] d2;
			d2 BEFORE [0, +INF] d3;
			d5 BEFORE [0, +INF] d6;
			d6 BEFORE [0, +INF] d1;
			d4 BEFORE [0, +INF] d5;
			d3 BEFORE [0, +INF] d0;
		}

	}

	SYNCHRONIZE Goal.goals {

		VALUE goal_a1610() {

			d0 ProductionG2L0.tasks_g2_l0.do_process_a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionG2L2.tasks_g2_l2 {

		 VALUE do_unscrew_p2_a1610() {

			d0 ProductionG2L3.tasks_g2_l3.do_unscrew_p2_a1610_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unscrew_p2_a1610() {

			d0 ProductionG2L3.tasks_g2_l3.do_unscrew_p2_a1610_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_screw_p2_a1610() {

			d0 ProductionG2L3.tasks_g2_l3.do_screw_p2_a1610_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_screw_p2_a1610() {

			d0 ProductionG2L3.tasks_g2_l3.do_screw_p2_a1610_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_screw_p2_a1610() {

			d0 ProductionG2L3.tasks_g2_l3.do_screw_p2_a1610_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_screw_p2_a1610() {

			d0 ProductionG2L3.tasks_g2_l3.do_screw_p2_a1610_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_screw_p1_a1610() {

			d0 ProductionG2L3.tasks_g2_l3.do_screw_p1_a1610_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_screw_p1_a1610() {

			d0 ProductionG2L3.tasks_g2_l3.do_screw_p1_a1610_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unscrew_p1_a1610() {

			d0 ProductionG2L3.tasks_g2_l3.do_unscrew_p1_a1610_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unscrew_p1_a1610() {

			d0 ProductionG2L3.tasks_g2_l3.do_unscrew_p1_a1610_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unscrew_p1_a1610() {

			d0 ProductionG2L3.tasks_g2_l3.do_unscrew_p1_a1610_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unscrew_p1_a1610() {

			d0 ProductionG2L3.tasks_g2_l3.do_unscrew_p1_a1610_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_place_p2_a1610() {

			d0 Worker.operations._pickplace-p0-p2-a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
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
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_mount_p2_a1610() {

			d0 Worker.operations._mount-p2-a1610();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
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

		 VALUE do_mount_p1_a1610() {

			d0 ProductionG2L3.tasks_g2_l3.do_mount_p1_a1610_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_mount_p1_a1610() {

			d0 ProductionG2L3.tasks_g2_l3.do_mount_p1_a1610_human();
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
			d1 p2.p2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		 VALUE do_unmount_p1_a1610() {

			d0 ProductionG2L3.tasks_g2_l3.do_unmount_p1_a1610_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unmount_p1_a1610() {

			d0 ProductionG2L3.tasks_g2_l3.do_unmount_p1_a1610_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unmount_p1_a1610() {

			d0 ProductionG2L3.tasks_g2_l3.do_unmount_p1_a1610_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unmount_p1_a1610() {

			d0 ProductionG2L3.tasks_g2_l3.do_unmount_p1_a1610_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}


}

