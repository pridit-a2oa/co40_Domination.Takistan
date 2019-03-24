/**
 * Perk Module - Vehicle Bonus Submodule
 */

 #define THIS_MODULE perk
 #include "x_macros.sqf"
 private ["_vehicle", "_fly"];
 PARAMS_1(_vehicle);

while {true} do {
    waitUntil {!isNull player};
    
    _fly = player getVariable QGVAR(perkFlyAttackAircraft);
    
    if (isNil "_fly" && {player == driver _vehicle}) then {
        player action ["Eject", _vehicle];
        hint "You do not have the required perk to pilot attack aircraft";
        call __function(show);
        
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