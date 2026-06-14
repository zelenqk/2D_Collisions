//floating point shenanigans might occur
#macro point_triangle_precision 0.001

function point_triangle_test(px, py, x1, y1, x2, y2, x3, y3) {
	//calculate the main triangle area
	var area = abs(
		(x2 - x1) * (y3 - y1) -
		(x3 - x1) * (y2 - y1)
	);
	
	//calculate the area from the triangles between the main triangle and the point
	var area_a = abs(
		(x1 - px) * (y2 - py) - 
		(x2 - px) * (y1 - py)
	)
	
	var area_b = abs(
		(x2 - px) * (y3 - py) - 
		(x3 - px) * (y2 - py)
	)
	
	
	var area_c = abs(
		(x3 - px) * (y1 - py) - 
		(x1 - px) * (y3 - py)
	)
	
	var collision = ((area_a + area_b + area_c) == area);
	return collision;
}

function point_circle_test(px, py, cx, cy, radius) {
    var dx = px - cx;
    var dy = py - cy;
	
	var collision = (dx * dx + dy * dy) <= (radius * radius);
	
    return collision;
}
