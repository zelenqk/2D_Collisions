point = Point(0, 0)

polygon = Polygon([
    Point(room_width / 2 + 60, room_height / 2 - 10),
    Point(room_width / 2 + 40, room_height / 2 + 50),
    Point(room_width / 2 - 10, room_height / 2 + 70),
    Point(room_width / 2 - 60, room_height / 2 + 20),
    Point(room_width / 2 - 50, room_height / 2 - 40),
    Point(room_width / 2 - 10, room_height / 2 - 70),
    Point(room_width / 2 + 50, room_height / 2 - 40)
]);

dynamic = Dynamic(0, 0, Polygon([
		Point(+ 60, - 10),
		Point(+ 40, + 50),
		Point(- 10, + 70),
		Point(- 60, + 20),
		Point(- 50, - 40),
		Point(- 10, - 70),
		Point(+ 50, - 40)
	])
);

result = false;

world = List([polygon]);