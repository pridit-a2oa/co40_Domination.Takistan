#include "x_macros.sqf"
private ["_selected", "_button", "_data", "_target"];

disableSerialization;

_selected = lbCurSel 1500;

if ([_selected, -1] call BIS_fnc_areEqual) exitWith {nil};

_button = DIALOG("X_TELEPORT_DIALOG", 2000);
_data = DIALOG("X_TELEPORT_DIALOG", 1500) lbData _selected;

_button ctrlEnable true;

if !([markerPos format ["teleport_%1", _data], [0,0,0]] call BIS_fnc_areEqual) then {
    _target = nearestObject [markerPos format ["teleport_%1", _data], GVAR(teleport_type_object)];
};

if !(isNil QMODULE(vehicle_deploy)) then {
    {
        private ["_deployed"];

        if ([_x getVariable QGVAR(id), _data] call BIS_fnc_areEqual) exitWith {
            _target = _x;

            _deployed = (_x getVariable QGVAR(deployed)) select 0;

            if (isNil "_deployed" || {!_deployed}) then {
                _button ctrlSetText "Not Deployed";
                _button ctrlEnable false;
            };
        };
    } forEach (call FUNC(vehicle_teleport,valid));
};

if (isNil "_target") then {
    _button ctrlEnable false;
};

if (ctrlEnabled _button) then {
    _button ctrlSetText "Go";
};

_target