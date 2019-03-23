/**
 * Vehicle Bonus Module - Perk Submodule
 */

#define THIS_MODULE vehicle_bonus
#include "x_macros.sqf"
private ["_vehicle", "_fly"];
PARAMS_1(_vehicle);

if (GVAR(bonus_vehicles) find (typeOf _vehicle) == -1) exitWith {};

while {true} do {
    waitUntil {!isNull player};
    
    _fly = player getVariable QGVAR(perkFlyAttackAircraft);
    
    if (isNil "_fly" && {player == driver _vehicle}) then {
        player action ["Eject", _vehicle];
        hint "You do not have the required perk to pilot attack aircraft";
        call FUNC(perk,show);
        
        _vehicle addEventHandler ["getout", {
            (_this select 0) spawn {
                if (canMove _this) then {
                    _this setHit ["motor", 1];
                    sleep 1;
                    _this setHit ["motor", 0];
                };
    
                _this engineOn false;
            };
        }];
    };
    
    sleep 1;
};

