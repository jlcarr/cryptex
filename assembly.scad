// Cryptex Disc Model


// Parts
use <disc.scad>
use <spindle.scad>
use <shaft.scad>



// Main Model
n = 10;
digits = 4;

inner_radius = 15;
outer_radius = 20;
width = 10;
thickness = 2;

clearance = 0.5;

face = 2*tan(180/n)*outer_radius;
echo(face);

mirror([0,0,1])
    cryptexSpindle(n, digits, outer_radius, inner_radius, width, thickness, clearance);

translate([0,0,-(1+digits)*width]) cryptexShaft(n, digits, outer_radius, inner_radius, width, thickness, clearance);

for (i=[0:digits-1]) 
    translate([0,0,-(i+1)*width]) 
        cryptexDisc(n, 0, inner_radius, outer_radius, width, thickness,clearance);