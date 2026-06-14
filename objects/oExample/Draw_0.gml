draw_text(0, 0, result);

draw_line(lineA[LINE.X1], lineA[LINE.Y1], lineA[LINE.X2], lineA[LINE.Y2]);
draw_line(lineB[LINE.X1], lineB[LINE.Y1], lineB[LINE.X2], lineB[LINE.Y2]);

if (result[0]) draw_circle(result[1], result[2], 32, true);	