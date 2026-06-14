enum RECTANGLE { TYPE, MASK, TOP, LEFT, BOTTOM, RIGHT, LENGTH };

#macro RECTANGLE_BEGIN var rectangle = array_create(RECTANGLE.LENGTH, OBJECT_TYPE.RECTANGLE);

#macro RECTANGLE_MASK rectangle[RECTANGLE.MASK]
#macro RECTANGLE_TOP rectangle[RECTANGLE.TOP]
#macro RECTANGLE_LEFT rectangle[RECTANGLE.LEFT]
#macro RECTANGLE_BOTTOM rectangle[RECTANGLE.BOTTOM]
#macro RECTANGLE_RIGHT rectangle[RECTANGLE.RIGHT]

#macro RECTANGLE_END return rectangle

function Rectangle(tx, ty, width, height, mask = 0){
	RECTANGLE_BEGIN;
	
	RECTANGLE_MASK = mask;
	
	RECTANGLE_TOP = ty;
	RECTANGLE_LEFT = tx;
	RECTANGLE_BOTTOM = ty + height;
	RECTANGLE_RIGHT = tx + width;

	RECTANGLE_END;
}

