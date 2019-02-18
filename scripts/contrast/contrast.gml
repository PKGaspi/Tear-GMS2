/// @desc contrast between two colors.
/// @arg0 color_background
/// @arg1 color_foreground

var c;
c[0, 0] = color_get_red(argument0);
c[0, 1] = color_get_green(argument0);
c[0, 2] = color_get_blue(argument0);
c[1, 0] = color_get_red(argument1);
c[1, 1] = color_get_green(argument1);
c[1, 2] = color_get_blue(argument1);

var j = 0;
repeat(2) {
	var i = 0;
	repeat(3) {
		c[j, i] /= 255;
		if (c[j, i] <= 0.03928) {
			c[j, i] /= 12.92;	
		}
		else {
			c[j, i] = power((c[j, i] + 0.055) / 1.055, 2.4 );
		}
		i++;
	}
	c[j, 0] *= 0.2126;
	c[j, 1] *= 0.7152;
	c[j, 2] *= 0.0722;
	j++;
}

var c0 = c[0, 0] + c[0, 1] + c[0, 2] + 0.05;
var c1 = c[1, 0] + c[1, 1] + c[1, 2] + 0.05;
return max(c0, c1) / min(c0, c1);