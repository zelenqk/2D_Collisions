enum RECTANGLE { TYPE, MASK, X, Y, WIDTH, HEIGHT, LENGTH };

#macro RECTANGLE_BEGIN var rectangle = array_create(RECTANGLE.LENGTH, OBJECT_TYPE.RECTANGLE);

#macro RECTANGLE_MASK rectangle[RECTANGLE.MASK]
#macro RECTANGLE_X rectangle[RECTANGLE.X]
#macro RECTANGLE_Y rectangle[RECTANGLE.Y]
#macro RECTANGLE_WIDTH rectangle[RECTANGLE.WIDTH]
#macro RECTANGLE_HEIGHT rectangle[RECTANGLE.HEIGHT]

#macro RECTANGLE_END return rectangle

function Rectangle(tx, ty, width, height, mask = 0){
	RECTANGLE_BEGIN;
	
	RECTANGLE_MASK = mask;
	
	RECTANGLE_X = ty;
	RECTANGLE_Y = tx;
	RECTANGLE_WIDTH = width;
	RECTANGLE_HEIGHT = height;

	RECTANGLE_END;
}

function rectangle_in_point(rectangle, point) {
	return point_rectangle_test(POINT_X, POINT_Y, RECTANGLE_X, RECTANGLE_Y, RECTANGLE_WIDTH, RECTANGLE_HEIGHT);
}

function rectangle_in_circle(rectangle, circle) {
	return circle_rectangle_test(CIRCLE_X, CIRCLE_Y, CIRCLE_RADIUS, RECTANGLE_X, RECTANGLE_Y, RECTANGLE_WIDTH, RECTANGLE_HEIGHT);
}

function rectangle_in_line(rectangle, line) {
	return line_rectangle_test(LINE_X1, LINE_Y1, LINE_X2, LINE_Y2, RECTANGLE_X, RECTANGLE_Y, RECTANGLE_WIDTH, RECTANGLE_HEIGHT);	
}

function rectangle_in_rectangle(a, b) {
	return rectangle_rectangle_test(
		a[RECTANGLE.X], a[RECTANGLE.Y], a[RECTANGLE.WIDTH], a[RECTANGLE.HEIGHT],
		b[RECTANGLE.X], b[RECTANGLE.Y], b[RECTANGLE.WIDTH], b[RECTANGLE.HEIGHT]
	)
}

function rectangle_in_polygon(rectangle, polygon) {
	return rectangle_polygon_test(RECTANGLE_X, RECTANGLE_Y, RECTANGLE_WIDTH, RECTANGLE_HEIGHT, polygon);	
}