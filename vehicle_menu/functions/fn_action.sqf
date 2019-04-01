#include "x_macros.sqf"
private ["_vehicle", "_menu", "_lbCurSel", "_lbData"];

disableSerialization;

_vehicle = GVAR(vehicle_dialog);

if (!alive _vehicle) exitWith {};

_menu = DIALOG("X_VEHICLE_MENU_DIALOG", 1500);

_lbCurSel = lbCurSel _menu;
_lbData = _menu lbData _lbCurSel;

if (_lbCurSel == -1) exitWith {
    closeDialog 0;
};

if (!isNil QMODULE(vehicle_mhq)) then {
    if (_lbData == "mhq") then {
        _deployed = _vehicle getVariable QGVAR(deployed);
        
        if (!isNil "_deployed" && {_deployed}) exitWith {
            [_vehicle] call FUNC(vehicle_mhq,undeploy);
        };
        
        [_vehicle] call FUNC(vehicle_mhq,deploy);
    };
};

if (!isNil QMODULE(vehicle_ammobox)) then {
    if (_lbData == "ammobox") then {
        _ammobox = _vehicle getVariable QGVAR(ammobox);
        
        if (!isNil "_ammobox" && {_ammobox}) exitWith {
            [_vehicle] call FUNC(vehicle_ammobox,unload);
        };
        
        [_vehicle] call FUNC(vehicle_ammobox,load);
    };
};

if (!isNil QMODULE(vehicle_create)) then {
    if (_lbData == "atv") then {
        [_vehicle] call FUNC(vehicle_create,atv);
    };
};

if (!isNil QMODULE(vehicle_teleport)) then {
    if (_lbData == "teleport") then {
        closeDialog 0;
        [_vehicle] call FUNC(teleport,show);
    };
};