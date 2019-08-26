#define THIS_MODULE vehicle_repair
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

GVAR(repairing) = true;

player setVariable [QGVAR(repair_kits), (player getVariable QGVAR(repair_kits)) - 1];
player playMove "AinvPknlMstpSlayWrflDnon_medic";

for "_i" from 1 to 3 do {
    sleep 2;
    
    [true, "say", [player, QGVAR(sound_repair), 20]] call FUNC(network,mp);
    
    if (_i == 3) then {
        if (!canMove _vehicle) then {
            [_vehicle, "setHit", ["NEtrup", 0]] call FUNC(network,mp);
            [_vehicle, "setHit", ["motor", 0]] call FUNC(network,mp);
            [_vehicle, "setHit", ["wheel_1_1_steering", 0]] call FUNC(network,mp);
            [_vehicle, "setHit", ["wheel_1_2_steering", 0]] call FUNC(network,mp);
            [_vehicle, "setHit", ["wheel_2_1_steering", 0]] call FUNC(network,mp);
            [_vehicle, "setHit", ["wheel_2_2_steering", 0]] call FUNC(network,mp);
        };
        
        if (damage _vehicle > 0.3) then {
            [_vehicle, "setDamage", 0.3] call FUNC(network,mp);
        };
        
        if (fuel _vehicle < 0.25) then {
            [_vehicle, "setFuel", 0.25] call FUNC(network,mp);
        };
        
        _full = player getVariable QGVAR(repair_full);

        if (_full) then {
            [_vehicle, "setDamage", 0] call FUNC(network,mp);
            
            if (fuel _vehicle < 0.6) then {
                [_vehicle, "setFuel", 0.6] call FUNC(network,mp);
            };
        };
    };
};

GVAR(repairing) = false;