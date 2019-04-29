#define THIS_MODULE vehicle_service
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

player playMove "AinvPknlMstpSlayWrflDnon_medic";

for "_i" from 1 to 3 do {
    sleep 2;
    [nil, player, rSay, QGVAR(sound_repair), 20] call RE;
    
    if (_i == 3) then {
        if (!canMove _vehicle) then {
            [_vehicle, "motor", 0] call FUNC(network,setHit);
            [_vehicle, "wheel_1_1_steering", 0] call FUNC(network,setHit);
            [_vehicle, "wheel_1_2_steering", 0] call FUNC(network,setHit);
            [_vehicle, "wheel_2_1_steering", 0] call FUNC(network,setHit);
            [_vehicle, "wheel_2_2_steering", 0] call FUNC(network,setHit);
        };
        
        if (damage _vehicle > 0.5) then {
            [_vehicle, 0.5] call FUNC(network,setDamage);
        };
        
        if (fuel _vehicle < 0.25) then {
            [_vehicle, 0.25] call FUNC(network,setFuel);
        };
        
        if (!isNil QMODULE(perk)) then {
            _perk = player getVariable QGVAR(repair_full);

            if (!isNil "_perk") then {
                [_vehicle, 0] call FUNC(network,setDamage);
                
                if (fuel _vehicle < 0.6) then {
                    [_vehicle, 0.6] call FUNC(network,setFuel);
                };
            };
            
            player setVariable [QGVAR(repair_kits), (player getVariable QGVAR(repair_kits)) - 1];
        };
    };
};

