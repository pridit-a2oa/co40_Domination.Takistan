#define THIS_MODULE perimiter
#include "x_macros.sqf"
private ["_trigger", "_remaining", "_vehicle"];

PARAMS_1(_trigger);

disableSerialization;

_remaining = [player, 20] call FUNC(3d,time);

3000 cutRsc ["XD_Notice", "PLAIN"];

DIALOG(QGVAR(notice), 1000) ctrlSetText "Outside of playable area";
DIALOG(QGVAR(notice), 1001) ctrlSetText "Return towards the center of the map or you will be killed";

_handler = (vehicle player) addEventHandler ["getout", {
    private ["_vehicle"];
    
    PARAMS_1(_vehicle);
    
    if (!isNil QMODULE(vehicle)) then {
        [_vehicle] __submodulePP(vehicle);
    };
}];

if (!isNil QMODULE(vehicle_lift)) then {
    [(vehicle player)] __submodulePP(vehicle_lift);
};

while {triggerActivated _trigger && {alive player}} do {
    _remaining = [player] call FUNC(3d,time);
    
    DIALOG(QGVAR(notice), 1002) ctrlSetText format ["%1", [_remaining] call FUNC(common,displayTime)];
    
    if (_remaining < 0) exitWith {
        _vehicle = vehicle player;
        
        player setDamage 1;
        
        if (_vehicle != player && {alive _vehicle}) then {
            if (!isNil QMODULE(vehicle)) then {
                [_vehicle] __submodulePP(vehicle);
            };
        };
    };
    
    sleep 0.01;
};

(vehicle player) removeEventHandler ["getout", _handler];

3000 cutRsc ["Default", "PLAIN"];