dynamic[DYNAMIC.X] = mouse_x;
dynamic[DYNAMIC.Y] = mouse_y;

var part = (keyboard_check(vk_shift)) ? DYNAMIC.YSCALE : (keyboard_check(vk_space) ? DYNAMIC.ANGLE : DYNAMIC.XSCALE);

var multiplier = (keyboard_check(vk_space) ? 1 : 0.1);
dynamic[part] += (mouse_wheel_up() - mouse_wheel_down()) * multiplier;

result = collision_test(dynamic, world);


