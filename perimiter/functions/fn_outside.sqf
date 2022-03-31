#define THIS_MODULE perimiter
#include "x_macros.sqf"
private ["_trigger", "_vehicle", "_position", "_remaining", "_handler", "_vehicle"];

PARAMS_1(_trigger);

disableSerialization;

_vehicle = (vehicle player);
_vehicle setVariable [QGVAR(spawn), position _vehicle, true];

_remaining = [player, 20] call FUNC(3d,time);

3000 cutRsc ["XD_Notice", "PLAIN"];

DIALOG(QGVAR(notice), 1000) ctrlSetText "Out of bounds";
DIALOG(QGVAR(notice), 1001) ctrlSetText "Return towards the center of the map";

_handler = _vehicle addEventHandler ["getout", {
    private ["_vehicle"];
    
    PARAMS_1(_vehicle);
    
    if (!isNil QMODULE(vehicle)) then {
        [_vehicle] __submodulePP(vehicle);
    };
}];

if (!isNil QMODULE(vehicle_lift)) then {
    [_vehicle] __submodulePP(vehicle_lift);
};

while {triggerActivated _trigger && {alive player}} do {
    _remaining = [player] call FUNC(3d,time);
    
    DIALOG(QGVAR(notice), 1002) ctrlSetText format ["%1", [_remaining] call FUNC(common,displayTime)];
    
    if (_remaining < 0) exitWith {
        player setDamage 1;
        
        if (_vehicle != player && {alive _vehicle}) then {
            if (!isNil QMODULE(vehicle)) then {
                [_vehicle] __submodulePP(vehicle);
            };
        };
    };
    
    sleep 0.01;
};

_vehicle removeEventHandler ["getout", _handler];

3000 cutRsc ["Default", "PLAIN"];