/// color_change_endianness(val)
/// @desc Converts a color from RGB to the little endian BGR and vice versa.
/// @arg0 val The value of the color to change.
var rgb = argument[0],
    bgr = 0,   //Output
    bsh = $10; //Number of bits to shift

bgr = (rgb & $FF) << bsh;      //Blue
bgr += (rgb & $FF00);          //Green
bgr += (rgb & $FF0000) >> bsh; //Red

return bgr;