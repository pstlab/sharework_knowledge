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

	COMP_TYPE SingletonStateVariable WorkerVariableType(pickplace-d4-human(), pickplace-e3-human(), pickplace-f4-human(), pickplace-e1-human(), pickplace-h2-human(), pickplace-i5-human(), pickplace-b4-human(), pickplace-h5-human(), pickplace-i2-human(), pickplace-g4-human(), pickplace-e4-human(), pickplace-h4-human(), pickplace-j2-human(), pickplace-j5-human(), pickplace-a4-human(), pickplace-f1-human(), pickplace-b2-human(), pickplace-d2-human(), pickplace-i1-human(), pickplace-h1-human(), pickplace-d5-human(), pickplace-g5-human(), pickplace-j4-human(), pickplace-i3-human(), pickplace-f3-human(), pickplace-i4-human(), pickplace-e5-human(), pickplace-c2-human(), pickplace-g3-human(), pickplace-f5-human(), pickplace-d3-human(), pickplace-e2-human(), pickplace-d1-human(), pickplace-g2-human(), pickplace-f2-human(), pickplace-h3-human(), pickplace-j1-human(), pickplace-g1-human(), pickplace-j3-human(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			pickplace-d4-human();
			pickplace-e3-human();
			pickplace-f4-human();
			pickplace-e1-human();
			pickplace-h2-human();
			pickplace-i5-human();
			pickplace-b4-human();
			pickplace-h5-human();
			pickplace-i2-human();
			pickplace-g4-human();
			pickplace-e4-human();
			pickplace-h4-human();
			pickplace-j2-human();
			pickplace-j5-human();
			pickplace-a4-human();
			pickplace-f1-human();
			pickplace-b2-human();
			pickplace-d2-human();
			pickplace-i1-human();
			pickplace-h1-human();
			pickplace-d5-human();
			pickplace-g5-human();
			pickplace-j4-human();
			pickplace-i3-human();
			pickplace-f3-human();
			pickplace-i4-human();
			pickplace-e5-human();
			pickplace-c2-human();
			pickplace-g3-human();
			pickplace-f5-human();
			pickplace-d3-human();
			pickplace-e2-human();
			pickplace-d1-human();
			pickplace-g2-human();
			pickplace-f2-human();
			pickplace-h3-human();
			pickplace-j1-human();
			pickplace-g1-human();
			pickplace-j3-human();
		}

		VALUE pickplace-d4-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-e3-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-f4-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-e1-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-h2-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-i5-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-b4-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-h5-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-i2-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-g4-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-e4-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-h4-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-j2-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-j5-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-a4-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-f1-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-b2-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-d2-human() [1, +INF]
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

		VALUE pickplace-d5-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-g5-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-j4-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-i3-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-f3-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-i4-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-e5-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-c2-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-g3-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-f5-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-d3-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-e2-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-d1-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-g2-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-f2-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-h3-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-j1-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-g1-human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-j3-human() [1, +INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable CobotVariableType(pickplace-a2-robot(), pickplace-d2-robot(), pickplace-j2-robot(), pickplace-j3-robot(), pickplace-f3-robot(), pickplace-i5-robot(), pickplace-c4-robot(), pickplace-c3-robot(), pickplace-e4-robot(), pickplace-h2-robot(), pickplace-h1-robot(), pickplace-f2-robot(), pickplace-b5-robot(), pickplace-b1-robot(), pickplace-g4-robot(), pickplace-d1-robot(), pickplace-j5-robot(), pickplace-b3-robot(), pickplace-b2-robot(), pickplace-j4-robot(), pickplace-a4-robot(), pickplace-d5-robot(), pickplace-a5-robot(), pickplace-c2-robot(), pickplace-i4-robot(), pickplace-h3-robot(), pickplace-a1-robot(), pickplace-f1-robot(), pickplace-g5-robot(), pickplace-d3-robot(), pickplace-c5-robot(), pickplace-b4-robot(), pickplace-j1-robot(), pickplace-a3-robot(), pickplace-g1-robot(), pickplace-c1-robot(), pickplace-e5-robot(), pickplace-d4-robot(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			pickplace-a2-robot();
			pickplace-d2-robot();
			pickplace-j2-robot();
			pickplace-j3-robot();
			pickplace-f3-robot();
			pickplace-i5-robot();
			pickplace-c4-robot();
			pickplace-c3-robot();
			pickplace-e4-robot();
			pickplace-h2-robot();
			pickplace-h1-robot();
			pickplace-f2-robot();
			pickplace-b5-robot();
			pickplace-b1-robot();
			pickplace-g4-robot();
			pickplace-d1-robot();
			pickplace-j5-robot();
			pickplace-b3-robot();
			pickplace-b2-robot();
			pickplace-j4-robot();
			pickplace-a4-robot();
			pickplace-d5-robot();
			pickplace-a5-robot();
			pickplace-c2-robot();
			pickplace-i4-robot();
			pickplace-h3-robot();
			pickplace-a1-robot();
			pickplace-f1-robot();
			pickplace-g5-robot();
			pickplace-d3-robot();
			pickplace-c5-robot();
			pickplace-b4-robot();
			pickplace-j1-robot();
			pickplace-a3-robot();
			pickplace-g1-robot();
			pickplace-c1-robot();
			pickplace-e5-robot();
			pickplace-d4-robot();
		}

		VALUE pickplace-a2-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-d2-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-j2-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-j3-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-f3-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-i5-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-c4-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-c3-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-e4-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-h2-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-h1-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-f2-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-b5-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-b1-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-g4-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-d1-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-j5-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-b3-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-b2-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-j4-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-a4-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-d5-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-a5-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-c2-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-i4-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-h3-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-a1-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-f1-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-g5-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-d3-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-c5-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-b4-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-j1-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-a3-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-g1-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-c1-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-e5-robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE pickplace-d4-robot() [1, +INF]
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

	COMP_TYPE SingletonStateVariable ProductionHierarchyL1Type(doRow2(), doRow3(), doRow1(), doRow4(), doRow5(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			doRow2();
			doRow3();
			doRow1();
			doRow4();
			doRow5();
		}

		VALUE doRow2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doRow3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doRow1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doRow4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doRow5() [1, +INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL2Type(doCellA5(), doCellH3(), doCellG1(), doCellE5(), doCellD3(), doCellC1(), doCellI5(), doCellI4(), doCellH2(), doCellA4(), doCellE4(), doCellD2(), doCellJ5(), doCellI3(), doCellH1(), doCellB5(), doCellA3(), doCellF5(), doCellE3(), doCellD1(), doCellJ4(), doCellI2(), doCellB4(), doCellA2(), doCellF4(), doCellE2(), doCellJ3(), doCellI1(), doCellC5(), doCellB3(), doCellA1(), doCellG5(), doCellF3(), doCellE1(), doCellJ2(), doCellC4(), doCellB2(), doCellG4(), doCellF2(), doCellF1(), doCellJ1(), doCellD5(), doCellC3(), doCellB1(), doCellH5(), doCellG3(), doCellG2(), doCellD4(), doCellC2(), doCellH4(),  Idle()) {

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

		VALUE doCellA5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellH3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellG1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellE5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellD3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellC1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellI5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellI4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellH2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellA4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellE4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellD2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellI3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellH1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellB5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellA3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellF5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellE3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellD1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellI2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellB4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellA2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellF4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellE2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellI1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellC5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellB3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellA1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellG5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellF3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellE1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellC4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellB2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellG4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellF2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellF1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellD5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellC3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellB1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellH5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellG3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellG2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellD4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellC2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellH4() [1, +INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL3Type(doCellH2human(), doCellJ2human(), doCellJ3robot(), doCellH3robot(), doCellD2human(), doCellF2human(), doCellC2human(), doCellI5human(), doCellJ5human(), doCellG5human(), doCellE5human(), doCellD3robot(), doCellF3robot(), doCellB4human(), doCellD4human(), doCellE5robot(), doCellG5robot(), doCellJ5robot(), doCellI5robot(), doCellI4human(), doCellE4human(), doCellD2robot(), doCellG1robot(), doCellH1robot(), docellH2robot(), doCellH3human(), doCellI4robot(), doCellD3human(), doCellG1human(), doCellA4human(), doCellA4robot(), doCellB4robot(), doCellE4robot(), doCellD4robot(), doCellG4robot(), doCellD1robot(), doCellJ4robot(), doCellH1human(), doCellF1human(), doCellJ1human(), doCellD1human(), doCellJ4human(), doCellB2robot(), doCellC2robot(), doCellF1robot(), doCellD5human(), doCellJ1robot(), doCellJ3human(), doCellF3human(), doCellB2human(), docellG4human(), doCellJ2robot(), doCellD5robot(), doCellF2robot(),  Idle()) {

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

		VALUE doCellH2human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ2human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ3robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellH3robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellD2human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellF2human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellC2human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellI5human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ5human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellG5human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellE5human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellD3robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellF3robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellB4human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellD4human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellE5robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellG5robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ5robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellI5robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellI4human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellE4human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellD2robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellG1robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellH1robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE docellH2robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellH3human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellI4robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellD3human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellG1human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellA4human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellA4robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellB4robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellE4robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellD4robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellG4robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellD1robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ4robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellH1human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellF1human() [1, +INF]
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

		VALUE doCellJ4human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellB2robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellC2robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellF1robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellD5human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ1robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ3human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellF3human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellB2human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE docellG4human() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellJ2robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellD5robot() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE doCellF2robot() [1, +INF]
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

		VALUE doCellA5() {

			d0 Cobot.tasks.pickplace-a5-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellH3() {

			d0 ProductionL3.tasks_l3.doCellH3robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellH3() {

			d0 ProductionL3.tasks_l3.doCellH3human();
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

		 VALUE doCellE5() {

			d0 ProductionL3.tasks_l3.doCellE5robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellE5() {

			d0 ProductionL3.tasks_l3.doCellE5human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellD3() {

			d0 ProductionL3.tasks_l3.doCellD3robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellD3() {

			d0 ProductionL3.tasks_l3.doCellD3human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellC1() {

			d0 Cobot.tasks.pickplace-c1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellI5() {

			d0 ProductionL3.tasks_l3.doCellI5robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellI5() {

			d0 ProductionL3.tasks_l3.doCellI5human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellI4() {

			d0 ProductionL3.tasks_l3.doCellI4robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellI4() {

			d0 ProductionL3.tasks_l3.doCellI4human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellH2() {

			d0 ProductionL3.tasks_l3.docellH2robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellH2() {

			d0 ProductionL3.tasks_l3.doCellH2human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellA4() {

			d0 ProductionL3.tasks_l3.doCellA4robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellA4() {

			d0 ProductionL3.tasks_l3.doCellA4human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellE4() {

			d0 ProductionL3.tasks_l3.doCellE4robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellE4() {

			d0 ProductionL3.tasks_l3.doCellE4human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellD2() {

			d0 ProductionL3.tasks_l3.doCellD2robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellD2() {

			d0 ProductionL3.tasks_l3.doCellD2human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellJ5() {

			d0 ProductionL3.tasks_l3.doCellJ5robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellJ5() {

			d0 ProductionL3.tasks_l3.doCellJ5human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellI3() {

			d0 Worker.operations.pickplace-i3-human();
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

		VALUE doCellB5() {

			d0 Cobot.tasks.pickplace-b5-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellA3() {

			d0 Cobot.tasks.pickplace-a3-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellF5() {

			d0 Worker.operations.pickplace-f5-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellE3() {

			d0 Worker.operations.pickplace-e3-human();
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

		 VALUE doCellJ4() {

			d0 ProductionL3.tasks_l3.doCellJ4robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellJ4() {

			d0 ProductionL3.tasks_l3.doCellJ4human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellI2() {

			d0 Worker.operations.pickplace-i2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellB4() {

			d0 ProductionL3.tasks_l3.doCellB4robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellB4() {

			d0 ProductionL3.tasks_l3.doCellB4human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellA2() {

			d0 Cobot.tasks.pickplace-a2-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellF4() {

			d0 Worker.operations.pickplace-f4-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellE2() {

			d0 Worker.operations.pickplace-e2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellJ3() {

			d0 ProductionL3.tasks_l3.doCellJ3robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellJ3() {

			d0 ProductionL3.tasks_l3.doCellJ3human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellI1() {

			d0 Worker.operations.pickplace-i1-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellC5() {

			d0 Cobot.tasks.pickplace-c5-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellB3() {

			d0 Cobot.tasks.pickplace-b3-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellA1() {

			d0 Cobot.tasks.pickplace-a1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellG5() {

			d0 ProductionL3.tasks_l3.doCellG5robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellG5() {

			d0 ProductionL3.tasks_l3.doCellG5human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellF3() {

			d0 ProductionL3.tasks_l3.doCellF3robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellF3() {

			d0 ProductionL3.tasks_l3.doCellF3human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellE1() {

			d0 Worker.operations.pickplace-e1-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellJ2() {

			d0 ProductionL3.tasks_l3.doCellJ2robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellJ2() {

			d0 ProductionL3.tasks_l3.doCellJ2human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellC4() {

			d0 Cobot.tasks.pickplace-c4-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellB2() {

			d0 ProductionL3.tasks_l3.doCellB2robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellB2() {

			d0 ProductionL3.tasks_l3.doCellB2human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellG4() {

			d0 ProductionL3.tasks_l3.docellG4human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellG4() {

			d0 ProductionL3.tasks_l3.doCellG4robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellF2() {

			d0 ProductionL3.tasks_l3.doCellF2robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellF2() {

			d0 ProductionL3.tasks_l3.doCellF2human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellF1() {

			d0 ProductionL3.tasks_l3.doCellF1robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellF1() {

			d0 ProductionL3.tasks_l3.doCellF1human();
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

		 VALUE doCellD5() {

			d0 ProductionL3.tasks_l3.doCellD5robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellD5() {

			d0 ProductionL3.tasks_l3.doCellD5human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellC3() {

			d0 Cobot.tasks.pickplace-c3-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellB1() {

			d0 Cobot.tasks.pickplace-b1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellH5() {

			d0 Worker.operations.pickplace-h5-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellG3() {

			d0 Worker.operations.pickplace-g3-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellG2() {

			d0 Worker.operations.pickplace-g2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellD4() {

			d0 ProductionL3.tasks_l3.doCellD4robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellD4() {

			d0 ProductionL3.tasks_l3.doCellD4human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellC2() {

			d0 ProductionL3.tasks_l3.doCellC2robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doCellC2() {

			d0 ProductionL3.tasks_l3.doCellC2human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellH4() {

			d0 Worker.operations.pickplace-h4-human();
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

		VALUE doCellH2human() {

			d0 Worker.operations.pickplace-h2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellJ2human() {

			d0 Worker.operations.pickplace-j2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellJ3robot() {

			d0 Cobot.tasks.pickplace-j3-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellH3robot() {

			d0 Cobot.tasks.pickplace-h3-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellC2human() {

			d0 Worker.operations.pickplace-c2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellD2human() {

			d0 Worker.operations.pickplace-d2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellF2human() {

			d0 Worker.operations.pickplace-f2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellI5human() {

			d0 Worker.operations.pickplace-i5-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellJ5human() {

			d0 Worker.operations.pickplace-j5-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellG5human() {

			d0 Worker.operations.pickplace-g5-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellE5human() {

			d0 Worker.operations.pickplace-e5-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellD3robot() {

			d0 Cobot.tasks.pickplace-d3-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellF3robot() {

			d0 Cobot.tasks.pickplace-f3-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellB4human() {

			d0 Worker.operations.pickplace-b4-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellD4human() {

			d0 Worker.operations.pickplace-d4-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellE5robot() {

			d0 Cobot.tasks.pickplace-e5-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellG5robot() {

			d0 Cobot.tasks.pickplace-g5-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellJ5robot() {

			d0 Cobot.tasks.pickplace-j5-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellI5robot() {

			d0 Cobot.tasks.pickplace-i5-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellI4human() {

			d0 Worker.operations.pickplace-i4-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellE4human() {

			d0 Worker.operations.pickplace-e4-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellD2robot() {

			d0 Cobot.tasks.pickplace-d2-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellG1robot() {

			d0 Cobot.tasks.pickplace-g1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellH1robot() {

			d0 Cobot.tasks.pickplace-h1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE docellH2robot() {

			d0 Cobot.tasks.pickplace-h2-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellH3human() {

			d0 Worker.operations.pickplace-h3-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellI4robot() {

			d0 Cobot.tasks.pickplace-i4-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellD3human() {

			d0 Worker.operations.pickplace-d3-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellG1human() {

			d0 Worker.operations.pickplace-g1-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellA4human() {

			d0 Worker.operations.pickplace-a4-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellA4robot() {

			d0 Cobot.tasks.pickplace-a4-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellB4robot() {

			d0 Cobot.tasks.pickplace-b4-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellE4robot() {

			d0 Cobot.tasks.pickplace-e4-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellD4robot() {

			d0 Cobot.tasks.pickplace-d4-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellG4robot() {

			d0 Cobot.tasks.pickplace-g4-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellD1robot() {

			d0 Cobot.tasks.pickplace-d1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellJ4robot() {

			d0 Cobot.tasks.pickplace-j4-robot();
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

		VALUE doCellJ4human() {

			d0 Worker.operations.pickplace-j4-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellD1human() {

			d0 Worker.operations.pickplace-d1-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellB2robot() {

			d0 Cobot.tasks.pickplace-b2-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellC2robot() {

			d0 Cobot.tasks.pickplace-c2-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellD5human() {

			d0 Worker.operations.pickplace-d5-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellF1robot() {

			d0 Cobot.tasks.pickplace-f1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellJ1robot() {

			d0 Cobot.tasks.pickplace-j1-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellJ3human() {

			d0 Worker.operations.pickplace-j3-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellF3human() {

			d0 Worker.operations.pickplace-f3-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellB2human() {

			d0 Worker.operations.pickplace-b2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE docellG4human() {

			d0 Worker.operations.pickplace-g4-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellJ2robot() {

			d0 Cobot.tasks.pickplace-j2-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellD5robot() {

			d0 Cobot.tasks.pickplace-d5-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCellF2robot() {

			d0 Cobot.tasks.pickplace-f2-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionL1.tasks_l1 {

		 VALUE doRow2() {

			d0 ProductionL2.tasks_l2.doCellG2();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL2.tasks_l2.doCellH2();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionL2.tasks_l2.doCellI2();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionL2.tasks_l2.doCellJ2();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionL2.tasks_l2.doCellA2();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionL2.tasks_l2.doCellB2();
			CONTAINS [0, +INF] [0, +INF] d5;
			d6 ProductionL2.tasks_l2.doCellC2();
			CONTAINS [0, +INF] [0, +INF] d6;
			d7 ProductionL2.tasks_l2.doCellD2();
			CONTAINS [0, +INF] [0, +INF] d7;
			d8 ProductionL2.tasks_l2.doCellE2();
			CONTAINS [0, +INF] [0, +INF] d8;
			d9 ProductionL2.tasks_l2.doCellF2();
			CONTAINS [0, +INF] [0, +INF] d9;
		}

		 VALUE doRow3() {

			d0 ProductionL2.tasks_l2.doCellH3();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL2.tasks_l2.doCellI3();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionL2.tasks_l2.doCellJ3();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionL2.tasks_l2.doCellA3();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionL2.tasks_l2.doCellB3();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionL2.tasks_l2.doCellC3();
			CONTAINS [0, +INF] [0, +INF] d5;
			d6 ProductionL2.tasks_l2.doCellD3();
			CONTAINS [0, +INF] [0, +INF] d6;
			d7 ProductionL2.tasks_l2.doCellE3();
			CONTAINS [0, +INF] [0, +INF] d7;
			d8 ProductionL2.tasks_l2.doCellF3();
			CONTAINS [0, +INF] [0, +INF] d8;
			d9 ProductionL2.tasks_l2.doCellG3();
			CONTAINS [0, +INF] [0, +INF] d9;
		}

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

		 VALUE doRow4() {

			d0 ProductionL2.tasks_l2.doCellI4();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL2.tasks_l2.doCellJ4();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionL2.tasks_l2.doCellA4();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionL2.tasks_l2.doCellB4();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionL2.tasks_l2.doCellC4();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionL2.tasks_l2.doCellD4();
			CONTAINS [0, +INF] [0, +INF] d5;
			d6 ProductionL2.tasks_l2.doCellE4();
			CONTAINS [0, +INF] [0, +INF] d6;
			d7 ProductionL2.tasks_l2.doCellF4();
			CONTAINS [0, +INF] [0, +INF] d7;
			d8 ProductionL2.tasks_l2.doCellG4();
			CONTAINS [0, +INF] [0, +INF] d8;
			d9 ProductionL2.tasks_l2.doCellH4();
			CONTAINS [0, +INF] [0, +INF] d9;
		}

		 VALUE doRow5() {

			d0 ProductionL2.tasks_l2.doCellJ5();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL2.tasks_l2.doCellA5();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionL2.tasks_l2.doCellB5();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionL2.tasks_l2.doCellC5();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionL2.tasks_l2.doCellD5();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionL2.tasks_l2.doCellE5();
			CONTAINS [0, +INF] [0, +INF] d5;
			d6 ProductionL2.tasks_l2.doCellF5();
			CONTAINS [0, +INF] [0, +INF] d6;
			d7 ProductionL2.tasks_l2.doCellG5();
			CONTAINS [0, +INF] [0, +INF] d7;
			d8 ProductionL2.tasks_l2.doCellH5();
			CONTAINS [0, +INF] [0, +INF] d8;
			d9 ProductionL2.tasks_l2.doCellI5();
			CONTAINS [0, +INF] [0, +INF] d9;
		}

	}


}

