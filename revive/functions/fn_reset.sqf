#include "x_macros.sqf"
private ["_unit"];

PARAMS_1(_unit);

showHUD true;

_unit setCaptive false;

{
    _unit setVariable [_x, 0, true];
} forEach [
    QGVAR(head_hit),
    QGVAR(body),
    QGVAR(legs),
    QGVAR(hands),
    QGVAR(overall)
];

_unit setVariable [QGVAR(unconscious), false, true];
_unit setVariable [QGVAR(reviving), false, true];

if (!isNil QMODULE(drag)) then {
    _unit setVariable [QGVAR(dragging), false, true];
};

if (!isNil QMODULE(communication)) then {
    if (!isNil QMODULE(construction) && {count BIS_MENU_Construct > 1}) then {
        ["Construct", 1] call FUNC(communication,toggle);
    };

    if (!isNil QMODULE(gesture)) then {
        ["Gestures", 1] call FUNC(communication,toggle);
    };

    if (!isNil QMODULE(perk) && {count BIS_MENU_Radio > 1}) then {
        ["Radio", 1] call FUNC(communication,toggle);
    };
};