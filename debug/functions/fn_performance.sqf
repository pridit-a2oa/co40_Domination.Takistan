/*
    Author: Karel Moricky

    Description:
    Measures how much time it takes to execute given expression

    Parameter(s):
    _this select 0: STRING - tested expression
    _this select 1 (Optional): Number of cycles (default: 10000)

    Returns:
    NUMBER - avarage time spend in code execution [ms]
*/

#include "x_macros.sqf"

private ["_code", "_cycles", "_codeText", "_timeResult"];

_code = [_this, 0, "", [""]] call FUNC(common,param);
_cycles = [_this, 1, 10000, [0]] call FUNC(common,param);

//--- Compile code (calling the code would increase the time)
_codeText = compile format [
    "
        _time = diag_tickTime;
        for '_i' from 1 to %2 do {
            %1
        };
        _timeResult = ((diag_tickTime - _time) / _cycles) * 1000;
    ",
    _code,
    _cycles
];

call _codeText;

//--- Execute testing
"Execution" hintC [
    format ["Test Start. Code: %1", _code],
    format ["Test Cycles: %1", _cycles],
    format ["Test End. Result: %1 ms", _timeResult]
];

_timeResult