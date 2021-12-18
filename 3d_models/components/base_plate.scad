// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

include <../lib/nutsnbolts/cyl_head_bolt.scad>;
include <../lib/nutsnbolts/materials.scad>;
include <../lib/nutsnbolts/data-access.scad>;
include <../lib/nutsnbolts/data-metric_cyl_head_bolts.scad>;
include <../parameters.scad>;

module base_plate () {

wt  = 5;
tol = 0.05;

top_part();
bottom_part();
nutcatches(container_w = PCB_W);

wi = BASE_W + BASE_WT;
w  = wi + wt;

module top_part() {

    h = 0.382 * w;

    translate([0,0,h/2])
    difference() {

        cube([w,w,h], center = true);

        color([1,0,0])
        cube([wi + tol, wi + tol,h+tol], center = true);
    }

}


module bottom_part() {

    hb = 1.5;

    color([1,1,1])
    translate([0,0,-hb/2])
    difference() {
        cube([w,w,hb], center=true);
        bat_cutout();
    }

    module bat_cutout () {
        translate([0,0, -hb/1.9])
        cylinder(d = BAT_D, h = hb*2.1, $fn = COM_FN);
    }

}


module nutcatches (container_w = 40) {

    df = _get_fam(SCREW_TYPE);

    wn = df[_NB_F_NUT_KEY];
    hn = df[_NB_F_NUT_HEIGHT];

    wt = 0.237 * wn;
    w  = wn + wt * 2;
    h  = max(SCREW_LENGTH - PCB_H, BAT_H);

    for (i = [-1, 1]){
        for (k = [-1, 1]){
            translate([i * container_w/2 - i * w/2, k * container_w/2 - k * w/2, 0])
            rotate([0,0, atan2(k,i) + 135])
            rotate([0,0,0])
            nutcatch();
        }
    }

    module nutcatch () {

        $fn = COM_FN;

        difference() {
            translate([0,0, h/2])
            cube([w, w, h], center = true);

            hh = df[_NB_F_HEAD_HEIGHT];
            color([1,1,1])
            translate([0,0, h])
            hole_through(name=SCREW_TYPE, l=h, cld=0.5, hcld=0.2);

            translate([0,0, hn])
            translate([0,0, 0.3])
            rotate([0,0,45])
            nutcatch_sidecut(SCREW_TYPE, l=100, clk=0.1, clh=0.3, clsl=0.2);
        }
    }

}

}
