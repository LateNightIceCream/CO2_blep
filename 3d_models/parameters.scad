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

COM_FN  = 60;

BASE_W  = 50;
BASE_H  = 1.618 * BASE_W;
BASE_WT = 1;

SCREW_TYPE   = "M3";
SCREW_LENGTH = 12; // 16

// component constants

BAT_D = 40;
BAT_H = 6.5;

PCB_W = BASE_W - BASE_WT - 0.5;
echo(str("PCB_W is ", PCB_W));
PCB_H = 1.5;