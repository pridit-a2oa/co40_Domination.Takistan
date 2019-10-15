#define THIS_MODULE teleport
#include "x_macros.sqf"
private ["_map", "_target", "_time", "_zoom"];

PARAMS_1(_selected);

disableSerialization;

_target = call FUNC(THIS_MODULE,target);

if (isNil "_target") exitWith {};
if (_selected == GVAR(teleport_selected)) exitWith {
    [GVAR(teleport), true] call FUNC(THIS_MODULE,populate);
};

GVAR(teleport_selected) = _selected;

_map = DIALOG("X_TELEPORT_DIALOG", 1000);

ctrlMapAnimClear _map;

_animations = GVAR(teleport_type_animations);
_time = (_animations select 0) select 0;
_zoom = (_animations select 0) select 1;

if (!isNil QMODULE(vehicle_mhq) && {GVAR(vehicle_mhq_types) find (typeOf _target) != -1}) then {
    [_target, _selected] spawn {
        private ["_target", "_selected"];
        
        PARAMS_2(_target, _selected);
        
        _deployed = _target getVariable QGVAR(deployed);
        
        while {typeName (uiNamespace getVariable "X_TELEPORT_DIALOG") == "DISPLAY"} do {
            if (lbCurSel 1500 != _selected) exitWith {};
            if (isNil "_target") exitWith {};
            if (!alive _target) exitWith {};
            
            if !([_target getVariable QGVAR(deployed), _deployed] call BIS_fnc_areEqual) exitWith {
                [GVAR(teleport), true] call FUNC(THIS_MODULE,populate);
            };
            
            sleep 0.2;
        };
    };
};

_map ctrlMapAnimAdd [
    _time,
    if (ctrlMapScale _map != (_animations select 1) select 1) then {_zoom} else {ctrlMapScale _map},
    position _target
];

ctrlMapAnimCommit _map;

[_map, _animations, _selected] spawn {
    private ["_map", "_animations", "_selected", "_deployed"];
    
    PARAMS_3(_map, _animations, _selected);
    
    _target = call FUNC(THIS_MODULE,target);
    
    if !(_target isKindOf "AllVehicles") exitWith {};
    
    waitUntil {ctrlMapAnimDone _map};
    
    sleep 0.1;
    
    while {typeName (uiNamespace getVariable "X_TELEPORT_DIALOG") == "DISPLAY" && {lbCurSel 1500 == _selected}} do {
        if (lbCurSel 1500 != _selected) exitWith {};
        if (isNil "_target") exitWith {};
        if (!alive _target) exitWith {};
        
        if (!isNil QMODULE(vehicle_marker)) then {
            ctrlMapAnimClear _map;
            
            _marker = [_target] call FUNC(vehicle_marker,valid);
            
            if (!isNil "_marker") then {
                _map ctrlMapAnimAdd [
                    (_animations select 1) select 0,
                    (_animations select 1) select 1,
                    markerPos _marker
                ];
                
                ctrlMapAnimCommit _map;
            };
        };
        
        sleep 0.5;
    };
};

_map ctrlMapAnimAdd [
    (_animations select 1) select 0,
    (_animations select 1) select 1,
    position _target
];

ctrlMapAnimCommit _map;