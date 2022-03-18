DOMAIN KNOWLEDGE_PRODUCTION_AUTHORING_GEN {

	TEMPORAL_MODULE temporal_module = [0, 1000], 100;

	COMP_TYPE SingletonStateVariable Position3Type (Free(), Busy()) {
		VALUE Free() [1, +INF]
		MEETS {
			Busy();
		}

		VALUE Busy() [1, +INF]
		MEETS {
			Free();
		}

	}

	COMP_TYPE SingletonStateVariable Position2Type (Free(), Busy()) {
		VALUE Free() [1, +INF]
		MEETS {
			Busy();
		}

		VALUE Busy() [1, +INF]
		MEETS {
			Free();
		}

	}

	COMP_TYPE SingletonStateVariable Position1Type (Free(), Busy()) {
		VALUE Free() [1, +INF]
		MEETS {
			Busy();
		}

		VALUE Busy() [1, +INF]
		MEETS {
			Free();
		}

	}

	COMP_TYPE SingletonStateVariable Position0Type (Free(), Busy()) {
		VALUE Free() [1, +INF]
		MEETS {
			Busy();
		}

		VALUE Busy() [1, +INF]
		MEETS {
			Free();
		}

	}

	COMP_TYPE SingletonStateVariable GoalVariableType(goal_1122(), goal_1121(), goal_0218(), goal_cembre(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			goal_1122();
			goal_1121();
			goal_0218();
			goal_cembre();
		}

		VALUE goal_1122() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE goal_1121() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE goal_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE goal_cembre() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable WorkerVariableType(_pickplace-p0-p2-0218(), _mount-p2-human(), _pickplace-p2-p3-human(), _pickplace-p2-rbox-human(), _pickplace-p1-p3-0218(), _pickplace-pbox-p2-0218(), _pickplace-pbox-p1-0218(), _unmount-p1-0218(), _pickplace-p1-p3-1121(), _pickplace-p0-p1-1121(), _unmount-p1-1121(), _pickplace-p0-p1-1121(), _unmount-p2-0218(), _pickplace-p2-rbox-0218(), _mount-p1-0218(), _pickplace-pbox-p2-1121(), _pickplace-p0-p2-human(), _pickplace-p0-p1-0218(), _pickplace-p1-p3-human(), _pickplace-p2-p3-1121(), _pickplace-p1-rbox-human(), _pickplace-p2-rbox-1121(), _pickplace-p2-p3-0218(), _pickplace-p1-rbox-0218(), _unmount-p2-1121(), _mount-p2-1121(), _unmount-p2-human(), _mount-p1-human(), _mount-p2-0218(), _pickplace-p0-p1(), _mount-p1-1121(), _pickplace-p1-rbox-1121(), _pickplace-pbox-p2(), _pickplace-pbox-p1-1121(), _unmount-p1-human(), _pickplace-pbox-p1-human(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			_pickplace-p0-p2-0218();
			_mount-p2-human();
			_pickplace-p2-p3-human();
			_pickplace-p2-rbox-human();
			_pickplace-p1-p3-0218();
			_pickplace-pbox-p2-0218();
			_pickplace-pbox-p1-0218();
			_unmount-p1-0218();
			_pickplace-p1-p3-1121();
			_pickplace-p0-p1-1121();
			_unmount-p1-1121();
			_pickplace-p0-p1-1121();
			_unmount-p2-0218();
			_pickplace-p2-rbox-0218();
			_mount-p1-0218();
			_pickplace-pbox-p2-1121();
			_pickplace-p0-p2-human();
			_pickplace-p0-p1-0218();
			_pickplace-p1-p3-human();
			_pickplace-p2-p3-1121();
			_pickplace-p1-rbox-human();
			_pickplace-p2-rbox-1121();
			_pickplace-p2-p3-0218();
			_pickplace-p1-rbox-0218();
			_unmount-p2-1121();
			_mount-p2-1121();
			_unmount-p2-human();
			_mount-p1-human();
			_mount-p2-0218();
			_pickplace-p0-p1();
			_mount-p1-1121();
			_pickplace-p1-rbox-1121();
			_pickplace-pbox-p2();
			_pickplace-pbox-p1-1121();
			_unmount-p1-human();
			_pickplace-pbox-p1-human();
		}

		VALUE _pickplace-p0-p2-0218() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _mount-p2-human() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p2-p3-human() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p2-rbox-human() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p1-p3-0218() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-pbox-p2-0218() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-pbox-p1-0218() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _unmount-p1-0218() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p1-p3-1121() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p0-p1-1121() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _unmount-p1-1121() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p0-p1-1121() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _unmount-p2-0218() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p2-rbox-0218() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _mount-p1-0218() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-pbox-p2-1121() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p0-p2-human() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p0-p1-0218() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p1-p3-human() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p2-p3-1121() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p1-rbox-human() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p2-rbox-1121() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p2-p3-0218() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p1-rbox-0218() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _unmount-p2-1121() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _mount-p2-1121() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _unmount-p2-human() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _mount-p1-human() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _mount-p2-0218() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p0-p1() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _mount-p1-1121() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p1-rbox-1121() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-pbox-p2() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-pbox-p1-1121() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _unmount-p1-human() [1, 10]
		MEETS {
			Idle();
		}

		VALUE _pickplace-pbox-p1-human() [1, 35]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable CobotVariableType(_unmount-p1-robot(), _pickplace-pbox-p1-robot(), _pickplace-p1-rbox-robot(), _monut-p1-robot(), _pickplace-p2-rbox-robot(), _pickplace-pbox-p2-robot(), _mount-p2-robot(), _unmount-p2-robot(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			_unmount-p1-robot();
			_pickplace-pbox-p1-robot();
			_pickplace-p1-rbox-robot();
			_monut-p1-robot();
			_pickplace-p2-rbox-robot();
			_pickplace-pbox-p2-robot();
			_mount-p2-robot();
			_unmount-p2-robot();
		}

		VALUE _unmount-p1-robot() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-pbox-p1-robot() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p1-rbox-robot() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _monut-p1-robot() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p2-rbox-robot() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _pickplace-pbox-p2-robot() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _mount-p2-robot() [1, 35]
		MEETS {
			Idle();
		}

		VALUE _unmount-p2-robot() [1, 35]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG0L0Type(do_process(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_process();
		}

		VALUE do_process() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG0L1Type(do_process_p3(), do_process_p2(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_process_p3();
			do_process_p2();
		}

		VALUE do_process_p3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_process_p2() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG0L2Type(do_assembly_p3(), do_disassembly_p2(), do_assembly_p2(), do_disassembly_p3(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_assembly_p3();
			do_disassembly_p2();
			do_assembly_p2();
			do_disassembly_p3();
		}

		VALUE do_assembly_p3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_disassembly_p2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_assembly_p2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_disassembly_p3() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG0L3Type(do_mount_p3_robot(), do_place_p2(), do_release_p3_robot(), do_finish_p3(), do_pick_p3(), do_unmount_p2_robot(), do_pick_p2_robot(), do_unmount_p3(), do_mount_p2(), do_place_p3(), do_finish_p2(), do_release_p2(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_mount_p3_robot();
			do_place_p2();
			do_release_p3_robot();
			do_finish_p3();
			do_pick_p3();
			do_unmount_p2_robot();
			do_pick_p2_robot();
			do_unmount_p3();
			do_mount_p2();
			do_place_p3();
			do_finish_p2();
			do_release_p2();
		}

		VALUE do_mount_p3_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_place_p2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_release_p3_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_finish_p3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_pick_p3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p2_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_pick_p2_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_mount_p2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_place_p3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_finish_p2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_release_p2() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG0L4Type(do_mount_p2_robot(), do_unmount_p3_robot(), do_release_p2_robot(), do_release_p2_human(), do_pick_p3_robot(), do_mount_p2_human(), do_pick_p3_human(), do_unmount_p3_human(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_mount_p2_robot();
			do_unmount_p3_robot();
			do_release_p2_robot();
			do_release_p2_human();
			do_pick_p3_robot();
			do_mount_p2_human();
			do_pick_p3_human();
			do_unmount_p3_human();
		}

		VALUE do_mount_p2_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p3_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_release_p2_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_release_p2_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_pick_p3_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_mount_p2_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_pick_p3_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p3_human() [1, + INF]
		MEETS {
			Idle();
		}

	}


	COMPONENT Position3 {FLEXIBLE position3_state(primitive)} : Position3Type;
	COMPONENT Position2 {FLEXIBLE position2_state(primitive)} : Position2Type;
	COMPONENT Position1 {FLEXIBLE position1_state(primitive)} : Position1Type;
	COMPONENT Position0 {FLEXIBLE position0_state(primitive)} : Position0Type;
	COMPONENT Goal {FLEXIBLE goals(functional)} : GoalVariableType;
	COMPONENT Worker {FLEXIBLE operations(primitive)} :  WorkerVariableType;
	COMPONENT Cobot {FLEXIBLE tasks(primitive)} : CobotVariableType;
	COMPONENT ProductionG0L0 {FLEXIBLE tasks_g0_l0(functional)} : ProductionHierarchyG0L0Type;
	COMPONENT ProductionG0L1 {FLEXIBLE tasks_g0_l1(functional)} : ProductionHierarchyG0L1Type;
	COMPONENT ProductionG0L2 {FLEXIBLE tasks_g0_l2(functional)} : ProductionHierarchyG0L2Type;
	COMPONENT ProductionG0L3 {FLEXIBLE tasks_g0_l3(functional)} : ProductionHierarchyG0L3Type;
	COMPONENT ProductionG0L4 {FLEXIBLE tasks_g0_l4(functional)} : ProductionHierarchyG0L4Type;

	SYNCHRONIZE ProductionG0L4.tasks_g0_l4 {

		VALUE do_mount_p2_robot() {

			d0 Cobot.tasks._monut-p1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_unmount_p3_robot() {

			d0 Cobot.tasks._unmount-p2-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_release_p2_robot() {

			d0 Cobot.tasks._pickplace-p1-rbox-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_release_p2_human() {

			d0 Worker.operations._pickplace-p1-rbox-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_pick_p3_robot() {

			d0 Cobot.tasks._pickplace-pbox-p2-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position2.position2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_mount_p2_human() {

			d0 Worker.operations._mount-p1-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_pick_p3_human() {

			d0 Worker.operations._pickplace-pbox-p2();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position2.position2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unmount_p3_human() {

			d0 Worker.operations._unmount-p2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionG0L3.tasks_g0_l3 {

		VALUE do_mount_p3_robot() {

			d0 Cobot.tasks._mount-p2-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_place_p2() {

			d0 Worker.operations._pickplace-p0-p1();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position1.position1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_release_p3_robot() {

			d0 Cobot.tasks._pickplace-p2-rbox-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_finish_p3() {

			d0 Worker.operations._pickplace-p2-p3-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position3.position3_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		 VALUE do_pick_p3() {

			d0 ProductionG0L4.tasks_g0_l4.do_pick_p3_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_pick_p3() {

			d0 ProductionG0L4.tasks_g0_l4.do_pick_p3_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_unmount_p2_robot() {

			d0 Cobot.tasks._unmount-p1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unmount_p3() {

			d0 ProductionG0L4.tasks_g0_l4.do_unmount_p3_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unmount_p3() {

			d0 ProductionG0L4.tasks_g0_l4.do_unmount_p3_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_pick_p2_robot() {

			d0 Cobot.tasks._pickplace-pbox-p1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position1.position1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_place_p3() {

			d0 Worker.operations._pickplace-p0-p2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position2.position2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		 VALUE do_mount_p2() {

			d0 ProductionG0L4.tasks_g0_l4.do_mount_p2_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_mount_p2() {

			d0 ProductionG0L4.tasks_g0_l4.do_mount_p2_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_finish_p2() {

			d0 Worker.operations._pickplace-p1-p3-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position3.position3_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		 VALUE do_release_p2() {

			d0 ProductionG0L4.tasks_g0_l4.do_release_p2_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_release_p2() {

			d0 ProductionG0L4.tasks_g0_l4.do_release_p2_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionG0L1.tasks_g0_l1 {

		 VALUE do_process_p3() {

			d0 ProductionG0L2.tasks_g0_l2.do_assembly_p3();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG0L2.tasks_g0_l2.do_disassembly_p3();
			CONTAINS [0, +INF] [0, +INF] d1;
			d1 BEFORE [0, +INF] d0;
		}

		 VALUE do_process_p2() {

			d0 ProductionG0L2.tasks_g0_l2.do_assembly_p2();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG0L2.tasks_g0_l2.do_disassembly_p2();
			CONTAINS [0, +INF] [0, +INF] d1;
			d1 BEFORE [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionG0L2.tasks_g0_l2 {

		 VALUE do_assembly_p3() {

			d0 ProductionG0L3.tasks_g0_l3.do_finish_p3();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG0L3.tasks_g0_l3.do_mount_p3_robot();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG0L3.tasks_g0_l3.do_pick_p3();
			CONTAINS [0, +INF] [0, +INF] d2;
			d2 BEFORE [0, +INF] d1;
			d1 BEFORE [0, +INF] d0;
		}

		 VALUE do_disassembly_p2() {

			d0 ProductionG0L3.tasks_g0_l3.do_place_p2();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG0L3.tasks_g0_l3.do_unmount_p2_robot();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG0L3.tasks_g0_l3.do_release_p2();
			CONTAINS [0, +INF] [0, +INF] d2;
			d0 BEFORE [0, +INF] d1;
			d1 BEFORE [0, +INF] d2;
		}

		 VALUE do_assembly_p2() {

			d0 ProductionG0L3.tasks_g0_l3.do_pick_p2_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG0L3.tasks_g0_l3.do_finish_p2();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG0L3.tasks_g0_l3.do_mount_p2();
			CONTAINS [0, +INF] [0, +INF] d2;
			d0 BEFORE [0, +INF] d2;
			d2 BEFORE [0, +INF] d1;
		}

		 VALUE do_disassembly_p3() {

			d0 ProductionG0L3.tasks_g0_l3.do_unmount_p3();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG0L3.tasks_g0_l3.do_place_p3();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG0L3.tasks_g0_l3.do_release_p3_robot();
			CONTAINS [0, +INF] [0, +INF] d2;
			d1 BEFORE [0, +INF] d0;
			d0 BEFORE [0, +INF] d2;
		}

	}

	SYNCHRONIZE ProductionG0L0.tasks_g0_l0 {

		 VALUE do_process() {

			d0 ProductionG0L1.tasks_g0_l1.do_process_p3();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_process() {

			d0 ProductionG0L1.tasks_g0_l1.do_process_p2();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE Goal.goals {

		VALUE goal_1122() {

			d0 ProductionG0L0.tasks_g0_l0.do_process();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG1L0Type(do_process_1121(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_process_1121();
		}

		VALUE do_process_1121() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG1L1Type(do_process_p2_1121(), do_process_p3_1121(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_process_p2_1121();
			do_process_p3_1121();
		}

		VALUE do_process_p2_1121() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_process_p3_1121() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG1L2Type(do_assembly_p3_1121(), do_assembly_p2_1121(), do_disassembly_p2_1121(), do_disassembly_p3_1121(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_assembly_p3_1121();
			do_assembly_p2_1121();
			do_disassembly_p2_1121();
			do_disassembly_p3_1121();
		}

		VALUE do_assembly_p3_1121() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_assembly_p2_1121() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_disassembly_p2_1121() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_disassembly_p3_1121() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG1L3Type(do_release_p3_1121(), do_unmount_p3_1121(), do_place_p2_1121(), do_mount_p3_1121(), do_pick_p3_1121(), do_place_p3_1121(), do_mount_p2_1121(), do_finish_p3_1121(), do_pick_p2_1121(), do_release_p2_1121(), do_finish_p2_1121(), do_unmount_p2_1121(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_release_p3_1121();
			do_unmount_p3_1121();
			do_place_p2_1121();
			do_mount_p3_1121();
			do_pick_p3_1121();
			do_place_p3_1121();
			do_mount_p2_1121();
			do_finish_p3_1121();
			do_pick_p2_1121();
			do_release_p2_1121();
			do_finish_p2_1121();
			do_unmount_p2_1121();
		}

		VALUE do_release_p3_1121() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p3_1121() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_place_p2_1121() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_mount_p3_1121() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_pick_p3_1121() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_place_p3_1121() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_mount_p2_1121() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_finish_p3_1121() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_pick_p2_1121() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_release_p2_1121() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_finish_p2_1121() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p2_1121() [1, + INF]
		MEETS {
			Idle();
		}

	}


	COMPONENT Position3 {FLEXIBLE position3_state(primitive)} : Position3Type;
	COMPONENT Position2 {FLEXIBLE position2_state(primitive)} : Position2Type;
	COMPONENT Position1 {FLEXIBLE position1_state(primitive)} : Position1Type;
	COMPONENT Position0 {FLEXIBLE position0_state(primitive)} : Position0Type;
	COMPONENT Goal {FLEXIBLE goals(functional)} : GoalVariableType;
	COMPONENT Worker {FLEXIBLE operations(primitive)} :  WorkerVariableType;
	COMPONENT Cobot {FLEXIBLE tasks(primitive)} : CobotVariableType;
	COMPONENT ProductionG0L0 {FLEXIBLE tasks_g0_l0(functional)} : ProductionHierarchyG0L0Type;
	COMPONENT ProductionG0L1 {FLEXIBLE tasks_g0_l1(functional)} : ProductionHierarchyG0L1Type;
	COMPONENT ProductionG0L2 {FLEXIBLE tasks_g0_l2(functional)} : ProductionHierarchyG0L2Type;
	COMPONENT ProductionG0L3 {FLEXIBLE tasks_g0_l3(functional)} : ProductionHierarchyG0L3Type;
	COMPONENT ProductionG0L4 {FLEXIBLE tasks_g0_l4(functional)} : ProductionHierarchyG0L4Type;
	COMPONENT ProductionG1L0 {FLEXIBLE tasks_g1_l0(functional)} : ProductionHierarchyG1L0Type;
	COMPONENT ProductionG1L1 {FLEXIBLE tasks_g1_l1(functional)} : ProductionHierarchyG1L1Type;
	COMPONENT ProductionG1L2 {FLEXIBLE tasks_g1_l2(functional)} : ProductionHierarchyG1L2Type;
	COMPONENT ProductionG1L3 {FLEXIBLE tasks_g1_l3(functional)} : ProductionHierarchyG1L3Type;

	SYNCHRONIZE ProductionG1L3.tasks_g1_l3 {

		VALUE do_release_p3_1121() {

			d0 Worker.operations._pickplace-p2-rbox-1121();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_place_p2_1121() {

			d0 Worker.operations._pickplace-p0-p1-1121();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position1.position1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_mount_p3_1121() {

			d0 Worker.operations._mount-p2-1121();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_pick_p3_1121() {

			d0 Worker.operations._pickplace-pbox-p2-1121();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position2.position2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_mount_p2_1121() {

			d0 Worker.operations._mount-p1-1121();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_finish_p3_1121() {

			d0 Worker.operations._pickplace-p2-p3-1121();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position3.position3_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_release_p2_1121() {

			d0 Worker.operations._pickplace-p1-rbox-1121();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_unmount_p3_1121() {

			d0 Worker.operations._unmount-p2-1121();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_place_p3_1121() {

			d0 Worker.operations._pickplace-p0-p1-1121();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position2.position2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_pick_p2_1121() {

			d0 Worker.operations._pickplace-pbox-p1-1121();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position1.position1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unmount_p2_1121() {

			d0 Worker.operations._unmount-p1-1121();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_finish_p2_1121() {

			d0 Worker.operations._pickplace-p1-p3-1121();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position3.position3_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

	}

	SYNCHRONIZE ProductionG1L0.tasks_g1_l0 {

		 VALUE do_process_1121() {

			d0 ProductionG1L1.tasks_g1_l1.do_process_p3_1121();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_process_1121() {

			d0 ProductionG1L1.tasks_g1_l1.do_process_p2_1121();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionG1L2.tasks_g1_l2 {

		 VALUE do_assembly_p3_1121() {

			d0 ProductionG1L3.tasks_g1_l3.do_finish_p3_1121();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG1L3.tasks_g1_l3.do_mount_p3_1121();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG1L3.tasks_g1_l3.do_pick_p3_1121();
			CONTAINS [0, +INF] [0, +INF] d2;
			d1 BEFORE [0, +INF] d0;
			d2 BEFORE [0, +INF] d1;
		}

		 VALUE do_disassembly_p3_1121() {

			d0 ProductionG1L3.tasks_g1_l3.do_release_p3_1121();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG1L3.tasks_g1_l3.do_place_p3_1121();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG1L3.tasks_g1_l3.do_unmount_p3_1121();
			CONTAINS [0, +INF] [0, +INF] d2;
			d1 BEFORE [0, +INF] d2;
			d2 BEFORE [0, +INF] d0;
		}

		 VALUE do_assembly_p2_1121() {

			d0 ProductionG1L3.tasks_g1_l3.do_mount_p2_1121();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG1L3.tasks_g1_l3.do_pick_p2_1121();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG1L3.tasks_g1_l3.do_finish_p2_1121();
			CONTAINS [0, +INF] [0, +INF] d2;
			d1 BEFORE [0, +INF] d0;
			d0 BEFORE [0, +INF] d2;
		}

		 VALUE do_disassembly_p2_1121() {

			d0 ProductionG1L3.tasks_g1_l3.do_place_p2_1121();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG1L3.tasks_g1_l3.do_release_p2_1121();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG1L3.tasks_g1_l3.do_unmount_p2_1121();
			CONTAINS [0, +INF] [0, +INF] d2;
			d0 BEFORE [0, +INF] d2;
			d2 BEFORE [0, +INF] d1;
		}

	}

	SYNCHRONIZE Goal.goals {

		VALUE goal_1121() {

			d0 ProductionG1L0.tasks_g1_l0.do_process_1121();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionG1L1.tasks_g1_l1 {

		 VALUE do_process_p2_1121() {

			d0 ProductionG1L2.tasks_g1_l2.do_disassembly_p2_1121();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG1L2.tasks_g1_l2.do_assembly_p2_1121();
			CONTAINS [0, +INF] [0, +INF] d1;
			d0 BEFORE [0, +INF] d1;
		}

		 VALUE do_process_p3_1121() {

			d0 ProductionG1L2.tasks_g1_l2.do_assembly_p3_1121();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG1L2.tasks_g1_l2.do_disassembly_p3_1121();
			CONTAINS [0, +INF] [0, +INF] d1;
			d1 BEFORE [0, +INF] d0;
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG2L0Type(do_process_0218(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_process_0218();
		}

		VALUE do_process_0218() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG2L1Type(do_process_p2_0218(), do_process_p3_0218(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_process_p2_0218();
			do_process_p3_0218();
		}

		VALUE do_process_p2_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_process_p3_0218() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG2L2Type(do_assembly_p2_0218(), do_disassembly_p3_0218(), do_assembly_p3_0218(), do_disassembly_p2_0218(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_assembly_p2_0218();
			do_disassembly_p3_0218();
			do_assembly_p3_0218();
			do_disassembly_p2_0218();
		}

		VALUE do_assembly_p2_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_disassembly_p3_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_assembly_p3_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_disassembly_p2_0218() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG2L3Type(do_release_p3_0218(), do_finish_p2_0218(), do_finish_p3_0218(), do_pick_p2_0218(), do_place_p2_0218(), do_mount_p2_0218(), do_unmount_p3_0218(), do_mount_p3_0218(), do_unmount_p2_0218(), do_pick_p3_0218(), do_place_p3_0218(), do_release_p2_0218(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_release_p3_0218();
			do_finish_p2_0218();
			do_finish_p3_0218();
			do_pick_p2_0218();
			do_place_p2_0218();
			do_mount_p2_0218();
			do_unmount_p3_0218();
			do_mount_p3_0218();
			do_unmount_p2_0218();
			do_pick_p3_0218();
			do_place_p3_0218();
			do_release_p2_0218();
		}

		VALUE do_release_p3_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_finish_p2_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_finish_p3_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_pick_p2_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_place_p2_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_mount_p2_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p3_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_mount_p3_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p2_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_pick_p3_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_place_p3_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_release_p2_0218() [1, + INF]
		MEETS {
			Idle();
		}

	}


	COMPONENT Position3 {FLEXIBLE position3_state(primitive)} : Position3Type;
	COMPONENT Position2 {FLEXIBLE position2_state(primitive)} : Position2Type;
	COMPONENT Position1 {FLEXIBLE position1_state(primitive)} : Position1Type;
	COMPONENT Position0 {FLEXIBLE position0_state(primitive)} : Position0Type;
	COMPONENT Goal {FLEXIBLE goals(functional)} : GoalVariableType;
	COMPONENT Worker {FLEXIBLE operations(primitive)} :  WorkerVariableType;
	COMPONENT Cobot {FLEXIBLE tasks(primitive)} : CobotVariableType;
	COMPONENT ProductionG0L0 {FLEXIBLE tasks_g0_l0(functional)} : ProductionHierarchyG0L0Type;
	COMPONENT ProductionG0L1 {FLEXIBLE tasks_g0_l1(functional)} : ProductionHierarchyG0L1Type;
	COMPONENT ProductionG0L2 {FLEXIBLE tasks_g0_l2(functional)} : ProductionHierarchyG0L2Type;
	COMPONENT ProductionG0L3 {FLEXIBLE tasks_g0_l3(functional)} : ProductionHierarchyG0L3Type;
	COMPONENT ProductionG0L4 {FLEXIBLE tasks_g0_l4(functional)} : ProductionHierarchyG0L4Type;
	COMPONENT ProductionG1L0 {FLEXIBLE tasks_g1_l0(functional)} : ProductionHierarchyG1L0Type;
	COMPONENT ProductionG1L1 {FLEXIBLE tasks_g1_l1(functional)} : ProductionHierarchyG1L1Type;
	COMPONENT ProductionG1L2 {FLEXIBLE tasks_g1_l2(functional)} : ProductionHierarchyG1L2Type;
	COMPONENT ProductionG1L3 {FLEXIBLE tasks_g1_l3(functional)} : ProductionHierarchyG1L3Type;
	COMPONENT ProductionG2L0 {FLEXIBLE tasks_g2_l0(functional)} : ProductionHierarchyG2L0Type;
	COMPONENT ProductionG2L1 {FLEXIBLE tasks_g2_l1(functional)} : ProductionHierarchyG2L1Type;
	COMPONENT ProductionG2L2 {FLEXIBLE tasks_g2_l2(functional)} : ProductionHierarchyG2L2Type;
	COMPONENT ProductionG2L3 {FLEXIBLE tasks_g2_l3(functional)} : ProductionHierarchyG2L3Type;

	SYNCHRONIZE ProductionG2L0.tasks_g2_l0 {

		 VALUE do_process_0218() {

			d0 ProductionG2L1.tasks_g2_l1.do_process_p3_0218();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_process_0218() {

			d0 ProductionG2L1.tasks_g2_l1.do_process_p2_0218();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionG2L3.tasks_g2_l3 {

		VALUE do_release_p3_0218() {

			d0 Worker.operations._pickplace-p2-rbox-0218();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_finish_p3_0218() {

			d0 Worker.operations._pickplace-p2-p3-0218();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position3.position3_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_pick_p2_0218() {

			d0 Worker.operations._pickplace-pbox-p1-0218();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position1.position1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_place_p2_0218() {

			d0 Worker.operations._pickplace-p0-p1-0218();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position1.position1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_mount_p2_0218() {

			d0 Worker.operations._mount-p1-0218();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_unmount_p2_0218() {

			d0 Worker.operations._unmount-p1-0218();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_pick_p3_0218() {

			d0 Worker.operations._pickplace-pbox-p2-0218();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position2.position2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_place_p3_0218() {

			d0 Worker.operations._pickplace-p0-p2-0218();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position2.position2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_finish_p2_0218() {

			d0 Worker.operations._pickplace-p1-p3-0218();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position3.position3_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unmount_p3_0218() {

			d0 Worker.operations._unmount-p2-0218();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_mount_p3_0218() {

			d0 Worker.operations._mount-p2-0218();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_release_p2_0218() {

			d0 Worker.operations._pickplace-p1-rbox-0218();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionG2L1.tasks_g2_l1 {

		 VALUE do_process_p3_0218() {

			d0 ProductionG2L2.tasks_g2_l2.do_disassembly_p3_0218();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG2L2.tasks_g2_l2.do_assembly_p3_0218();
			CONTAINS [0, +INF] [0, +INF] d1;
			d0 BEFORE [0, +INF] d1;
		}

		 VALUE do_process_p2_0218() {

			d0 ProductionG2L2.tasks_g2_l2.do_assembly_p2_0218();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG2L2.tasks_g2_l2.do_disassembly_p2_0218();
			CONTAINS [0, +INF] [0, +INF] d1;
			d1 BEFORE [0, +INF] d0;
		}

	}

	SYNCHRONIZE Goal.goals {

		VALUE goal_0218() {

			d0 ProductionG2L0.tasks_g2_l0.do_process_0218();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionG2L2.tasks_g2_l2 {

		 VALUE do_assembly_p3_0218() {

			d0 ProductionG2L3.tasks_g2_l3.do_mount_p3_0218();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG2L3.tasks_g2_l3.do_pick_p3_0218();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG2L3.tasks_g2_l3.do_finish_p3_0218();
			CONTAINS [0, +INF] [0, +INF] d2;
			d0 BEFORE [0, +INF] d2;
			d1 BEFORE [0, +INF] d0;
		}

		 VALUE do_disassembly_p2_0218() {

			d0 ProductionG2L3.tasks_g2_l3.do_unmount_p2_0218();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG2L3.tasks_g2_l3.do_release_p2_0218();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG2L3.tasks_g2_l3.do_place_p2_0218();
			CONTAINS [0, +INF] [0, +INF] d2;
			d2 BEFORE [0, +INF] d0;
			d0 BEFORE [0, +INF] d1;
		}

		 VALUE do_assembly_p2_0218() {

			d0 ProductionG2L3.tasks_g2_l3.do_finish_p2_0218();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG2L3.tasks_g2_l3.do_pick_p2_0218();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG2L3.tasks_g2_l3.do_mount_p2_0218();
			CONTAINS [0, +INF] [0, +INF] d2;
			d1 BEFORE [0, +INF] d2;
			d2 BEFORE [0, +INF] d0;
		}

		 VALUE do_disassembly_p3_0218() {

			d0 ProductionG2L3.tasks_g2_l3.do_release_p3_0218();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG2L3.tasks_g2_l3.do_place_p3_0218();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG2L3.tasks_g2_l3.do_unmount_p3_0218();
			CONTAINS [0, +INF] [0, +INF] d2;
			d2 BEFORE [0, +INF] d0;
			d1 BEFORE [0, +INF] d2;
		}

	}

	SYNCHRONIZE Goal.goals {

		VALUE goal_cembre() {

			d0 Goal.goals.goal_1122();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Goal.goals.goal_1121();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 Goal.goals.goal_0218();
			CONTAINS [0, +INF] [0, +INF] d2;
			d2 BEFORE [0, +INF] d1;
			d0 BEFORE [0, +INF] d2;
		}

	}


}

