#define THIS_MODULE vehicle_service
#include "x_macros.sqf"
private ["_vehicle"];
PARAMS_1(_vehicle);

player playMove "AinvPknlMstpSlayWrflDnon_medic";

for "_i" from 1 to 3 do {
    sleep 2;
    [nil, player, rSAY, QGVAR(sound_repair), 20] call RE;
    
    if (_i == 3) then {
        if (!canMove _vehicle) then {
            _vehicle setHit ["motor", 0];
            _vehicle setHit ["wheel_1_1_steering", 0];
            _vehicle setHit ["wheel_1_2_steering", 0];
            _vehicle setHit ["wheel_2_1_steering", 0];
            _vehicle setHit ["wheel_2_2_steering", 0];
        };
        
        if (damage _vehicle > 0.5) then {
            _vehicle setDamage 0.5;
        };
        
        if (fuel _vehicle < 0.25) then {
            _vehicle setFuel 0.25;
        };
        
        if (!isNil QMODULE(perk)) then {
            _perk = player getVariable QGVAR(perkFullRepair);

            if (!isNil "_perk") then {
                _vehicle setDamage 0;
                
                if (fuel _vehicle < 0.6) then {
                    _vehicle setFuel 0.6;
                };
            };
        };
        
        player setVariable [QGVAR(perkRepairKits), (player getVariable QGVAR(perkRepairKits)) - 1];
    };
};

