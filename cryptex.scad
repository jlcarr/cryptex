// Cryptex Disc Model


// polygonal-based prism defition
module ngonPrism(n, r, h) {
    linear_extrude(height = h, center=true) 
        polygon([
            for (i=[0:n-1], a=i*360/n) 
                [ r*cos(a), r*sin(a) ]
        ]);
}


module cryptexDisc(inner_radius, outer_radius, width, thickness){
    difference(){
        difference(){
            ngonPrism(n, outer_radius, width);
            cylinder(h=width, r=inner_radius, center=true);
        };
        ngonPrism(n, outer_radius-thickness, width-2*thickness);
    }
}




// Main Model
n = 10;

inner_radius = 7;
outer_radius = 10;
width = 5;
thickness = 1;

cryptexDisc(inner_radius, outer_radius, width, thickness);