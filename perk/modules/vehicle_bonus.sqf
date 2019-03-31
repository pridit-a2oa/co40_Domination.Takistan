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
        call FUNC(THIS_MODULE,show);
        
        _vehicle addEventHandler ["getout", {
            (_this select 0) spawn {
                if (canMove _this) then {
                    [_this, "motor", 1] call FUNC(network,setHit);
                    sleep 1;
                    [_this, "motor", 0] call FUNC(network,setHit);
                };
    
                _this engineOn false;
            };
        }];
    };
    
    sleep 1;
};