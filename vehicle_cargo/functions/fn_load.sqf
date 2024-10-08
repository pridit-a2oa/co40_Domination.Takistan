#include "x_macros.sqf"
private ["_aircraft", "_load"];

GVAR(loading) = true;

_aircraft = GVAR(load) select 0;
_load = GVAR(load) select 1;

_loaded = _aircraft getVariable QGVAR(loaded);

sleep 1;

_load attachTo [_aircraft, [_load] call FUNC(common,attachPoint)];

sleep 1;

{
    if (isPlayer _x) then {
        moveOut _x;

        [_x, "moveInCargo", _aircraft] call FUNC(network,mp);
    };
} forEach crew _load;

_aircraft animate ["ramp_top", 0];
_aircraft animate ["ramp_bottom", 0];

sleep 3;

{
    if (isNil {_x select 0}) exitWith {
        _loaded set [
            _forEachIndex,
            [typeOf _load, _load getVariable QGVAR(position), _load getVariable QGVAR(direction)]
        ];

        _aircraft setVariable [QGVAR(loaded), _loaded, true];
    };
} forEach _loaded;

_load setPos [0, 0, 0];
_load setDamage 1;

deleteVehicle _load;