#include "x_macros.sqf"
private ["_aircraft", "_load"];

_aircraft = GVAR(load) select 0;
_load = GVAR(load) select 1;

_aircraft setVariable [QGVAR(loaded), (_aircraft getVariable QGVAR(loaded)) + [[typeOf _load, _load getVariable QGVAR(position)]], true];

_aircraft animate ["ramp_top", 1];
_aircraft animate ["ramp_bottom", 1];

sleep 3;

_load attachTo [_aircraft, [0, 2, -2]];

{
    if (isPlayer _x) then {
        moveOut _x;
        
        [nil, _x, rMoveIn, _aircraft, "Cargo"] call RE;
    };
} forEach crew _load;

sleep 1;

_aircraft animate ["ramp_top", 0];
_aircraft animate ["ramp_bottom", 0];

sleep 3;

_load setPos [0, 0, 0];
_load setDamage 1;

deleteVehicle _load;