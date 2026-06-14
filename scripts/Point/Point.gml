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

function point_in_line(point, line) {
	return point_line_test(POINT_X, POINT_Y, LINE_X1, LINE_Y1, LINE_X2, LINE_Y2);	
}

function point_in_rectangle(point, rectangle) {
	return point_rectangle_test(POINT_X, POINT_Y, RECTANGLE_X, RECTANGLE_Y, RECTANGLE_WIDTH, RECTANGLE_HEIGHT);
}

function point_in_polygon(point, polygon) {
	return point_polygon_test(POINT_X, POINT_Y, polygon);	
}
