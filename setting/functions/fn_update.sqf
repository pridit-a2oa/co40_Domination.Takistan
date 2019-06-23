#include "x_macros.sqf"
private ["_type", "_values", "_option", "_types"];

PARAMS_2(_type, _values);

_option = {
    if (_x select 1 == _type) exitWith {
        [_x, _forEachIndex]
    };
} forEach GVAR(setting_type_valid);

_types = player getVariable format ["d_%1", _type + "s"];

(_option select 0) set [3, [0, _types] call FUNC(common,arrayValues)];
(_option select 0) set [4, [1, _types] call FUNC(common,arrayValues)];

player setVariable [format ["d_%1", _type], [(count _types) - 1, (_types select (count _types - 1)) select 1]];