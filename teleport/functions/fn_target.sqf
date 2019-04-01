#include "x_macros.sqf"
private ["_target", "_selected", "_button", "_data", "_deployed"];

disableSerialization;

_selected = lbCurSel 1500;
_button = DIALOG("X_TELEPORT_DIALOG", 2000);

_button ctrlEnable true;

switch (_selected) do {
    case 0: {
        _target = GVAR(flag);
    };
};

if (!isNil QMODULE(vehicle_mhq)) then {
    _data = DIALOG("X_TELEPORT_DIALOG", 1500) lbData _selected;
    
    {
        if (str(_x getVariable QGVAR(position)) == _data) then {
            _target = _x;
            
            _deployed = _x getVariable QGVAR(deployed);
            
            if (isNil "_deployed" || {!_deployed}) then {
                _button ctrlEnable false;
            };
        };
    } forEach (call FUNC(vehicle_teleport,valid));
};

_target = [
    getDir _target,
    _target modelToWorld [0,-6,0],
    position _target
];

_target