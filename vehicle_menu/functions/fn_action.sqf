#include "x_macros.sqf"
#define __ctrl(vctrl) _ctrl = _XD_display displayCtrl vctrl
#define __ctrl2(ectrl) (_XD_display displayCtrl ectrl)
private ["_vehicle", "_XD_display", "_selected", "_selection"];

_vehicle = GVAR(vehicle_dialog);

if (!alive _vehicle) exitWith {};

disableSerialization;

_XD_display = uiNamespace getVariable "X_VEHICLE_MENU_DIALOG";

_selected = lbCurSel __ctrl2(1500);
_selection = __ctrl2(1500) lbData _selected;

if (_selected == -1) exitWith {
    closeDialog 0;
};

if (!isNil QMODULE(vehicle_mhq)) then {
    if (_selection == "mhq") then {
        _deployed = _vehicle getVariable QGVAR(deployed);
        
        if (!isNil "_deployed" && {_deployed}) exitWith {
            [_vehicle] call FUNC(vehicle_mhq,undeploy);
        };
        
        [_vehicle] call FUNC(vehicle_mhq,deploy);
    };
};

if (!isNil QMODULE(vehicle_ammobox)) then {
    if (_selection == "ammobox") then {
        _ammobox = _vehicle getVariable QGVAR(ammobox);
        
        if (!isNil "_ammobox" && {_ammobox}) exitWith {
            [_vehicle] call FUNC(vehicle_ammobox,unload);
        };
        
        [_vehicle] call FUNC(vehicle_ammobox,load);
    };
};

if (!isNil QMODULE(vehicle_create)) then {
    if (_selection == "atv") then {
        [_vehicle] call FUNC(vehicle_create,atv);
    };
};

if (!isNil QMODULE(vehicle_teleport)) then {
    if (_selection == "teleport") then {
        closeDialog 0;
        call FUNC(teleport,show);
    };
};