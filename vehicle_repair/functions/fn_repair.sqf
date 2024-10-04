#define THIS_MODULE vehicle_repair
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !([_vehicle] call FUNC(THIS_MODULE,valid)) exitWith {};

GVAR(repairing) = true;

if ([[true, 2, QGVAR(sound_wrench)]] call FUNC(client,stall) && {alive _vehicle}) then {
    if (!isNil QMODULE(inventory_repair) && {[player getVariable QGVAR(inventory_repair), 0] call BIS_fnc_areEqual}) exitWith {};

    [_vehicle, "setDamage", switch (true) do {
        case (player getVariable QGVAR(repair_full));
        case (typeOf _vehicle in ["AH1Z", "Mi24_D_TK_EP1", "MH6J_EP1"]): {
            0
        };

        default {
            ((damage _vehicle) - 0.33) max 0
        };
    }] call FUNC(network,mp);

    switch (true) do {
        case (_vehicle isKindOf "Helicopter"): {
            [_vehicle, "setHit", ["NEtrup", 0]] call FUNC(network,mp);
        };

        case (_vehicle isKindOf "LandVehicle"): {
            {
                [_vehicle, "setHit", [_x, 0]] call FUNC(network,mp);
            } forEach [
                "wheel_1_1_steering",
                "wheel_1_2_steering",
                "wheel_2_1_steering",
                "wheel_2_2_steering"
            ];
        };
    };

    [_vehicle, "setHit", ["motor", 0]] call FUNC(network,mp);

    if (fuel _vehicle < 0.25) then {
        [_vehicle, "setFuel", 0.25] call FUNC(network,mp);
    };

    if !(isNil QMODULE(inventory_repair)) then {
        player setVariable [QGVAR(inventory_repair), (player getVariable QGVAR(inventory_repair)) - 1];
    };
};

GVAR(repairing) = false;