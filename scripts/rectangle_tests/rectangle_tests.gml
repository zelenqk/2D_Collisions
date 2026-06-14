function rectangle_rectangle_test(ax, ay, aw, ah, bx, by, bw, bh) {
	var right_edge = ax + aw;
	
	return (
		ax + aw >= bx and
		ay + ah >= by and

		ax <= bx + bw and
		ay <= by + bh
	);
}

function rectangle_polygon_test(rx, ry, w, h, polygon) {
	return (
		point_polygon_test(rx, ry, polygon) or 
		point_polygon_test(rx + w, ry, polygon) or 
		point_polygon_test(rx + w, ry + h, polygon) or 
		point_polygon_test(rx, ry + h, polygon)
	)
}