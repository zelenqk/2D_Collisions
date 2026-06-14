enum POLYGON { TYPE, MASK, EDGES, POINTS, CENTER_X, CENTER_Y, LENGTH };

//buid the rectangle
#macro POLYGON_BEGIN	var polygon = array_create(POLYGON.LENGTH, OBJECT_TYPE.POLYGON)
#macro POLYGON_MASK			polygon[POLYGON.MASK]
#macro POLYGON_EDGES		polygon[POLYGON.EDGES]
#macro POLYGON_POINTS		polygon[POLYGON.POINTS]
#macro POLYGON_CENTER_X		polygon[POLYGON.CENTER_X]
#macro POLYGON_CENTER_Y		polygon[POLYGON.CENTER_Y]

#macro POLYGON_END return polygon

function Polygon(points, mask = 0){
	POLYGON_BEGIN;
	POLYGON_MASK  = mask;
	
	POLYGON_EDGES = array_length(points);
	POLYGON_POINTS = points;
	
	//find center
	var i = 0;
	var width = 0;
	var height = 0;
	
	repeat (POLYGON_EDGES) {
		var point_a = POLYGON_POINTS[i++];
		var point_b = POLYGON_POINTS[i % POLYGON_EDGES];
		
		width += point_a[POINT.X];
		height += point_a[POINT.Y];
	}
	
	POLYGON_CENTER_X = width / POLYGON_EDGES;
	POLYGON_CENTER_Y = height / POLYGON_EDGES;
	
	//finish
	POLYGON_END;
}

function polygon_in_point(polygon, point) {
	return point_polygon_test(POINT_X, POINT_Y, polygon);
}

function polygon_in_circle(polygon, circle) {
	return circle_polygon_test(CIRCLE_X, CIRCLE_Y, CIRCLE_RADIUS, polygon);	
}

function polygon_in_line(polygon, line) {
	return line_polygon_test(LINE_X1, LINE_Y1, LINE_X2, LINE_Y2, polygon);	
}

function polygon_in_rectangle(polygon, rectangle) {
	return rectangle_polygon_test(RECTANGLE_X, RECTANGLE_Y, RECTANGLE_WIDTH, RECTANGLE_HEIGHT, polygon);	
}

function polygon_in_polygon(a, b) {
	return polygon_polygon_test(a, b);	
}

//im not creating a whole test script for just one function
function polygon_polygon_test(a, b) {
	if (point_polygon_test(a[POLYGON.CENTER_X], a[POLYGON.CENTER_Y], b)) return true;
	
	var i = 0;
	repeat (a[POLYGON.EDGES]) {
        var point_a = a[POLYGON.POINTS][i++];
        var point_b = a[POLYGON.POINTS][i % POLYGON_EDGES]
		
		var collision = line_polygon_test(point_a[POINT.X], point_a[POINT.Y], point_b[POINT.X], point_b[POINT.Y], b);
	}
}