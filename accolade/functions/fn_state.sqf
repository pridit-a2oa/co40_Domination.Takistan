#define THIS_MODULE accolade
#include "x_macros.sqf"
private ["_task", "_proficiency", "_entry", "_tracked", "_target", "_current", "_state"];

PARAMS_3(_task, _proficiency, _entry);

if ([_entry, _proficiency] call BIS_fnc_areEqual) then {
    _tracked = [_this, 3, []] call FUNC(common,param);
};

_state = [];

[
    _state,
    switch (true) do {
        case ([_task select 0, 1] call BIS_fnc_areEqual && {[_entry, _proficiency] call BIS_fnc_areEqual}): {
            if ([_tracked, []] call BIS_fnc_areEqual) then {
                [
                    "Complete",
                    "ca\ui\data\ui_task_assigned_ca",
                    [_task select 1, 1] call BIS_fnc_areEqual
                ]
            } else {
                [
                    if ((_tracked select 1) >= (_tracked select 0)) then {
                        "Complete"
                    } else {
                        format [
                            "%1/%2",
                            (_tracked select 1) min (_tracked select 0),
                            _tracked select 0
                        ]
                    },
                    "ca\ui\data\ui_task_assigned_ca",
                    (_tracked select 1) >= (_tracked select 0)
                ]
            }
        };

        case ([_task select 0, 2] call BIS_fnc_areEqual && {[_task select 1, 1] call BIS_fnc_areEqual}): {
            [
                "Complete",
                "ca\ui\data\ui_task_done_ca",
                false
            ]
        };

        case ([_task select 0, 0] call BIS_fnc_areEqual && {[_entry, _proficiency] call BIS_fnc_areEqual}): {
            [
                "Accept",
                "ca\ui\data\ui_task_none_ca",
                true
            ]
        };

        default {
            [
                "",
                "ca\ui\data\ui_task_cancelled_ca",
                false
            ]
        };
    }
] call BIS_fnc_arrayPushStack;

_state