enum DYNAMIC { TYPE, OBJECT, CACHE, MASK, X, Y, ANGLE, LENGTH }

#macro DYNAMIC_BEGIN var dynamic = array_create(DYNAMIC.LENGTH);

#macro DYNAMIC_MASK dynamic[DYNAMIC.MASK]
#macro DYNAMIC_X dynamic[DYNAMIC.X]
#macro DYNAMIC_Y dynamic[DYNAMIC.Y]
#macro DYNAMIC_ANGLE dynamic[DYNAMIC.ANGLE]

#macro DYNAMIC_OBJECT dynamic[DYNAMIC.OBJECT]
#macro DYNAMIC_CACHE dynamic[DYNAMIC.CACHE]

#macro DYNAMIC_END return dynamic

function Dynamic(tx, ty, angle, object, mask = 0){
	DYNAMIC_BEGIN;
	DYNAMIC_MASK = mask;
	
	DYNAMIC_X = tx;
	DYNAMIC_Y = ty;
	DYNAMIC_ANGLE = angle;
	
	DYNAMIC_OBJECT = object;
	DYNAMIC_CACHE = copy_array_recursive(object);
	
	DYNAMIC_END
}

function translate_to_world(px, py, tx, ty, angle) {
	var c = dcos(angle);
	var s = dsin(angle);
	
	var wx = tx + px * c - py * s;
	var wy = ty + px * s - py * c;
	
	return [wx, wy];
}