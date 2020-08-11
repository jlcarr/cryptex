// Cryptex Spindle Model


// Shared geometries
// for polygonal-based prism defition
use <sharedgeometry.scad>


module cryptexSpindle(n, digits, outer_radius, inner_radius, width, thickness){
    ngonPrism(n, outer_radius, width);
    translate([outer_radius,0,0])
        rotate([90,90,90]) 
            ngonPrism(3, width/8, thickness);
    translate([0,0,(digits+1)*width/2]){
        difference(){
            union(){   
                cylinder(h=digits*width, r=inner_radius, center=true);
                for (i=[0:digits-1], h=(i+1/2-digits/2)*width) 
                    translate([inner_radius,0,h]) 
                        cube([2*(outer_radius-inner_radius-thickness), 4*thickness, width-2*thickness], center=true);
            };
            union(){
                cylinder(h=digits*width, r=inner_radius-thickness, center=true);
                translate([inner_radius,0,0]) 
                    cube([2*(outer_radius-inner_radius-thickness), 2*thickness, digits*width], center=true);
            }
        };
    }
}




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