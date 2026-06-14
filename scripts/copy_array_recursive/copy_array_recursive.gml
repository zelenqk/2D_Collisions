function copy_array_recursive(array){
	var copy = [];
	
	for(var i = 0; i < array_length(array); i++) {
		var element = array[i];
		
		if (is_array(element)) array_push(copy, copy_array_recursive(element));
		else array_push(copy, element);
	}
	
	return copy;
}