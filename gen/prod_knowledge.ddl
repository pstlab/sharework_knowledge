DOMAIN KNOWLEDGE_PRODUCTION_AUTHORING_GEN {

	TEMPORAL_MODULE temporal_module = [0, 1000], 100;

	COMP_TYPE SingletonStateVariable GoalVariableType(mosaic-goal(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			mosaic-goal();
		}

		VALUE mosaic-goal() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable WorkerVariableType(_pickplace-d4-human(), _pickplace-e3-human(), _pickplace-f4-human(), _pickplace-e1-human(), _pickplace-h2-human(), _pickplace-i5-human(), _pickplace-b4-human(), _pickplace-h5-human(), _pickplace-i2-human(), _pickplace-g4-human(), _pickplace-e4-human(), _pickplace-h4-human(), _pickplace-j2-human(), _pickplace-j5-human(), _pickplace-a4-human(), _pickplace-f1-human(), _pickplace-b2-human(), _pickplace-d2-human(), _pickplace-i1-human(), _pickplace-h1-human(), _pickplace-d5-human(), _pickplace-g5-human(), _pickplace-j4-human(), _pickplace-i3-human(), _pickplace-f3-human(), _pickplace-i4-human(), _pickplace-e5-human(), _pickplace-c2-human(), _pickplace-g3-human(), _pickplace-f5-human(), _pickplace-d3-human(), _pickplace-e2-human(), _pickplace-d1-human(), _pickplace-g2-human(), _pickplace-f2-human(), _pickplace-h3-human(), _pickplace-j1-human(), _pickplace-g1-human(), _pickplace-j3-human(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			_pickplace-d4-human();
			_pickplace-e3-human();
			_pickplace-f4-human();
			_pickplace-e1-human();
			_pickplace-h2-human();
			_pickplace-i5-human();
			_pickplace-b4-human();
			_pickplace-h5-human();
			_pickplace-i2-human();
			_pickplace-g4-human();
			_pickplace-e4-human();
			_pickplace-h4-human();
			_pickplace-j2-human();
			_pickplace-j5-human();
			_pickplace-a4-human();
			_pickplace-f1-human();
			_pickplace-b2-human();
			_pickplace-d2-human();
			_pickplace-i1-human();
			_pickplace-h1-human();
			_pickplace-d5-human();
			_pickplace-g5-human();
			_pickplace-j4-human();
			_pickplace-i3-human();
			_pickplace-f3-human();
			_pickplace-i4-human();
			_pickplace-e5-human();
			_pickplace-c2-human();
			_pickplace-g3-human();
			_pickplace-f5-human();
			_pickplace-d3-human();
			_pickplace-e2-human();
			_pickplace-d1-human();
			_pickplace-g2-human();
			_pickplace-f2-human();
			_pickplace-h3-human();
			_pickplace-j1-human();
			_pickplace-g1-human();
			_pickplace-j3-human();
		}

		VALUE _pickplace-d4-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-e3-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-f4-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-e1-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-h2-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-i5-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-b4-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-h5-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-i2-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-g4-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-e4-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-h4-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-j2-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-j5-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-a4-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-f1-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-b2-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-d2-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-i1-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-h1-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-d5-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-g5-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-j4-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-i3-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-f3-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-i4-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-e5-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-c2-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-g3-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-f5-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-d3-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-e2-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-d1-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-g2-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-f2-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-h3-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-j1-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-g1-human() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-j3-human() [2, 4]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable CobotVariableType(_pickplace-a2-robot(), _pickplace-d2-robot(), _pickplace-j2-robot(), _pickplace-j3-robot(), _pickplace-f3-robot(), _pickplace-i5-robot(), _pickplace-c4-robot(), _pickplace-c3-robot(), _pickplace-e4-robot(), _pickplace-h2-robot(), _pickplace-h1-robot(), _pickplace-f2-robot(), _pickplace-b5-robot(), _pickplace-b1-robot(), _pickplace-g4-robot(), _pickplace-d1-robot(), _pickplace-j5-robot(), _pickplace-b3-robot(), _pickplace-b2-robot(), _pickplace-j4-robot(), _pickplace-a4-robot(), _pickplace-d5-robot(), _pickplace-a5-robot(), _pickplace-c2-robot(), _pickplace-i4-robot(), _pickplace-h3-robot(), _pickplace-a1-robot(), _pickplace-f1-robot(), _pickplace-g5-robot(), _pickplace-d3-robot(), _pickplace-c5-robot(), _pickplace-b4-robot(), _pickplace-j1-robot(), _pickplace-a3-robot(), _pickplace-g1-robot(), _pickplace-c1-robot(), _pickplace-e5-robot(), _pickplace-d4-robot(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			_pickplace-a2-robot();
			_pickplace-d2-robot();
			_pickplace-j2-robot();
			_pickplace-j3-robot();
			_pickplace-f3-robot();
			_pickplace-i5-robot();
			_pickplace-c4-robot();
			_pickplace-c3-robot();
			_pickplace-e4-robot();
			_pickplace-h2-robot();
			_pickplace-h1-robot();
			_pickplace-f2-robot();
			_pickplace-b5-robot();
			_pickplace-b1-robot();
			_pickplace-g4-robot();
			_pickplace-d1-robot();
			_pickplace-j5-robot();
			_pickplace-b3-robot();
			_pickplace-b2-robot();
			_pickplace-j4-robot();
			_pickplace-a4-robot();
			_pickplace-d5-robot();
			_pickplace-a5-robot();
			_pickplace-c2-robot();
			_pickplace-i4-robot();
			_pickplace-h3-robot();
			_pickplace-a1-robot();
			_pickplace-f1-robot();
			_pickplace-g5-robot();
			_pickplace-d3-robot();
			_pickplace-c5-robot();
			_pickplace-b4-robot();
			_pickplace-j1-robot();
			_pickplace-a3-robot();
			_pickplace-g1-robot();
			_pickplace-c1-robot();
			_pickplace-e5-robot();
			_pickplace-d4-robot();
		}

		VALUE _pickplace-a2-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-d2-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-j2-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-j3-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-f3-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-i5-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-c4-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-c3-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-e4-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-h2-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-h1-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-f2-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-b5-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-b1-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-g4-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-d1-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-j5-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-b3-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-b2-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-j4-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-a4-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-d5-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-a5-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-c2-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-i4-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-h3-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-a1-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-f1-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-g5-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-d3-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-c5-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-b4-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-j1-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-a3-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-g1-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-c1-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-e5-robot() [2, 4]
		MEETS {
			Idle();
		}

		VALUE _pickplace-d4-robot() [2, 4]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG0L0Type(doMosaic(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			doMosaic();
		}

		VALUE doMosaic() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG0L1Type(doRow2(), doRow3(), doRow1(), doRow4(), doRow5(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			doRow2();
			doRow3();
			doRow1();
			doRow4();
			doRow5();
		}

		VALUE doRow2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doRow3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doRow1() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doRow4() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doRow5() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG0L2Type(doCellA5(), doCellH3(), doCellG1(), doCellE5(), doCellD3(), doCellC1(), doCellI5(), doCellI4(), doCellH2(), doCellA4(), doCellE4(), doCellD2(), doCellJ5(), doCellI3(), doCellH1(), doCellB5(), doCellA3(), doCellF5(), doCellE3(), doCellD1(), doCellJ4(), doCellI2(), doCellB4(), doCellA2(), doCellF4(), doCellE2(), doCellJ3(), doCellI1(), doCellC5(), doCellB3(), doCellA1(), doCellG5(), doCellF3(), doCellE1(), doCellJ2(), doCellC4(), doCellB2(), doCellG4(), doCellF2(), doCellF1(), doCellJ1(), doCellD5(), doCellC3(), doCellB1(), doCellH5(), doCellG3(), doCellG2(), doCellD4(), doCellC2(), doCellH4(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			doCellA5();
			doCellH3();
			doCellG1();
			doCellE5();
			doCellD3();
			doCellC1();
			doCellI5();
			doCellI4();
			doCellH2();
			doCellA4();
			doCellE4();
			doCellD2();
			doCellJ5();
			doCellI3();
			doCellH1();
			doCellB5();
			doCellA3();
			doCellF5();
			doCellE3();
			doCellD1();
			doCellJ4();
			doCellI2();
			doCellB4();
			doCellA2();
			doCellF4();
			doCellE2();
			doCellJ3();
			doCellI1();
			doCellC5();
			doCellB3();
			doCellA1();
			doCellG5();
			doCellF3();
			doCellE1();
			doCellJ2();
			doCellC4();
			doCellB2();
			doCellG4();
			doCellF2();
			doCellF1();
			doCellJ1();
			doCellD5();
			doCellC3();
			doCellB1();
			doCellH5();
			doCellG3();
			doCellG2();
			doCellD4();
			doCellC2();
			doCellH4();
		}

		VALUE doCellA5() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellH3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellG1() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellE5() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellD3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellC1() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellI5() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellI4() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellH2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellA4() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellE4() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellD2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ5() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellI3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellH1() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellB5() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellA3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellF5() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellE3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellD1() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ4() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellI2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellB4() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellA2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellF4() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellE2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellI1() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellC5() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellB3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellA1() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellG5() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellF3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellE1() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellC4() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellB2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellG4() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellF2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellF1() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ1() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellD5() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellC3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellB1() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellH5() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellG3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellG2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellD4() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellC2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellH4() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG0L3Type(doCellH2human(), doCellJ2human(), doCellJ3robot(), doCellH3robot(), doCellD2human(), doCellF2human(), doCellC2human(), doCellI5human(), doCellJ5human(), doCellG5human(), doCellE5human(), doCellD3robot(), doCellF3robot(), doCellB4human(), doCellD4human(), doCellE5robot(), doCellG5robot(), doCellJ5robot(), doCellI5robot(), doCellI4human(), doCellE4human(), doCellD2robot(), doCellG1robot(), doCellH1robot(), docellH2robot(), doCellH3human(), doCellI4robot(), doCellD3human(), doCellG1human(), doCellA4human(), doCellA4robot(), doCellB4robot(), doCellE4robot(), doCellD4robot(), doCellG4robot(), doCellD1robot(), doCellJ4robot(), doCellH1human(), doCellF1human(), doCellJ1human(), doCellD1human(), doCellJ4human(), doCellB2robot(), doCellC2robot(), doCellF1robot(), doCellD5human(), doCellJ1robot(), doCellJ3human(), doCellF3human(), doCellB2human(), docellG4human(), doCellJ2robot(), doCellD5robot(), doCellF2robot(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			doCellH2human();
			doCellJ2human();
			doCellJ3robot();
			doCellH3robot();
			doCellD2human();
			doCellF2human();
			doCellC2human();
			doCellI5human();
			doCellJ5human();
			doCellG5human();
			doCellE5human();
			doCellD3robot();
			doCellF3robot();
			doCellB4human();
			doCellD4human();
			doCellE5robot();
			doCellG5robot();
			doCellJ5robot();
			doCellI5robot();
			doCellI4human();
			doCellE4human();
			doCellD2robot();
			doCellG1robot();
			doCellH1robot();
			docellH2robot();
			doCellH3human();
			doCellI4robot();
			doCellD3human();
			doCellG1human();
			doCellA4human();
			doCellA4robot();
			doCellB4robot();
			doCellE4robot();
			doCellD4robot();
			doCellG4robot();
			doCellD1robot();
			doCellJ4robot();
			doCellH1human();
			doCellF1human();
			doCellJ1human();
			doCellD1human();
			doCellJ4human();
			doCellB2robot();
			doCellC2robot();
			doCellF1robot();
			doCellD5human();
			doCellJ1robot();
			doCellJ3human();
			doCellF3human();
			doCellB2human();
			docellG4human();
			doCellJ2robot();
			doCellD5robot();
			doCellF2robot();
		}

		VALUE doCellH2human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ2human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ3robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellH3robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellD2human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellF2human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellC2human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellI5human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ5human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellG5human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellE5human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellD3robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellF3robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellB4human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellD4human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellE5robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellG5robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ5robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellI5robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellI4human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellE4human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellD2robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellG1robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellH1robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE docellH2robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellH3human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellI4robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellD3human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellG1human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellA4human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellA4robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellB4robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellE4robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellD4robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellG4robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellD1robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ4robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellH1human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellF1human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ1human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellD1human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ4human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellB2robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellC2robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellF1robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellD5human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ1robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ3human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellF3human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellB2human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE docellG4human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ2robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellD5robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCellF2robot() [1, + INF]
		MEETS {
			Idle();
		}

	}


	COMPONENT Goal {FLEXIBLE goals(functional)} : GoalVariableType;
	COMPONENT Worker {FLEXIBLE operations(primitive)} :  WorkerVariableType;
	COMPONENT Cobot {FLEXIBLE tasks(primitive)} : CobotVariableType;
	COMPONENT ProductionG0L0 {FLEXIBLE tasks_g0_l0(functional)} : ProductionHierarchyG0L0Type;
	COMPONENT ProductionG0L1 {FLEXIBLE tasks_g0_l1(functional)} : ProductionHierarchyG0L1Type;
	COMPONENT ProductionG0L2 {FLEXIBLE tasks_g0_l2(functional)} : ProductionHierarchyG0L2Type;
	COMPONENT ProductionG0L3 {FLEXIBLE tasks_g0_l3(functional)} : ProductionHierarchyG0L3Type;

	SYNCHRONIZE ProductionG0L3.tasks_g0_l3 {

		VALUE doCellH2human() {

			d0 Worker.operations._pickplace-h2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellJ2human() {

			d0 Worker.operations._pickplace-j2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellJ3robot() {

			d0 Cobot.tasks._pickplace-j3-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellH3robot() {

			d0 Cobot.tasks._pickplace-h3-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellC2human() {

			d0 Worker.operations._pickplace-c2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellD2human() {

			d0 Worker.operations._pickplace-d2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellF2human() {

			d0 Worker.operations._pickplace-f2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellI5human() {

			d0 Worker.operations._pickplace-i5-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellJ5human() {

			d0 Worker.operations._pickplace-j5-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellG5human() {

			d0 Worker.operations._pickplace-g5-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellE5human() {

			d0 Worker.operations._pickplace-e5-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellD3robot() {

			d0 Cobot.tasks._pickplace-d3-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellF3robot() {

			d0 Cobot.tasks._pickplace-f3-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellB4human() {

			d0 Worker.operations._pickplace-b4-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellD4human() {

			d0 Worker.operations._pickplace-d4-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellG5robot() {

			d0 Cobot.tasks._pickplace-g5-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellE5robot() {

			d0 Cobot.tasks._pickplace-e5-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellJ5robot() {

			d0 Cobot.tasks._pickplace-j5-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellI5robot() {

			d0 Cobot.tasks._pickplace-i5-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellI4human() {

			d0 Worker.operations._pickplace-i4-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellE4human() {

			d0 Worker.operations._pickplace-e4-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellD2robot() {

			d0 Cobot.tasks._pickplace-d2-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellG1robot() {

			d0 Cobot.tasks._pickplace-g1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellH1robot() {

			d0 Cobot.tasks._pickplace-h1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE docellH2robot() {

			d0 Cobot.tasks._pickplace-h2-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellH3human() {

			d0 Worker.operations._pickplace-h3-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellI4robot() {

			d0 Cobot.tasks._pickplace-i4-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellD3human() {

			d0 Worker.operations._pickplace-d3-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellG1human() {

			d0 Worker.operations._pickplace-g1-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellA4human() {

			d0 Worker.operations._pickplace-a4-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellA4robot() {

			d0 Cobot.tasks._pickplace-a4-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellB4robot() {

			d0 Cobot.tasks._pickplace-b4-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellE4robot() {

			d0 Cobot.tasks._pickplace-e4-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellD4robot() {

			d0 Cobot.tasks._pickplace-d4-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellG4robot() {

			d0 Cobot.tasks._pickplace-g4-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellD1robot() {

			d0 Cobot.tasks._pickplace-d1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellJ4robot() {

			d0 Cobot.tasks._pickplace-j4-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellF1human() {

			d0 Worker.operations._pickplace-f1-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellH1human() {

			d0 Worker.operations._pickplace-h1-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellJ1human() {

			d0 Worker.operations._pickplace-j1-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellJ4human() {

			d0 Worker.operations._pickplace-j4-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellD1human() {

			d0 Worker.operations._pickplace-d1-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellC2robot() {

			d0 Cobot.tasks._pickplace-c2-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellB2robot() {

			d0 Cobot.tasks._pickplace-b2-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellD5human() {

			d0 Worker.operations._pickplace-d5-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellF1robot() {

			d0 Cobot.tasks._pickplace-f1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellJ1robot() {

			d0 Cobot.tasks._pickplace-j1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellJ3human() {

			d0 Worker.operations._pickplace-j3-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellF3human() {

			d0 Worker.operations._pickplace-f3-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellB2human() {

			d0 Worker.operations._pickplace-b2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE docellG4human() {

			d0 Worker.operations._pickplace-g4-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellJ2robot() {

			d0 Cobot.tasks._pickplace-j2-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellD5robot() {

			d0 Cobot.tasks._pickplace-d5-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellF2robot() {

			d0 Cobot.tasks._pickplace-f2-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionG0L1.tasks_g0_l1 {

		 VALUE doRow2() {

			d0 ProductionG0L2.tasks_g0_l2.doCellG2();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG0L2.tasks_g0_l2.doCellH2();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG0L2.tasks_g0_l2.doCellI2();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionG0L2.tasks_g0_l2.doCellJ2();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionG0L2.tasks_g0_l2.doCellA2();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionG0L2.tasks_g0_l2.doCellB2();
			CONTAINS [0, +INF] [0, +INF] d5;
			d6 ProductionG0L2.tasks_g0_l2.doCellC2();
			CONTAINS [0, +INF] [0, +INF] d6;
			d7 ProductionG0L2.tasks_g0_l2.doCellD2();
			CONTAINS [0, +INF] [0, +INF] d7;
			d8 ProductionG0L2.tasks_g0_l2.doCellE2();
			CONTAINS [0, +INF] [0, +INF] d8;
			d9 ProductionG0L2.tasks_g0_l2.doCellF2();
			CONTAINS [0, +INF] [0, +INF] d9;
		}

		 VALUE doRow3() {

			d0 ProductionG0L2.tasks_g0_l2.doCellH3();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG0L2.tasks_g0_l2.doCellI3();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG0L2.tasks_g0_l2.doCellJ3();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionG0L2.tasks_g0_l2.doCellA3();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionG0L2.tasks_g0_l2.doCellB3();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionG0L2.tasks_g0_l2.doCellC3();
			CONTAINS [0, +INF] [0, +INF] d5;
			d6 ProductionG0L2.tasks_g0_l2.doCellD3();
			CONTAINS [0, +INF] [0, +INF] d6;
			d7 ProductionG0L2.tasks_g0_l2.doCellE3();
			CONTAINS [0, +INF] [0, +INF] d7;
			d8 ProductionG0L2.tasks_g0_l2.doCellF3();
			CONTAINS [0, +INF] [0, +INF] d8;
			d9 ProductionG0L2.tasks_g0_l2.doCellG3();
			CONTAINS [0, +INF] [0, +INF] d9;
		}

		 VALUE doRow1() {

			d0 ProductionG0L2.tasks_g0_l2.doCellF1();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG0L2.tasks_g0_l2.doCellG1();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG0L2.tasks_g0_l2.doCellH1();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionG0L2.tasks_g0_l2.doCellI1();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionG0L2.tasks_g0_l2.doCellJ1();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionG0L2.tasks_g0_l2.doCellA1();
			CONTAINS [0, +INF] [0, +INF] d5;
			d6 ProductionG0L2.tasks_g0_l2.doCellB1();
			CONTAINS [0, +INF] [0, +INF] d6;
			d7 ProductionG0L2.tasks_g0_l2.doCellC1();
			CONTAINS [0, +INF] [0, +INF] d7;
			d8 ProductionG0L2.tasks_g0_l2.doCellD1();
			CONTAINS [0, +INF] [0, +INF] d8;
			d9 ProductionG0L2.tasks_g0_l2.doCellE1();
			CONTAINS [0, +INF] [0, +INF] d9;
		}

		 VALUE doRow4() {

			d0 ProductionG0L2.tasks_g0_l2.doCellI4();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG0L2.tasks_g0_l2.doCellJ4();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG0L2.tasks_g0_l2.doCellA4();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionG0L2.tasks_g0_l2.doCellB4();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionG0L2.tasks_g0_l2.doCellC4();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionG0L2.tasks_g0_l2.doCellD4();
			CONTAINS [0, +INF] [0, +INF] d5;
			d6 ProductionG0L2.tasks_g0_l2.doCellE4();
			CONTAINS [0, +INF] [0, +INF] d6;
			d7 ProductionG0L2.tasks_g0_l2.doCellF4();
			CONTAINS [0, +INF] [0, +INF] d7;
			d8 ProductionG0L2.tasks_g0_l2.doCellG4();
			CONTAINS [0, +INF] [0, +INF] d8;
			d9 ProductionG0L2.tasks_g0_l2.doCellH4();
			CONTAINS [0, +INF] [0, +INF] d9;
		}

		 VALUE doRow5() {

			d0 ProductionG0L2.tasks_g0_l2.doCellJ5();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG0L2.tasks_g0_l2.doCellA5();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG0L2.tasks_g0_l2.doCellB5();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionG0L2.tasks_g0_l2.doCellC5();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionG0L2.tasks_g0_l2.doCellD5();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionG0L2.tasks_g0_l2.doCellE5();
			CONTAINS [0, +INF] [0, +INF] d5;
			d6 ProductionG0L2.tasks_g0_l2.doCellF5();
			CONTAINS [0, +INF] [0, +INF] d6;
			d7 ProductionG0L2.tasks_g0_l2.doCellG5();
			CONTAINS [0, +INF] [0, +INF] d7;
			d8 ProductionG0L2.tasks_g0_l2.doCellH5();
			CONTAINS [0, +INF] [0, +INF] d8;
			d9 ProductionG0L2.tasks_g0_l2.doCellI5();
			CONTAINS [0, +INF] [0, +INF] d9;
		}

	}

	SYNCHRONIZE ProductionG0L2.tasks_g0_l2 {

		VALUE doCellA5() {

			d0 Cobot.tasks._pickplace-a5-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellH3() {

			d0 ProductionG0L3.tasks_g0_l3.doCellH3robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellH3() {

			d0 ProductionG0L3.tasks_g0_l3.doCellH3human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellG1() {

			d0 ProductionG0L3.tasks_g0_l3.doCellG1robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellG1() {

			d0 ProductionG0L3.tasks_g0_l3.doCellG1human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellE5() {

			d0 ProductionG0L3.tasks_g0_l3.doCellE5robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellE5() {

			d0 ProductionG0L3.tasks_g0_l3.doCellE5human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellD3() {

			d0 ProductionG0L3.tasks_g0_l3.doCellD3robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellD3() {

			d0 ProductionG0L3.tasks_g0_l3.doCellD3human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellC1() {

			d0 Cobot.tasks._pickplace-c1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellI5() {

			d0 ProductionG0L3.tasks_g0_l3.doCellI5robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellI5() {

			d0 ProductionG0L3.tasks_g0_l3.doCellI5human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellI4() {

			d0 ProductionG0L3.tasks_g0_l3.doCellI4robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellI4() {

			d0 ProductionG0L3.tasks_g0_l3.doCellI4human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellH2() {

			d0 ProductionG0L3.tasks_g0_l3.docellH2robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellH2() {

			d0 ProductionG0L3.tasks_g0_l3.doCellH2human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellA4() {

			d0 ProductionG0L3.tasks_g0_l3.doCellA4robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellA4() {

			d0 ProductionG0L3.tasks_g0_l3.doCellA4human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellE4() {

			d0 ProductionG0L3.tasks_g0_l3.doCellE4robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellE4() {

			d0 ProductionG0L3.tasks_g0_l3.doCellE4human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellD2() {

			d0 ProductionG0L3.tasks_g0_l3.doCellD2robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellD2() {

			d0 ProductionG0L3.tasks_g0_l3.doCellD2human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellJ5() {

			d0 ProductionG0L3.tasks_g0_l3.doCellJ5robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellJ5() {

			d0 ProductionG0L3.tasks_g0_l3.doCellJ5human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellI3() {

			d0 Worker.operations._pickplace-i3-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellH1() {

			d0 ProductionG0L3.tasks_g0_l3.doCellH1robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellH1() {

			d0 ProductionG0L3.tasks_g0_l3.doCellH1human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellB5() {

			d0 Cobot.tasks._pickplace-b5-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellA3() {

			d0 Cobot.tasks._pickplace-a3-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellF5() {

			d0 Worker.operations._pickplace-f5-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellE3() {

			d0 Worker.operations._pickplace-e3-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellD1() {

			d0 ProductionG0L3.tasks_g0_l3.doCellD1robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellD1() {

			d0 ProductionG0L3.tasks_g0_l3.doCellD1human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellJ4() {

			d0 ProductionG0L3.tasks_g0_l3.doCellJ4robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellJ4() {

			d0 ProductionG0L3.tasks_g0_l3.doCellJ4human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellI2() {

			d0 Worker.operations._pickplace-i2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellB4() {

			d0 ProductionG0L3.tasks_g0_l3.doCellB4robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellB4() {

			d0 ProductionG0L3.tasks_g0_l3.doCellB4human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellA2() {

			d0 Cobot.tasks._pickplace-a2-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellF4() {

			d0 Worker.operations._pickplace-f4-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellE2() {

			d0 Worker.operations._pickplace-e2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellJ3() {

			d0 ProductionG0L3.tasks_g0_l3.doCellJ3robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellJ3() {

			d0 ProductionG0L3.tasks_g0_l3.doCellJ3human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellI1() {

			d0 Worker.operations._pickplace-i1-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellC5() {

			d0 Cobot.tasks._pickplace-c5-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellB3() {

			d0 Cobot.tasks._pickplace-b3-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellA1() {

			d0 Cobot.tasks._pickplace-a1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellG5() {

			d0 ProductionG0L3.tasks_g0_l3.doCellG5robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellG5() {

			d0 ProductionG0L3.tasks_g0_l3.doCellG5human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellF3() {

			d0 ProductionG0L3.tasks_g0_l3.doCellF3robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellF3() {

			d0 ProductionG0L3.tasks_g0_l3.doCellF3human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellE1() {

			d0 Worker.operations._pickplace-e1-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellJ2() {

			d0 ProductionG0L3.tasks_g0_l3.doCellJ2robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellJ2() {

			d0 ProductionG0L3.tasks_g0_l3.doCellJ2human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellC4() {

			d0 Cobot.tasks._pickplace-c4-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellB2() {

			d0 ProductionG0L3.tasks_g0_l3.doCellB2robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellB2() {

			d0 ProductionG0L3.tasks_g0_l3.doCellB2human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellG4() {

			d0 ProductionG0L3.tasks_g0_l3.docellG4human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellG4() {

			d0 ProductionG0L3.tasks_g0_l3.doCellG4robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellF2() {

			d0 ProductionG0L3.tasks_g0_l3.doCellF2robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellF2() {

			d0 ProductionG0L3.tasks_g0_l3.doCellF2human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellF1() {

			d0 ProductionG0L3.tasks_g0_l3.doCellF1robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellF1() {

			d0 ProductionG0L3.tasks_g0_l3.doCellF1human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellJ1() {

			d0 ProductionG0L3.tasks_g0_l3.doCellJ1robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellJ1() {

			d0 ProductionG0L3.tasks_g0_l3.doCellJ1human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellD5() {

			d0 ProductionG0L3.tasks_g0_l3.doCellD5robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellD5() {

			d0 ProductionG0L3.tasks_g0_l3.doCellD5human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellC3() {

			d0 Cobot.tasks._pickplace-c3-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellB1() {

			d0 Cobot.tasks._pickplace-b1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellH5() {

			d0 Worker.operations._pickplace-h5-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellG3() {

			d0 Worker.operations._pickplace-g3-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellG2() {

			d0 Worker.operations._pickplace-g2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellD4() {

			d0 ProductionG0L3.tasks_g0_l3.doCellD4robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellD4() {

			d0 ProductionG0L3.tasks_g0_l3.doCellD4human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellC2() {

			d0 ProductionG0L3.tasks_g0_l3.doCellC2robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellC2() {

			d0 ProductionG0L3.tasks_g0_l3.doCellC2human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellH4() {

			d0 Worker.operations._pickplace-h4-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionG0L0.tasks_g0_l0 {

		 VALUE doMosaic() {

			d0 ProductionG0L1.tasks_g0_l1.doRow5();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG0L1.tasks_g0_l1.doRow4();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG0L1.tasks_g0_l1.doRow1();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionG0L1.tasks_g0_l1.doRow3();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionG0L1.tasks_g0_l1.doRow2();
			CONTAINS [0, +INF] [0, +INF] d4;
		}

	}

	SYNCHRONIZE Goal.goals {

		VALUE mosaic-goal() {

			d0 ProductionG0L0.tasks_g0_l0.doMosaic();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}


}

