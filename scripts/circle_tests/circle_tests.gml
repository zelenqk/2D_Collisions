function circle_circle_test(ax, ay, arad, bx, by, brad) {
	var dx = ax - bx;
    var dy = ay - by;
	
    var sum = arad + brad;
    return (dx * dx + dy * dy) <= (sum * sum);
}

function circle_line_test(cx, cy, radius, x1, y1, x2, y2) {
	var a = point_circle_test(x1, y1, cx, cy, radius);
	var b = point_circle_test(x2, y2, cx, cy, radius);
	if (a or b) return true;
	
	var dx = (x2 - x1);
	var dy = (y2 - y1);
	
	var dist_x = x1 - x2;
	var dist_y = y1 - y2;
	
	var length = sqrt((dist_x * dist_x) + (dist_y * dist_y));
	
	var dot = (((cx - x1) * dx) + ((cy - y1) * dy)) / power(length, 2)
	
	var closest_x = x1 + (dot * dx);
	var closest_y = y1 + (dot * dy);

	var onSegment = point_line_test(cx, cy, x1, y1, x2, y2);
	if (!onSegment) return false;
	
	dist_x = closest_x - cx;
	dist_y = closest_y - cy;
	var distance = sqrt((dist_x * dist_x) + (dist_y * dist_y));
	
	return (distance <= radius);
}

function circle_polygon_test(cx, cy, radius, polygon) {
	if (point_polygon_test(cx, cy, polygon)) return true;
	
    var i = 0;
    repeat (POLYGON_EDGES) {
        var point_a = POLYGON_POINTS[i++];
        var point_b = POLYGON_POINTS[i % POLYGON_EDGES];
		
		if (circle_line_test(cx, cy, radius, point_a[POINT.X], point_a[POINT.Y], point_b[POINT.X], point_b[POINT.Y])) return true;
    }

    return false;
}

function circle_rectangle_test(cx, cy, radius, rx, ry, w, h) {
	var test_x = rx;
	if (cx > rx + w) test_x = rx + w;
	
	var test_y = ry;
	if (cy > ry + h) test_y = ry + h;
	
	var dist_x = cx - test_x;
	var dist_y = cy - test_y;

	var distance = sqrt((dist_x * dist_x) + (dist_y * dist_y));
	
	return (distance <= radius);
}