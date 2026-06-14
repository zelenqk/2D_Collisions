enum DYNAMIC { TYPE, OBJECT, MASK, X, Y, XSCALE, YSCALE, ANGLE, LENGTH }

#macro DYNAMIC_BEGIN var dynamic = array_create(DYNAMIC.LENGTH, OBJECT_TYPE.DYNAMIC);

#macro DYNAMIC_MASK dynamic[DYNAMIC.MASK]
#macro DYNAMIC_X dynamic[DYNAMIC.X]
#macro DYNAMIC_Y dynamic[DYNAMIC.Y]
#macro DYNAMIC_XSCALE dynamic[DYNAMIC.XSCALE]
#macro DYNAMIC_YSCALE dynamic[DYNAMIC.YSCALE]
#macro DYNAMIC_ANGLE dynamic[DYNAMIC.ANGLE]

#macro DYNAMIC_OBJECT dynamic[DYNAMIC.OBJECT]

#macro DYNAMIC_END return dynamic

function Dynamic(tx, ty, object, mask = 0, xscale = 1, yscale = 1, angle = 0){
	DYNAMIC_BEGIN;
	DYNAMIC_MASK = mask;
	
	DYNAMIC_X = tx;
	DYNAMIC_Y = ty;
	DYNAMIC_XSCALE = xscale;
	DYNAMIC_YSCALE = yscale;
	DYNAMIC_ANGLE = angle;
	
	DYNAMIC_OBJECT = object;
	
	DYNAMIC_END;
}

function translate_to_world(object, matrix) {
	switch (object[OBJECT_TYPE.TYPE]) {
	case OBJECT_TYPE.POINT:
		return transform_point(object[POINT.X], object[POINT.Y], matrix);
	case OBJECT_TYPE.CIRCLE:
		var p = transform_point(object[POINT.X], object[POINT.Y], matrix);
		return Circle(p[POINT.X], p[POINT.Y], object[CIRCLE.RADIUS] * matrix[DYNAMIC.XSCALE] * matrix[DYNAMIC.YSCALE], object[CIRCLE.MASK]);
	case OBJECT_TYPE.LINE:
		var p1 = transform_point(object[LINE.X1], object[LINE.Y1], matrix);
		var p2 = transform_point(object[LINE.X2], object[LINE.Y2], matrix);
		return Line(p1[POINT.X], p1[POINT.Y],p2[POINT.X], p2[POINT.Y] , object[CIRCLE.MASK])
	case OBJECT_TYPE.RECTANGLE:
		var pos = transform_point(object[RECTANGLE.X], object[RECTANGLE.Y], matrix);
		var siz = transform_point(object[RECTANGLE.WIDTH], object[RECTANGLE.HEIGHT], matrix);
		return Rectangle(pos[POINT.X], pos[POINT.Y], siz[POINT.X], siz[POINT.Y]);
	case OBJECT_TYPE.POLYGON:
		var ps = [];
		
		var i = 0;
		repeat (object[POLYGON.EDGES]) {
			var p = object[POLYGON.POINTS][i++];
			array_push(ps, transform_point(p[POINT.X], p[POINT.Y], matrix));
		}
		
		return Polygon(ps, object[POLYGON.MASK]);
	case OBJECT_TYPE.DYNAMIC:
		return translate_to_world(object[DYNAMIC.OBJECT], matrix);
	}
}

function transform_point(px, py, matrix) {
	var tx = matrix[DYNAMIC.X];
	var ty = matrix[DYNAMIC.Y];
	var angle = matrix[DYNAMIC.ANGLE];
	var scale_x = matrix[DYNAMIC.XSCALE];
	var scale_y = matrix[DYNAMIC.YSCALE];
	
	px = px * scale_x;
	py = py * scale_y;
	
	var c = dcos(angle);
	var s = dsin(angle);
	
	var rx = px * c - py * s;
	var ry = px * s + py * c;
	
	return Point(rx + tx, ry + ty);
}

function dynamic_in_object(dynamic, object) {
	return dynamic_test(object, dynamic, dynamic);
}