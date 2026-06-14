globalvar collision_debug_draw;
collision_debug_draw = [];

collision_debug_draw[OBJECT_TYPE.LIST] = list_draw;
collision_debug_draw[OBJECT_TYPE.DYNAMIC] = dynamic_draw;

collision_debug_draw[OBJECT_TYPE.POINT] = point_draw;
collision_debug_draw[OBJECT_TYPE.CIRCLE] = circle_draw;
collision_debug_draw[OBJECT_TYPE.LINE] = line_draw;
collision_debug_draw[OBJECT_TYPE.RECTANGLE] = rectangle_draw;
collision_debug_draw[OBJECT_TYPE.POLYGON] = polygon_draw;


function collision_draw(object){
	var submit = collision_debug_draw[object[OBJECT_TYPE.TYPE]]
	submit(object);
}

function list_draw(list) {
	var i = 0;
	repeat (list[LIST.LENGTH]) collision_draw(list[LIST.OBJECTS][i++]);
}

function dynamic_draw(dynamic, matrix = dynamic) {
	var type = (dynamic[DYNAMIC.TYPE])	

	switch (type) {
	case OBJECT_TYPE.DYNAMIC:
		dynamic_draw(dynamic[DYNAMIC.OBJECT], matrix);
		break;
	case OBJECT_TYPE.LIST:
		list_draw(dynamic, matrix);
		break;
	default:
		var object = translate_to_world(dynamic, matrix);
		collision_draw(object);
		break;
	}
}

//primitives
function point_draw(point) {
	draw_circle(POINT_X, POINT_Y, 1, false);
}

function circle_draw(circle) {
	draw_circle(CIRCLE_X, CIRCLE_Y, CIRCLE_RADIUS, true);
}

function line_draw(line) {
	draw_line(LINE_X1, LINE_Y1, LINE_X2, LINE_Y2);	
}

function rectangle_draw(rectangle) {
	draw_rectangle(RECTANGLE_X, RECTANGLE_Y, RECTANGLE_X + RECTANGLE_WIDTH, RECTANGLE_Y + RECTANGLE_HEIGHT, true);	
}


function polygon_draw(polygon) {
	var i = 0;
	repeat(POLYGON_EDGES){
		var point_a = POLYGON_POINTS[i++];
		var point_b = POLYGON_POINTS[i % POLYGON_EDGES];
		
		draw_line(point_a[POINT.X], point_a[POINT.Y], point_b[POINT.X], point_b[POINT.Y]);
	}	
}
