#include "x_macros.sqf"
private ["_vehicle", "_menu", "_lbCurSel", "_lbData"];

disableSerialization;

_vehicle = GVAR(vehicle_dialog);

if (!alive _vehicle) exitWith {};

_menu = DIALOG("X_VEHICLE_MENU_DIALOG", 1500);

_lbCurSel = lbCurSel _menu;
_lbData = _menu lbData _lbCurSel;

if (_lbCurSel == -1 || {player distance _vehicle > 10}) exitWith {
    closeDialog 0;
};

if (!isNil QMODULE(vehicle_deploy)) then {
    if (_lbData in ["fob", "mhq"]) then {
        _deployed = (_vehicle getVariable QGVAR(deployed)) select 0;
        
        if (!isNil "_deployed" && {_deployed}) exitWith {
            [_vehicle, _lbData, false] call FUNC(vehicle_deploy,deploy);
        };
        
        [_vehicle, _lbData, true] call FUNC(vehicle_deploy,deploy);
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

if (!isNil QMODULE(vehicle_pack)) then {
    if (_lbData == "pack" && {!isEngineOn _vehicle}) then {        
        _packed = _vehicle getVariable QGVAR(packed);
        
        if (!isNil "_packed" && {_packed}) exitWith {
            [_vehicle, 0] call FUNC(vehicle_pack,fold);
        };
        
        [_vehicle, 1] call FUNC(vehicle_pack,fold);
    };
};

if (!isNil QMODULE(vehicle_create) && {_lbData isKindOf "AllVehicles"}) exitWith {
    [_vehicle, _lbData] call FUNC(vehicle_create,spawn);
};

if (!isNil QMODULE(vehicle_teleport) && {_lbData == "teleport"}) exitWith {
    closeDialog 0;
    
    [_vehicle] call FUNC(teleport,show);
};

closeDialog 0;

[_vehicle] call FUNC(vehicle_menu,show);