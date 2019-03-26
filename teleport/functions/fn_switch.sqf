#include "x_macros.sqf"
#define __ctrl(vctrl) _ctrl = _XD_display displayCtrl vctrl
#define __ctrl2(ectrl) (_XD_display displayCtrl ectrl)
private ["_selection", "_ctrl", "_XD_display", "_start", "_end", "_map", "_data"];
PARAMS_1(_selection);

disableSerialization;

_XD_display = uiNamespace getVariable "X_TELEPORT_DIALOG";

_start = position player;

switch (_selection) do {
    case 0: {
        _end = position GVAR(flag);
    };
};

if (!isNil QMODULE(vehicle_mhq)) then {
    _data = __ctrl2(1500) lbData _selection;
    
    {
        if (str(_x getVariable QGVAR(position)) == _data) then {
            _end = position _x;
        };
    } forEach (call FUNC(vehicle_teleport,valid));
};

_map = __ctrl2(1000);

ctrlMapAnimClear _map;

_map ctrlMapAnimAdd [0.0, 1.00, _start];
_map ctrlMapAnimAdd [0.2, 1.00, _end];
_map ctrlMapAnimAdd [0.5, 0.01, _end];

ctrlMapAnimCommit _map;