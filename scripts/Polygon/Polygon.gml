enum POLYGON { TYPE, MASK, EDGES, EDGE_LIST };

//buid the rectangle
#macro POLYGON_BEGIN var polygon = array_create(LINE.LENGTH, OBJECT_TYPE.POLYGON);
#macro POLYGON_MASK			polygon[POLYGON.MASK]
#macro POLYGON_EDGES		polygon[POLYGON.EDGES]
#macro POLYGON_EDGE_LIST	polygon[POLYGON.EDGE_LIST]

#macro POLYGON_END return polygon

function Polygon(points, mask = 0){
	POLYGON_BEGIN;
	POLYGON_MASK  = mask;
	
	POLYGON_EDGE_LIST = [];
	
	var i = 0;
	var edge = 0;
	var length = array_length(points);

	repeat (array_length(points) - 1) {
		var point_a = points[i++ % length];
		var point_b = points[i++ % length];
	
		POLYGON_EDGE_LIST[edge++] = Line(point_a[POINT.X], point_a[POINT.Y], point_b[POINT.X], point_b[POINT.Y]);
	}
	
	POLYGON_EDGES = edge;
	
	POLYGON_END;
}