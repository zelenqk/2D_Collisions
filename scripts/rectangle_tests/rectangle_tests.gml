function rectangle_rectangle_test(ax, ay, aw, ah, bx, by, bw, bh) {
	var right_edge = ax + aw;
	
	return (
		ax + aw >= bx and
		ay + ah >= by and

		ax <= bx + bw and
		ay <= by + bh
	);
}

function rectangle_circle_test(rx, ry, w, h, cx, cy, radius) {
	var test_x = rx;
	if (cx > rx + w) test_x = rx + w;
	
	var test_y = ry;
	if (cy > ry + h) test_y = ry + h;
	
	var dist_x = cx - test_x;
	var dist_y = cy - test_y;

	var distance = sqrt((dist_x * dist_x) + (dist_y * dist_y));
	
	return (distance <= radius);
}

function rectangle_polygon_test(rx, ry, w, h, polygon) {
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