enum CIRCLE { TYPE, MASK, X, Y, RADIUS, LENGTH };

#macro CIRCLE_BEGIN var circle = array_create(CIRCLE.LENGTH, OBJECT_TYPE.CIRCLE)

#macro CIRCLE_MASK circle[CIRCLE.MASK]

#macro CIRCLE_X circle[CIRCLE.X]
#macro CIRCLE_Y circle[CIRCLE.Y]
#macro CIRCLE_RADIUS circle[CIRCLE.RADIUS]

#macro CIRCLE_END return circle

function Circle(tx, ty, radius, mask = 0){
	CIRCLE_BEGIN;
	
	CIRCLE_MASK = mask;
	CIRCLE_X = tx;
	CIRCLE_Y = ty;
	CIRCLE_RADIUS = radius
	
	CIRCLE_END;
}

//collisions
function circle_in_point(circle, point) {
    var dx = POINT_X - CIRCLE_X;
    var dy = POINT_Y - CIRCLE_Y;
	
	var collision = (dx * dx + dy * dy) <= (CIRCLE_RADIUS * CIRCLE_RADIUS);
	
    return collision;
}

function circle_in_circle(a, b) {		//this one makes me feel smart :)))
    var dx = a[CIRCLE.X] - b[CIRCLE.X];
    var dy = a[CIRCLE.Y] - b[CIRCLE.Y];

    var r = a[CIRCLE.RADIUS] + b[CIRCLE.RADIUS];
    return (dx * dx + dy * dy) <= (r * r);
}

function circle_in_line(circle, line) {
	var a = point_circle_test(line[LINE.X1], line[LINE.Y1], CIRCLE_X, CIRCLE_Y, CIRCLE_RADIUS);
	var b = point_circle_test(line[LINE.X2], line[LINE.Y2], CIRCLE_X, CIRCLE_Y, CIRCLE_RADIUS);
	if (a or b) return true;
}