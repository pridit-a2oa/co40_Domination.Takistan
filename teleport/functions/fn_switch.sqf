#define THIS_MODULE teleport
#include "x_macros.sqf"
private ["_selected", "_target", "_button", "_map", "_animations", "_time", "_zoom"];

PARAMS_1(_selected);

disableSerialization;

_target = call FUNC(THIS_MODULE,target);

if (isNil "_target") exitWith {
    _button = DIALOG("X_TELEPORT_DIALOG", 2000);
    _button ctrlSetText "No Selection";
};

_map = DIALOG("X_TELEPORT_DIALOG", 10000);

ctrlMapAnimClear _map;

_animations = GVAR(teleport_type_animations);
_time = (_animations select 0) select 0;
_zoom = (_animations select 0) select 1;

_map ctrlMapAnimAdd [
    _time,
    if !([ctrlMapScale _map, (_animations select 1) select 1] call BIS_fnc_areEqual) then {
        _zoom
    } else {
        ctrlMapScale _map
    },
    position _target
];

ctrlMapAnimCommit _map;

[_map, _animations, _selected] spawn {
    private ["_map", "_animations", "_selected", "_target"];

    PARAMS_3(_map, _animations, _selected);

    _target = call FUNC(THIS_MODULE,target);

    if (isNil "_target") exitWith {};
    if !(_target isKindOf "AllVehicles") exitWith {};

    waitUntil {sleep 0.1; ctrlMapAnimDone _map};

    sleep 0.1;

    while {call FUNC(THIS_MODULE,valid)} do {
        if !([lbCurSel 1500, _selected] call BIS_fnc_areEqual) exitWith {};
        if (isNil "_target") exitWith {};
        if !(alive _target) exitWith {};

        if (!isNil QMODULE(vehicle_marker)) then {
            ctrlMapAnimClear _map;

            _marker = [_target] call FUNC(vehicle_marker,valid);

            if !(isNil "_marker") then {
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