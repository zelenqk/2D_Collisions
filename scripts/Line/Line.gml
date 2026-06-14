enum LINE { TYPE, MATRIX, MASK, X1, Y1, X2, Y2, LENGTH };

//buid the line
#macro LINE_BEGIN var line = array_create(LINE.LENGTH, OBJECT_TYPE.LINE)
#macro LINE_MASK line[LINE.MASK]
#macro LINE_X1 line[LINE.X1]
#macro LINE_Y1 line[LINE.Y1]
#macro LINE_X2 line[LINE.X2]
#macro LINE_Y2 line[LINE.Y2]

#macro LINE_END return line

function Line(x1, y1, x2, y2, mask = 0){
	LINE_BEGIN;
	
	LINE_MASK = mask;
	
	LINE_X1 = x1;
	LINE_Y1 = y1;
	LINE_X2 = x2;
	LINE_Y2 = y2;
	
	LINE_END;
}

//collision functions
function line_in_line(a, b){
	var x1 = a[LINE.X1];
	var x2 = a[LINE.X2];
	var x3 = b[LINE.X1];
	var x4 = b[LINE.X2];
	
	var y1 = a[LINE.Y1];
	var y2 = a[LINE.Y2];
	var y3 = b[LINE.Y1];
	var y4 = b[LINE.Y2];
	
	var uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
	var uB = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));

	var collision = (uA >= 0 and uA <= 1 and uB >= 0 and uB <=1);

	var intersection_x = x1 + (uA * (x2 - x1));
	var intersection_y = y1 + (uA * (y2 - y1));
	
	return [collision, intersection_x, intersection_y];
}

function line_in_polygon(line, polygon){
		
}

function line_polygon_test(line, polygon) {
	var x1 = line[LINE.X1];
	var x2 = line[LINE.X2];
	
	var y1 = line[LINE.Y1];
	var y2 = line[LINE.Y2];
	
	var result = [false];
	
	var i = 0;
	repeat (POLYGON_EDGES){
		var a = POLYGON_POINTS[i++];
		var b = POLYGON_POINTS[i % POLYGON_EDGES];
		
		var x3 = edge[LINE.X1];
		var x4 = edge[LINE.X2];
		var y3 = edge[LINE.Y1];
		var y4 = edge[LINE.Y2];
		
		var uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
		var uB = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
		
		var collision = (uA >= 0 and uA <= 1 and uB >= 0 and uB <=1);
		
		if (collision) {
			result[0] = true;
			array_push(result, [x1 + (uA * (x2 - x1)), y1 + (uA * (y2 - y1))])
		}
	}
	
	return result;
}