enum CIRCLE { TYPE, MASK, X, Y, RADIUS, LENGTH };

#macro CIRCLE_BEGIN var circle = array_create(CIRCLE.LENGTH, OBJECT_TYPE.CIRCLE)

#macro CIRCLE_MASK circle[CIRCLE.MASK]

#macro CIRCLE_X circle[CIRCLE.X]
#macro CIRCLE_Y circle[CIRCLE.Y]
#macro CIRCLE_RADIUS circle[CIRCLE.RADIUS]

#macro CIRCLE_END return circle

function Circle(tx, ty, radius, mask = 0){
	CIRCLE_BEGIN;
	
	CIRCLE_MASK = mask;
	CIRCLE_X = tx;
	CIRCLE_Y = ty;
	CIRCLE_RADIUS = radius
	
	CIRCLE_END;
}

//collisions
function circle_in_point(circle, point) {
	return point_circle_test(POINT_X, POINT_Y, CIRCLE_X, CIRCLE_Y, CIRCLE_RADIUS);
}

function circle_in_circle(a, b) {
	return circle_circle_test(a[CIRCLE.X], a[CIRCLE.Y], a[CIRCLE.RADIUS], b[CIRCLE.X], b[CIRCLE.Y], b[CIRCLE.RADIUS])
}

function circle_in_line(circle, line) {
	return circle_line_test(CIRCLE_X, CIRCLE_Y, CIRCLE_RADIUS, LINE_X1, LINE_Y1, LINE_X2, LINE_Y2);
}

function circle_in_rectangle(circle, rectangle) {
	return circle_rectangle_test(CIRCLE_X, CIRCLE_Y, CIRCLE_RADIUS, RECTANGLE_X, RECTANGLE_Y, RECTANGLE_WIDTH, RECTANGLE_HEIGHT);
}
function circle_in_polygon(circle, polygon) {
	return circle_polygon_test(CIRCLE_X, CIRCLE_Y, CIRCLE_RADIUS, polygon);
}