#include "x_macros.sqf"
private ["_task", "_proficiency", "_entry", "_state"];

PARAMS_3(_task, _proficiency, _entry);

_state = [];

[
    _state,
    switch (true) do {
        case ([_task select 0, 1] call BIS_fnc_areEqual && {[_entry, _proficiency] call BIS_fnc_areEqual}): {
            [
                "Complete",
                "ca\ui\data\ui_task_assigned_ca",
                [_task select 1, 1] call BIS_fnc_areEqual
            ]
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