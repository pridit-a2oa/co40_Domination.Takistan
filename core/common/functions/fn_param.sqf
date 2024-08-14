/*
    Author:
        Karel Moricky, optimised by Killzone_Kid

    Description:
        Define script parameter

    Parameter(s):
        0: ARRAY  - list of params
        1: NUMBER - selected index
        2: ANY (Optional) - default param (used when param is missing or of wrong type)
                          - you can overload default value by setting 'BIS_fnc_<functionName>_<index>'

    Returns:
        ANY - either value from list of params, or default value
*/

private ["_array", "_index", "_default", "_param"];

_array = _this select 0;
_index = _this select 1;
_default = _this select 2;

if (_index <= count _array) then {
    _param = _array select _index;
};

if (isNil "_param") exitWith { // param is nil, return default or nil
    if (isNil "_default") then {nil} else {_default};
};

_param