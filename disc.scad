// Cryptex Disc Model


// polygonal-based prism defition
module ngonPrism(n, r, h) {
    linear_extrude(height = h, center=true) 
        polygon([
            for (i=[0:n-1], a=(i+1/2)*360/n) 
                [ r*cos(a)/cos(180/n), r*sin(a)/cos(180/n) ]
        ]);
}


module cryptexDisc(n, inner_radius, outer_radius, width, thickness){
    difference(){
       difference(){
            difference(){
                ngonPrism(n, outer_radius, width);
                cylinder(h=width, r=inner_radius, center=true);
            };
            ngonPrism(n, outer_radius-thickness, width-2*thickness);
        };
        translate([inner_radius,0,0]) 
            cube([2*(outer_radius-inner_radius-thickness), 4*thickness, width], center=true);
    };
    for (i=[0:n-1], a=i*360/n) 
        rotate([0,0,a])
            translate([outer_radius,0,0])
                rotate([90,90,90]) 
                    linear_extrude(height = thickness/2, center=true) 
                        text(str(i), halign = "center", valign = "center", size=face/2);
}




// Main Model
n = 10;

inner_radius = 7;
outer_radius = 10;
width = 5;
thickness = 1;

face = 2*tan(180/n)*outer_radius;
echo(face);

cryptexDisc(n, inner_radius, outer_radius, width, thickness);