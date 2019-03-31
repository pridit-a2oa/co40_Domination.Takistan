#define THIS_MODULE teleport
#include "x_macros.sqf"
private ["_list", "_name", "_position", "_index"];

disableSerialization;

createDialog "XD_TeleportDialog";

_list = DIALOG("X_TELEPORT_DIALOG", 1500);

_list lbAdd "Base";

if (!isNil QMODULE(vehicle_mhq)) then {
    {
        if (alive _x) then {
            _name = getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
            _position = _x getVariable QGVAR(position);
            
            if (!isNil QMODULE(marker)) then {
                _name = markerText (str((_position) select 0));
            };
            
            _index = _list lbAdd _name;
            _list lbSetData [_index, str(_position)];
        };
    } forEach (call FUNC(vehicle_teleport,valid));
};