module ngon(num, r) {
  polygon([for (i=[0:num-1], a=i*360/num) [ r*cos(a), r*sin(a) ]]);
}

n = 10;

tol = 0.1;
inner_radius = 7;
outer_radius = 10;
width = 5;
thickness = 1;


difference(){
    difference(){
        linear_extrude(height = width, center=true) 
        ngon(n, outer_radius);
        cylinder(h=width, r=inner_radius, center=true);
    };
    linear_extrude(height = width-2*thickness, center=true)
    ngon(n, outer_radius-thickness);
}
