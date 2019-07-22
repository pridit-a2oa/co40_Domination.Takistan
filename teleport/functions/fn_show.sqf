#define THIS_MODULE teleport
#include "x_macros.sqf"
private ["_list", "_button", "_name", "_position", "_index", "_vehicle"];

PARAMS_1(_vehicle);

disableSerialization;

createDialog "XD_TeleportDialog";

_list = DIALOG("X_TELEPORT_DIALOG", 1500);
_button = DIALOG("X_TELEPORT_DIALOG", 2000);

_button ctrlEnable false;

if (player distance GVAR(flag) > 10) then {
    _list lbAdd "Base";
};

if (!isNil QMODULE(vehicle_mhq)) then {
    {
        if (alive _x && {_vehicle != _x}) then {
            _id = _x getVariable QGVAR(id);
            _name = [typeOf _x] call FUNC(vehicle,name);
            
            if (!isNil QMODULE(vehicle_marker)) then {
                _name = markerText _id;
            };
            
            _index = _list lbAdd _name;
            _list lbSetData [_index, _id];
        };
    } forEach (call FUNC(vehicle_teleport,valid));
};