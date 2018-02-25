var input_x = argument0
var input_y = argument1

var tmp = input_x + 6;
tmp = (tmp * 9821 + 6925) mod 65535
tmp += input_y
tmp = (tmp * 9821 + 6925) mod 100

// special case, starting location
if(abs(input_x) < 2 and abs(input_y) < 2) {
	tmp = 15;
}

return tmp;