enum POINT { TYPE, MASK , X, Y, LENGTH };

#macro POINT_BEGIN var point = array_create(POINT.LENGTH, OBJECT_TYPE.POINT);

#macro POINT_MASK point[POINT.MASK]
#macro POINT_X point[POINT.X]
#macro POINT_Y point[POINT.Y]

#macro POINT_END return point

function Point(tx, ty, mask = 0){
	POINT_BEGIN;
	
	POINT_MASK = mask;
	POINT_X = tx;
	POINT_Y = ty;
	
	POINT_END;
}

//collisions 
function point_point_test(a, b) {
	return [(a.x == b.x and a.y == b.y)];
}