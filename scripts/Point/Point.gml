enum POINT { TYPE, MASK , X, Y, LENGTH };

#macro POINT_BEGIN var point = array_create(POINT.LENGTH, OBJECT_TYPE.POINT)

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

//point collision tests
function point_in_point(a, b) {
	var collision = (a[POINT.X] == b[POINT.X] and a[POINT.Y] == b[POINT.Y]);
	return collision;
}

function point_in_circle(point, circle){
    return point_circle_test(POINT_X, POINT_Y, CIRCLE_X, CIRCLE_Y, CIRCLE_RADIUS);
}

function point_in_line(point, line){
    var dx = LINE_X2 - LINE_X1;
    var dy = LINE_Y2 - LINE_Y1;

    var dxp = POINT_X - LINE_X1;
    var dyp = POINT_Y - LINE_Y1;

    var cross = dx * dyp - dy * dxp;
	if (cross != 0) return false; // not collinear
	
    var dot = dxp * dx + dyp * dy;
	if (dot < 0) return false;
	
    var len_sq = dx * dx + dy * dy;
	if (dot > len_sq) return false;
	
	return true;
}

function point_in_rectangle(point, rectangle) {
	var in_x = (POINT_X >= RECTANGLE_LEFT and POINT_X <= RECTANGLE_RIGHT);
	var in_y = (POINT_Y >= RECTANGLE_TOP and POINT_Y <= RECTANGLE_BOTTOM);
	
	return (in_x and in_y);
}

function point_in_polygon(point, polygon) {
	var i = 0;
	repeat (POLYGON_EDGES) {
		var point_a = POLYGON_POINTS[i++];
		var point_b = POLYGON_POINTS[i % POLYGON_EDGES];
		
		if (point_triangle_test(
			POINT_X, POINT_Y,
			
			point_a[POINT.X], point_a[POINT.Y],
			point_b[POINT.X], point_b[POINT.Y],
			POLYGON_CENTER_X, POLYGON_CENTER_Y,
		)) return true;
	}
	
	return false;
}