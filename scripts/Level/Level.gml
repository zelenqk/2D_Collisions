enum OBJECT_TYPE { TYPE, POINT, LINE, POLYGON, CAPSULE };

//collisions map
globalvar POINT_COLLISIONS;
POINT_COLLISIONS = [];
POINT_COLLISIONS[OBJECT_TYPE.POINT] = point_point_test;

globalvar LINE_COLLISIONS;

LINE_COLLISIONS = [];
LINE_COLLISIONS [OBJECT_TYPE.LINE] = line_line_test;
LINE_COLLISIONS [OBJECT_TYPE.POLYGON] = line_polygon_test;

globalvar COLLISIONS_MAP;
COLLISIONS_MAP = [];
COLLISIONS_MAP[OBJECT_TYPE.LINE] = LINE_COLLISIONS;

function collision_test(a, b){
	var object_tests = COLLISIONS_MAP[ a[OBJECT_TYPE.TYPE]];
	var test = object_tests[ b[OBJECT_TYPE.TYPE]];
	
	return test(a, b);
}

function Level(){
	
}