#define THIS_MODULE vehicle_bomber
#include "x_macros.sqf"
private ["_vehicle", "_units"];

PARAMS_1(_vehicle);

_units = [];

createVehicle [GVAR(vehicle_bomber_type_bomb), position _vehicle, [], 0, "CAN_COLLIDE"];

{
    switch (true) do {
        case (_x isKindOf "CAManBase"): {
            if (isPlayer _x) then {
                [_units, _x] call BIS_fnc_arrayPush;
            };
        };

        case (_x isKindOf "Air");
        case (_x isKindOf "LandVehicle"): {
            {
                if (isPlayer _x) then {
                    [_units, _x] call BIS_fnc_arrayPush;
                };
            } forEach (crew _x);
        };
    };
} forEach (nearestObjects [_vehicle, ["AllVehicles"], 12]);

{
    if !(isNil QMODULE(revive)) then {
        [_x, "execVM", [[_x], FUNCTION(revive,unconscious)]] call FUNC(network,mp);
    } else {
        _x setDamage 1;
    };
} forEach _units;