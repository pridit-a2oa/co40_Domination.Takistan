#include "x_macros.sqf"
private ["_task", "_status", "_params"];

if !(hasInterface) exitWith {};

PARAMS_2(_task, _status);

_params = switch (_status) do {
    case "created": {
        [
            localize "str_taskNew",
            [1, 1, 1, 1],
            "taskNew"
        ];
    };

    case "succeeded": {
        [
            localize "str_taskAccomplished",
            [0.60, 0.839215, 0.466666, 1],
            "taskDone"
        ];
    };

    case "failed": {
        [
            localize "str_taskFailed",
            [0.972549, 0.121568, 0, 1],
            "taskFailed"
        ];
    };

    case "cancelled": {
        [
            localize "str_taskCancelled",
            [0.75, 0.75, 0.75, 1],
            "taskFailed"
        ];
    };
};

taskHint [
    format [(_params select 0) + "\n%1", (taskDescription _task) select 1],
    _params select 1,
    _params select 2
];