// Cryptex Disc Model


// Shared geometries
// for polygonal-based prism defition
use <sharedgeometry.scad>


module cryptexDisc(n, val, inner_radius, outer_radius, width, thickness, clearance){
    face = 2*tan(180/n)*outer_radius;
    difference(){
       difference(){
            difference(){
                // Main Body
                ngonPrism(n, outer_radius, width-clearance);
                // Shaft Hole
                cylinder(h=width, r=inner_radius+clearance, center=true);
            };
            // Teeth Interior Hollow
            ngonPrism(n, outer_radius-thickness, width-2*thickness);
        };
        // Notch
        rotate([0,0,val*360/n])
            translate([inner_radius,0,0]) 
                cube([2*(outer_radius-inner_radius-thickness), face-thickness, width], center=true);
    };
    // Numbers
    for (i=[0:n-1], a=i*360/n) 
        rotate([0,0,a])
            translate([outer_radius,0,0])
                rotate([90,90,90]) 
                    linear_extrude(height = thickness/2, center=true) 
                        text(str(i), halign = "center", valign = "center", size=face/2);
}




// Main Model
n = 10;
val = 0;

inner_radius = 15;
outer_radius = 20;
width = 10;
thickness = 2;

clearance = 0.5;

//face = 2*tan(180/n)*outer_radius;
//echo(face);

cryptexDisc(n, val, inner_radius, outer_radius, width, thickness, clearance);