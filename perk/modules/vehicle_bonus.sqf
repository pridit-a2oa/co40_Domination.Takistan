/**
 * Perk Module - Vehicle Bonus Submodule
 */

#define THIS_MODULE perk
#include "x_macros.sqf"
private ["_vehicle", "_fly"];

PARAMS_1(_vehicle);

while {true} do {
    waitUntil {sleep 0.1; !isNull player};
    
    _fly = player getVariable QGVAR(pilot);
    
    if (!_fly && {[player, driver _vehicle] call BIS_fnc_areEqual}) then {
        player action ["Eject", _vehicle];
        
        hint "You do not have the required perk to pilot attack aircraft";
        
        if (player getVariable QGVAR(perk_points) > 0) then {
            call FUNC(THIS_MODULE,show);
        };
        
        _vehicle addEventHandler ["getout", {
            if (player getVariable QGVAR(pilot)) exitWith {};
            
            (_this select 0) spawn {
                if (canMove _this) then {
                    [_this, "setHit", ["motor", 1]] call FUNC(network,mp);
                    
                    sleep 1;
                    
                    [_this, "setHit", ["motor", 0]] call FUNC(network,mp);
                };
    
                _this engineOn false;
            };
        }];
    };
    
    sleep 1;
};