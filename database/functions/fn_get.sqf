#define THIS_MODULE database
#include "x_macros.sqf"
private ["_index", "_identifier", "_variables", "_values"];

PARAMS_1(_index);

_identifier = [_this, 1, [getPlayerUID player, name player]] call FUNC(common,param);

_variables = if (isServer && {!hasInterface}) then {
    (gameLogic getVariable ([_identifier select 0] call FUNC(THIS_MODULE,key))) select 1
} else {
    player getVariable QGVAR(database)
};

_values = +(_variables select _index);

if ([typeName _values, "ARRAY"] call BIS_fnc_areEqual) then {
    private ["_value"];

    _value = 0;

    {
        _value = _value + _x;
    } forEach _values;

    _values = _value;
};

_values