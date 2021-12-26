#include "x_macros.sqf"
private ["_name", "_variable", "_use"];

PARAMS_3(_name, _variable, _use);

if (_variable) exitWith {
    format ["%1 already %2", _name, if (!isNil "_use" && {_use}) then {"in use"} else {"in progress"}];
};

true