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
    var dx = a[CIRCLE.X] - b[CIRCLE.X];	//basically if the distance between the two circles
    var dy = a[CIRCLE.Y] - b[CIRCLE.Y];	//is smaller than the sum of their radii it means they are colliding

    var sum = a[CIRCLE.RADIUS] + b[CIRCLE.RADIUS];
    return (dx * dx + dy * dy) <= (sum * sum);
}

function circle_in_line(circle, line) {
	circle_line_test(CIRCLE_X, CIRCLE_Y, CIRCLE_RADIUS, LINE_X1, LINE_Y1, LINE_X2, LINE_Y2);
}