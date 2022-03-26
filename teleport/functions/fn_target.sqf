#include "x_macros.sqf"
private ["_target", "_selected", "_button", "_data", "_deployed"];

disableSerialization;

_selected = lbCurSel 1500;

if (_selected == -1) exitWith {nil};

_button = DIALOG("X_TELEPORT_DIALOG", 2000);
_button ctrlEnable true;

_data = DIALOG("X_TELEPORT_DIALOG", 1500) lbData _selected;

if (str (markerPos format ["teleport_%1", _data]) != "[0,0,0]") then {
    _target = nearestObject [markerPos format ["teleport_%1", _data], "FlagCarrierUSA_EP1"];
};

if (!isNil QMODULE(vehicle_deploy)) then {
    {
        if (_x getVariable QGVAR(id) == _data) exitWith {
            _target = _x;
            
            _deployed = (_x getVariable QGVAR(deployed)) select 0;
            
            if (isNil "_deployed" || {!_deployed}) then {
                _button ctrlSetText "Not Deployed";
                _button ctrlEnable false;
            };
        };
    } forEach (call FUNC(vehicle_teleport,valid));
};

if (ctrlEnabled _button) then {
    _button ctrlSetText "Go";
};

_target