#define THIS_MODULE teleport
#include "x_macros.sqf"
private ["_map", "_target", "_time", "_zoom"];

disableSerialization;

_map = DIALOG("X_TELEPORT_DIALOG", 1000);

ctrlMapAnimClear _map;

_target = call FUNC(THIS_MODULE,target);

if (isNil "_target") exitWith {};

_animations = GVAR(teleport_type_animations);

_time = (_animations select 0) select 0;
_zoom = (_animations select 0) select 1;

_map ctrlMapAnimAdd [
    _time,
    if (ctrlMapScale _map != (_animations select 1) select 1) then {_zoom} else {ctrlMapScale _map},
    position _target
];

ctrlMapAnimCommit _map;
    
[_map, _animations] spawn {
    private ["_map", "_animations", "_selected", "_deployed"];
    
    PARAMS_2(_map, _animations);
    
    _target = call FUNC(THIS_MODULE,target);
    
    _selected = lbCurSel 1500;
    
    waitUntil {ctrlMapAnimDone _map};
    
    sleep 0.1;
    
    if (!isNil QMODULE(vehicle_mhq)) then {
        _deployed = _target getVariable QGVAR(deployed);
    };
    
    while {typeName (uiNamespace getVariable "X_TELEPORT_DIALOG") == "DISPLAY" && {lbCurSel 1500 == _selected}} do {
        _selected = lbCurSel 1500;
        
        if (_selected == -1) exitWith {};
        if (isNil "_target") exitWith {};
        if (!alive _target) exitWith {};
        
        if (!isNil QMODULE(vehicle_mhq) && {!([_target getVariable QGVAR(deployed), _deployed] call BIS_fnc_areEqual)}) exitWith {
            sleep 0.1;
            
            [GVAR(teleport), true] call FUNC(THIS_MODULE,populate);
        };
        
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