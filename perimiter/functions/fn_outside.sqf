#define THIS_MODULE perimiter
#include "x_macros.sqf"
private ["_trigger", "_vehicle", "_position", "_remaining", "_handler", "_vehicle"];

PARAMS_1(_trigger);

disableSerialization;

_vehicle = (vehicle player);
_vehicle setVariable [QGVAR(spawn), position _vehicle, true];

sleep 2;

if !(triggerActivated _trigger) exitWith {};

_remaining = [player, 20] call FUNC(3d,time);

3000 cutRsc ["XD_Notice", "PLAIN"];

DIALOG(QGVAR(notice), 1000) ctrlSetStructuredText parseText "<t underline='1'>Out of bounds</t>";
DIALOG(QGVAR(notice), 1001) ctrlSetText "Return to the mission area";

_handler = _vehicle addEventHandler ["getout", {
    if !(isNil QMODULE(vehicle)) then {
        [_this select 0] call FUNC(vehicle,reset);
    };
}];

while {triggerActivated _trigger && {alive player}} do {
    _remaining = [player] call FUNC(3d,time);

    DIALOG(QGVAR(notice), 1002) ctrlSetText format ["%1", [_remaining] call FUNC(common,displayTime)];

    if (_remaining < 0) exitWith {
        if (!isNil QMODULE(vehicle) && {!([player, vehicle player] call BIS_fnc_areEqual)}) then {
            [_vehicle] call FUNC(vehicle,reset);
        };

        player setDamage 1;
    };

    sleep 0.01;
};

_vehicle removeEventHandler ["getout", _handler];

3000 cutText ["", "PLAIN"];