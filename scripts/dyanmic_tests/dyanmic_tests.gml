function dynamic_test(object, dynamic, matrix = object) {
	var type = dynamic[OBJECT_TYPE.TYPE];
	
	switch (type) {
	case OBJECT_TYPE.DYNAMIC:
		return dynamic_test(object, dynamic[DYNAMIC.OBJECT], dynamic);
	case OBJECT_TYPE.LIST:
		var i = 0;
		repeat(dynamic[LIST.LENGTH]) if (dynamic_test(object, dynamic[LIST.OBJECTS][i++])) return true;
		return false;
	default:
		return collision_test(object, translate_to_world(dynamic, matrix));
	}
}