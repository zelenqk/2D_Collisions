//floating point shenanigans might occur
#macro point_triangle_precision 0.001
#macro point_line_precision 0.1

function point_circle_test(px, py, cx, cy, radius) {
    var dx = px - cx;
    var dy = py - cy;
	
	var collision = (dx * dx + dy * dy) <= (radius * radius);
	
    return collision;
}

function point_line_test(px, py, x1, y1, x2, y2){
	var length = point_distance(x1, y1, x2, y2);
	var d1 = point_distance(px, py, x1, y1);
	var d2 = point_distance(px, py, x2, y2);
	
	return (d1 + d2 >= length - point_line_precision and d1 + d2 <= length + point_triangle_precision);
}

function point_triangle_test(px, py, x1, y1, x2, y2, x3, y3) {
	//calculate the main triangle area
	var area = abs((x2 - x1) * (y3 - y1) - (x3 - x1) * (y2 - y1));
	
	//calculate the area from the triangles between the main triangle and the point
	var area_a = abs((x1 - px) * (y2 - py) - (x2 - px) * (y1 - py));
	var area_b = abs((x2 - px) * (y3 - py) - (x3 - px) * (y2 - py));
	var area_c = abs((x3 - px) * (y1 - py) - (x1 - px) * (y3 - py));
	
	return ((area_a + area_b + area_c) - area) <= point_triangle_precision;
}

function point_rectangle_test(px, py, rx, ry, w, h) {
	var in_x = (px >= rx and px <= rx + w);
	var in_y = (py >= ry and py <= ry + h);
	
	return (in_x and in_y);	
}

function point_polygon_test(px, py, polygon) {
    var collision = false;

    var i = 0;
    repeat (POLYGON_EDGES) {
        var point_a = POLYGON_POINTS[i++];
        var point_b = POLYGON_POINTS[i % POLYGON_EDGES];
		
		var test = (point_a[POINT.Y] >= py && point_b[POINT.Y] < py) or (point_a[POINT.Y] < py && point_b[POINT.Y] >= py)
        var curve = (px < (point_b[POINT.X] - point_a[POINT.X]) * (py - point_a[POINT.Y]) / (point_b[POINT.Y] - point_a[POINT.Y]) + point_a[POINT.X]);
		
		if (test and curve) collision = !collision;
    }

    return collision;
}