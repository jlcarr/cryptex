// Cryptex Disc Model


// Parts
use <disc.scad>
use <spindle.scad>
use <shaft.scad>



// Main Model
n = 10;
digits_list = [2,7,1,8];

inner_radius = 7;
outer_radius = 10;
width = 5;
thickness = 1;

clearance = 0.25;

digits = len(digits_list);
face = 2*tan(180/n)*outer_radius;
echo(face);

translate([3*outer_radius,0,width/2])
    cryptexSpindle(n, digits, outer_radius, inner_radius, width, thickness, clearance);

translate([-3*outer_radius,0,width/2]) 
    cryptexShaft(n, digits, outer_radius, inner_radius, width, thickness, clearance);

for (i=[0:digits-1]) 
    translate([0,3*outer_radius*(i-digits/2),width/2]) 
        cryptexDisc(n, digits_list[i], inner_radius, outer_radius, width, thickness,clearance);