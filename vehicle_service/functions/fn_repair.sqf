#define THIS_MODULE vehicle_service
#include "x_macros.sqf"
private ["_vehicle"];
PARAMS_1(_vehicle);

player playMove "AinvPknlMstpSlayWrflDnon_medic";

for "_i" from 1 to 3 do {
    sleep 2;
    player say [QGVAR(sound_repair), 20];
    
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
            [_vehicle] __submodule(perk);
        };
        
        player setVariable [QGVAR(perkRepairKits), (player getVariable QGVAR(perkRepairKits)) - 1];
    };
};

