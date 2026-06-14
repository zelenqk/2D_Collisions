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