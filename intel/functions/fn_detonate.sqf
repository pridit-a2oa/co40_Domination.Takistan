#define THIS_MODULE intel
#include "x_macros.sqf"
private ["_vehicle", "_explosive"];

PARAMS_1(_vehicle);

_explosive = createVehicle [GVAR(intel_type_bomb), position _vehicle, [], 0, "CAN_COLLIDE"];

{
    if (isPlayer _x) then {
        if (!isNil QMODULE(revive)) then {
            [_x] call FUNC(revive,unconscious);
        } else {
            _x setDamage 1;
        };
    };
} forEach (nearestObjects [_vehicle, ["CAManBase"], 12]);