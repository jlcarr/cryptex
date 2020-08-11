// Cryptex Shaft Model


// Shared geometries
// for polygonal-based prism defition
use <sharedgeometry.scad>


module cryptexShaft(n, digits, inner_radius, width, thickness, clearance){
    // bBase
    ngonPrism(n, outer_radius, width);
    // Alignment Indicator
    translate([outer_radius,0,0])
        rotate([90,90,90]) 
            ngonPrism(3, width/8, thickness);
    // Shaft
    translate([0,0,(digits+1)*width/2]){
        difference(){
            union(){
                // Body
                cylinder(h=digits*width, r=inner_radius-thickness-clearance, center=true);
                // Nodes
                for (i=[0:digits-1], h=(i+1/2-digits/2)*width) 
                    translate([inner_radius,0,h]) 
                        cube([2*(outer_radius-inner_radius-thickness-clearance), 2*thickness-clearance, width-2*(thickness+clearance)], center=true);
            };
            // Hollow center
            cylinder(h=digits*width, r=inner_radius-2*thickness-clearance, center=true);
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

clearance = 0.25;

face = 2*tan(180/n)*outer_radius;
echo(face);

cryptexShaft(n, digits, inner_radius, width, thickness, clearance);