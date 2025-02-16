include <KeyV2/includes.scad>

$width_difference = 2;
$height_difference = 0;
$dish_type = "spherical";
$key_shape_type = "circular";
$inverted_dish = false;
$stem_inset = -1.5;
$stem_throw = 7;
$dish_depth = 4;
$dish_skew_x = 0;
$dish_skew_y = 0;
$top_skew = 0;
$height_slices = 1;
$stem_support_type = "disable";
$total_depth = 9.3;
$top_tilt = 0;
/*$legends = [
    ["1", [0,-0.7], 3, $font],
    ["!", [1,-0.6], 2, $font],
    ["Q", [0, 0.4], 6, $font]
];*/

//rounded()
resin() rounded_cherry() key();
