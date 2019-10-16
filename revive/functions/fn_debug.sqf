#include "x_macros.sqf"
private ["_target", "_caller"];

PARAMS_2(_target, _caller);

hint format [
    "Alive: %1 | Unconscious: %2 | Reviving: %3 | Dragged: %4",
    alive _target,
    _target getVariable QGVAR(unconscious),
    _target getVariable QGVAR(reviving),
    _target getVariable QGVAR(dragging)
];