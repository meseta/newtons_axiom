var input_x = argument0
var input_y = argument1

var tmp = input_x + 43;
tmp = (tmp * 9821 + 6925) mod 65535
tmp += input_y
tmp = (tmp * 9821 + 6925) mod 100

tmp += ceil(point_distance(0, 0, input_x, input_y)*2);

// special case, starting location
if(input_x == 0 and input_y == 0) {
	tmp = 0;
}


return clamp(tmp, 0, 100);