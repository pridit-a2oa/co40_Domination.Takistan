#include "x_macros.sqf"
private ["_task", "_status", "_params"];

if !(hasInterface) exitWith {};

PARAMS_2(_task, _status);

_params = switch (_status) do {
    case "created": {
        [localize "str_taskNew", [1, 1, 1, 1], "taskNew"];
    };

    case "succeeded": {
        [localize "str_taskAccomplished", [0.600000, 0.839215, 0.466666, 1.000000], "taskDone"];
    };

    case "failed": {
        [localize "str_taskFailed", [0.972549, 0.121568, 0.000000, 1.000000], "taskFailed"];
    };

    case "cancelled": {
        [localize "str_taskCancelled", [0.750000, 0.750000, 0.750000, 1.000000], "taskFailed"];
    };
};

taskHint [
    format [(_params select 0) + "\n%1", (taskDescription _task) select 1],
    _params select 1,
    _params select 2
];