enum LIST { TYPE, MASK, LENGTH, OBJECTS };

function List(objects = []) {
	if (!is_array(objects)) objects = [objects];
	
	var list = [OBJECT_TYPE.LIST, 0, array_length(objects), objects];
	
	return list;
}

function list_in_object(list, object) {
	var i = 0;
	repeat (list[LIST.LENGTH]) {
		var col = list[LIST.OBJECTS][i++];
		if (col[OBJECT_TYPE.MASK] != object[OBJECT_TYPE.MASK]) continue;
		
		if (collision_test(col, object)) return true;
	}
	
	return false;
}

function list_test(object, list) {
	list_in_object(list, object);
}