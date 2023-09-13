#define THIS_MODULE communication
#include "x_macros.sqf"
private ["_menu", "_name", "_options", "_condition", "_execute", "_submenu"];

PARAMS_5(_menu, _name, _options, _condition, _execute);

_submenu = compile (format ["%1%2", _menu, _name]);

(call _submenu) resize 0;

[call _submenu, [_name, false]] call BIS_fnc_arrayPush;

{
    [
        call _submenu,
        _x,
        format ["%1", if !(call compile _condition) then {abs (_forEachIndex - 1)} else {0 max _forEachIndex}],
        format ["%1%2; %3 call d_fnc_communication_options", _execute, abs (_forEachIndex - 1), str _this]
    ] call FUNC(THIS_MODULE,add);
} forEach _options;