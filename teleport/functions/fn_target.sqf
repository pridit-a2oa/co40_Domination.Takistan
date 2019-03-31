#include "x_macros.sqf"
private ["_selected", "_target", "_button", "_data"];

disableSerialization;

_selected = lbCurSel 1500;
_button = DIALOG("X_TELEPORT_DIALOG", 2000);

switch (_selected) do {
    case 0: {
        _target = position GVAR(flag);
        _button ctrlEnable true;
    };
};

if (!isNil QMODULE(vehicle_mhq)) then {
    _data = DIALOG("X_TELEPORT_DIALOG", 1500) lbData _selected;
    
    {
        if (str(_x getVariable QGVAR(position)) == _data) then {
            _target = position _x;
            
            _deployed = _x getVariable QGVAR(deployed);
            
            if (isNil "_deployed" || {!_deployed}) then {
                _button ctrlEnable false;
            } else {
                _button ctrlEnable true;
            };
        };
    } forEach (call FUNC(vehicle_teleport,valid));
};

_target