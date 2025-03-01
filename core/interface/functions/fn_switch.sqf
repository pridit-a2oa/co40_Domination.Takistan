#include "x_macros.sqf"
private ["_module", "_selected", "_target", "_button", "_map", "_animations", "_time", "_zoom"];

PARAMS_2(_module, _selected);

disableSerialization;

_target = call (call compile format ["d_fnc_%1_target", _module]);

if (isNil "_target") exitWith {
    _button = (uiNamespace getVariable format ["X_%1_DIALOG", toUpper _module]) displayCtrl 300;
    _button ctrlSetText "No Selection";
};

_map = (uiNamespace getVariable format ["X_%1_DIALOG", toUpper _module]) displayCtrl 10000;

ctrlMapAnimClear _map;

_animations = [
    [1, 0.07],
    [0.4, 0.04]
];

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

[_module, _map, _animations, _selected] spawn {
    private ["_module", "_map", "_animations", "_selected", "_target"];

    PARAMS_4(_module, _map, _animations, _selected);

    _target = call (call compile format ["d_fnc_%1_target", _module]);

    if (isNil "_target") exitWith {};
    if !(_target isKindOf "AllVehicles") exitWith {};

    waitUntil {sleep 0.1; ctrlMapAnimDone _map};

    sleep 0.1;

    while {call (call compile format ["d_fnc_%1_valid", _module])} do {
        if !([lbCurSel 200, _selected] call BIS_fnc_areEqual) exitWith {};
        if (isNil "_target" || {!alive _target}) exitWith {};

        if !(isNil QMODULE(vehicle_marker)) then {
            private ["_marker"];

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