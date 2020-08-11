// Cryptex Shared Geometries


// polygonal-based prism defition
module ngonPrism(n, r, h) {
    linear_extrude(height = h, center=true) 
        polygon([
            for (i=[0:n-1], a=(i+1/2)*360/n) 
                [ r*cos(a)/cos(180/n), r*sin(a)/cos(180/n) ]
        ]);
}