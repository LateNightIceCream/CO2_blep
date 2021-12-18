// Norm Nuts and Bolts - a OpenSCAD library
// Copyright (C) 2012  Johannes Kneer

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

include <../parameters.scad>;


module base_body () {

wi = BASE_W;
hi = BASE_H;

wt = BASE_WT;

ow = wi + wt;
oh = BASE_H + wt;

difference() {
    
    translate([0, 0, wt/2 + 0.001])
    cube([ow, ow, oh], center = true);

    cube([wi, wi, hi], center=true);

    test_hole();
}


module test_hole() {
    color([0,1,1])
    translate([0,0,BASE_W/2])
    cube([BASE_W*0.9,BASE_W*0.9,10], center=true);
}

}
