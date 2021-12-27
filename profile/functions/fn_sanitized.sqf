#include "x_macros.sqf"
private ["_key", "_value", "_index", "_type"];

PARAMS_2(_key, _value);

_value = if (typeName _value == "SCALAR") then {_value / 10} else {_value};

_index = [0, GVAR(profile_type_save)] call FUNC(common,arrayValues) find _key;
_type = GVAR(profile_type_save) select _index;

if !([(_type select 1) select 0, typeName _value] call BIS_fnc_areEqual) exitWith {false};

_array = (_type select 1) select 1;

if (typeName _value == "SCALAR" && {count _array == 2} && ({_value < _array select 0 || {_value > _array select 1}})) exitWith {false};
if (typeName _value == "SCALAR" && {count _array > 2} && {_array find _value == -1}) exitWith {false};
if (typeName _value == "STRING" && {_array find _value == -1}) exitWith {false};

true