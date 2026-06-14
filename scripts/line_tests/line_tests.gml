function line_line_test(x1, y1, x2, y2, x3, y3, x4, y4) {
	var uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
	var uB = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
	
	return (uA >= 0 and uA <= 1 and uB >= 0 and uB <= 1);
}

function line_rectangle_test(x1, y1, x2, y2, rx, ry, w, h) {
	var left =   line_line_test(x1, y1, x2, y2, rx, ry, rx, ry + h);
	var right =  line_line_test(x1, y1, x2, y2, rx + w, ry, rx + w, ry + h);
	var top =    line_line_test(x1, y1, x2, y2, rx, ry, rx + w, ry);
	var bottom = line_line_test(x1, y1, x2, y2, rx, ry + h, rx + w, ry + h);
	
	return (left or right or top or bottom);
}


function line_polygon_test(x1, y1, x2, y2, polygon) {
	if (point_polygon_test(x1, y1, polygon) or
		point_polygon_test(x2, y2, polygon)) return true;

    var i = 0;
    repeat (POLYGON_EDGES) {
        var point_a = POLYGON_POINTS[i++];
        var point_b = POLYGON_POINTS[i % POLYGON_EDGES];
		
		if (line_line_test(	x1, y1, x2, y2,
							point_a[POINT.X], point_a[POINT.Y],
							point_b[POINT.X], point_b[POINT.Y])) return true;
    }

    return false;
}