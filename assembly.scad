// Cryptex Disc Model


// Parts
use <disc.scad>
use <spindle.scad>




// Main Model
n = 10;
digits = 4;

inner_radius = 7;
outer_radius = 10;
width = 5;
thickness = 1;

face = 2*tan(180/n)*outer_radius;
echo(face);

cryptexSpindle(n, digits, outer_radius, inner_radius, width, thickness);
cryptexDisc(n, 0, inner_radius, outer_radius, width, thickness);