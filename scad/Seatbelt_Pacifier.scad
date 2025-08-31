// seatbelt pacifier
// 2025 Brian K. White - b.kenyon.w@gmail.com

ow = 21.5;
ol = 35;
ot = 3;
or = 3;

io = 6;
iw = 12;
il = ol-io*2;
ir = 1;

e = 0.1;
$fn = 36;

module mirror_copy(v = [1, 0, 0]) {
  children();
  if (v[0]||v[1]||v[2]) mirror(v) children();
}

module qc (w=10,d=10,h=10,r=1) {
  mirror_copy([0,1,0]) translate([0,d/2,0])
    mirror_copy([1,0,0]) translate([w/2,0,0])
      cylinder(h=h,r=(r<e?e:r));
}

module sqylinder(w=10,d=10,h=10,r=1) {
  if (r<=0) translate([-w/2,-d/2,0]) cube([w,d,h]);
  else hull() qc(w=w-r*2,d=d-r*2,h=h,r=r);
}

difference() {
  sqylinder(w=ow,d=ol,h=ot,r=or);
  translate([0,0,-e]) sqylinder(w=iw,d=il,h=ot+e*2,r=ir);
}
