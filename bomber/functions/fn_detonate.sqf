#define THIS_MODULE bomber
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

createVehicle [GVAR(bomber_type_bomb), position _vehicle, [], 0, "CAN_COLLIDE"];

{
    if (isPlayer _x && {[_x] call FUNC(common,ready)}) then {
        if !(isNil QMODULE(revive)) then {
            [_x] call FUNC(revive,unconscious);
        } else {
            _x setDamage 1;
        };
    };
} forEach (nearestObjects [_vehicle, ["CAManBase"], 12]);