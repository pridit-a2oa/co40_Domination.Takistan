#define THIS_MODULE vehicle_uav
#include "x_macros.sqf"
private ["_selected", "_button", "_data", "_target"];

disableSerialization;

_selected = lbCurSel 200;

if ([_selected, -1] call BIS_fnc_areEqual) exitWith {nil};

_data = DIALOG("X_VEHICLE_UAV_DIALOG", 200) lbData _selected;
_button = DIALOG("X_VEHICLE_UAV_DIALOG", 300);

_button ctrlEnable true;

{
    if ([_x getVariable QGVAR(id), _data] call BIS_fnc_areEqual) exitWith {
        _target = _x;

        switch (true) do {
            case ([driver _x, objNull] call BIS_fnc_areEqual);
            case ([gunner _x, objNull] call BIS_fnc_areEqual): {
                _button ctrlSetText "Connect";
            };

            default {
                _button ctrlSetText "Full";
                _button ctrlEnable false;
            };
        }
    };
} forEach (call FUNC(THIS_MODULE,entities));

if (isNil "_target") then {
    _button ctrlEnable false;
};

_target