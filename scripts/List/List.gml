enum LIST { TYPE, LENGTH };

function List(objects = []) {
	if (!is_array(objects)) objects = [objects];
	
	var list = [OBJECT_TYPE.LIST];
	
	for(var i = 1; i < array_length(objects); i++) {
		array_push(list)	
	}
	
	return list;
}