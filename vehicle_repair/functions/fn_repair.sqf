#define THIS_MODULE vehicle_repair
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

GVAR(repairing) = true;

if !(isNil QMODULE(inventory_repair)) then {
    player setVariable [QGVAR(repair_kits), (player getVariable QGVAR(repair_kits)) - 1];
};

player playMove "AinvPknlMstpSlayWrflDnon_medic";

sleep 2;

if (alive player) then {
    [true, "switchMove", [player, "AinvPknlMstpSlayWrflDnon_medic"]] call FUNC(network,mp);
};

for "_i" from 1 to 3 do {
    if (!alive player) exitWith {};

    [true, "say3D", [player, QGVAR(sound_repair), 20]] call FUNC(network,mp);

    sleep 2;

    if (!alive _vehicle) exitWith {};
    
    if (_i == 3) then {
        switch (true) do {
            case (player getVariable QGVAR(repair_full)): {
                [_vehicle, "setDamage", 0] call FUNC(network,mp);
            };

            case (typeOf _vehicle in ["AH1Z", "Mi24_D_TK_EP1", "MH6J_EP1"]): {
                [_vehicle, "setDamage", 0] call FUNC(network,mp);
            };

            case ((damage _vehicle) <= 0.33): {
                [_vehicle, "setDamage", 0] call FUNC(network,mp);
            };

            default {
                [_vehicle, "setDamage", (damage _vehicle) - 0.33] call FUNC(network,mp);
            };
        };
        
        [_vehicle, "setHit", ["motor", 0]] call FUNC(network,mp);

        if (_vehicle isKindOf "Helicopter") then {
            [_vehicle, "setHit", ["NEtrup", 0]] call FUNC(network,mp);
        };
        
        if (_vehicle isKindOf "LandVehicle") then {
            [_vehicle, "setHit", ["wheel_1_1_steering", 0]] call FUNC(network,mp);
            [_vehicle, "setHit", ["wheel_1_2_steering", 0]] call FUNC(network,mp);
            [_vehicle, "setHit", ["wheel_2_1_steering", 0]] call FUNC(network,mp);
            [_vehicle, "setHit", ["wheel_2_2_steering", 0]] call FUNC(network,mp);
        };
        
        if (fuel _vehicle < 0.25) then {
            [_vehicle, "setFuel", 0.25] call FUNC(network,mp);
        };
    };
};

GVAR(repairing) = false;