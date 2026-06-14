enum LINE { TYPE, MATRIX, MASK, X1, Y1, X2, Y2, LENGTH };

//buid the line
#macro LINE_BEGIN var line = array_create(LINE.LENGTH, OBJECT_TYPE.LINE)
#macro LINE_MASK line[LINE.MASK]
#macro LINE_X1 line[LINE.X1]
#macro LINE_Y1 line[LINE.Y1]
#macro LINE_X2 line[LINE.X2]
#macro LINE_Y2 line[LINE.Y2]

#macro LINE_END return line

function Line(x1, y1, x2, y2, mask = 0){
	LINE_BEGIN;
	
	LINE_MASK = mask;
	
	LINE_X1 = x1;
	LINE_Y1 = y1;
	LINE_X2 = x2;
	LINE_Y2 = y2;
	
	LINE_END;
}

//collision functions
function line_in_point(line, point) {
	return point_line_test(POINT_X, POINT_Y, LINE_X1, LINE_Y1, LINE_X2, LINE_Y2);
}

function line_in_line(a, b) {
	return line_line_test(a[LINE.X1], a[LINE.Y1], a[LINE.X2], a[LINE.Y2], b[LINE.X1], b[LINE.Y1], b[LINE.X2], b[LINE.Y2])
}

function line_in_circle(line, circle) {
	return circle_line_test(CIRCLE_X, CIRCLE_Y, CIRCLE_RADIUS, LINE_X1, LINE_Y1, LINE_X2, LINE_Y2);	
}

function line_in_rectangle(line, rectangle) {
	return line_rectangle_test(LINE_X1, LINE_Y1, LINE_X2, LINE_Y2, RECTANGLE_X, RECTANGLE_Y, RECTANGLE_WIDTH, RECTANGLE_HEIGHT);	
}

function line_in_polygon(line, polygon) {
	return line_polygon_test(LINE_X1, LINE_Y1, LINE_X2, LINE_Y2, polygon);	
}