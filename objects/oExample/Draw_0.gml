draw_circle(point[POINT.X], point[POINT.Y], 12, result);

var i = 0;
repeat(POLYGON_EDGES){
	var point_a = POLYGON_POINTS[i++];
	var point_b = POLYGON_POINTS[i % POLYGON_EDGES];
	
	draw_line(point_a[POINT.X], point_a[POINT.Y], point_b[POINT.X], point_b[POINT.Y]);
}
