if mouse_check_button(mb_left) && point_distance(x, y, mouse_x, mouse_y) > 3 {
	input_magnitude = 3;
	input_direction = round(point_direction(x, y, mouse_x, mouse_y));
} else {
	input_magnitude = 0;
	input_direction = undefined;
}

var hor = keyboard_check(vk_right) - keyboard_check(vk_left);
var vert = keyboard_check(vk_down) - keyboard_check(vk_up);
if hor !=0 or vert != 0 {
	input_magnitude = 3
	input_direction = round(point_direction(0,0,hor,vert));
}

collide_move(input_magnitude,input_direction,obj_solids,false);