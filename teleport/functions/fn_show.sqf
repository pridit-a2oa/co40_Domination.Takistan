#define THIS_MODULE teleport
#include "x_macros.sqf"
#define __ctrl(vctrl) _ctrl = _XD_display displayCtrl vctrl
#define __ctrl2(ectrl) (_XD_display displayCtrl ectrl)
private ["_ctrl", "_XD_display", "_points", "_unlocked"];

disableSerialization;

createDialog "XD_TeleportDialog";

_XD_display = uiNamespace getVariable "X_TELEPORT_DIALOG";

__ctrl2(1500) lbAdd "Base";

if (!isNil QMODULE(vehicle_mhq)) then {
    {
        if (alive _x) then {
            _name = getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
            _position = _x getVariable QGVAR(position);
            
            if (!isNil QMODULE(marker)) then {
                _name = markerText (str((_position) select 0));
            };
            
            _index = __ctrl2(1500) lbAdd _name;
            __ctrl2(1500) lbSetData [_index, str(_position)];
        };
    } forEach (call FUNC(vehicle_teleport,valid));
};