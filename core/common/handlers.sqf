/**
 * Core Module - Common (client & server)
 */

#include "x_macros.sqf"
private ["_handlers"];

_handlers = [];

{
    _file = format ["%1\handle.sqf", _x];
    
    if (count (toArray loadFile _file) > 100) then {
        _handlers = _handlers + [_x];
    };
} forEach GVAR(modules);

_count = count _handlers;

{
    if !(isNil (format [QMODULE(%1), _x])) then {
        _handle = __handler(_x);
        
        if (hasInterface && {isMultiplayer}) then {
            titleText [format [
                "%1%2\n\n%3",
                round ((round (_forEachIndex + 1) / _count) * 100),
                "%",
                toUpper _x
            ], "BLACK FADED", 1.6];
        };
        
        waitUntil {scriptDone _handle};
    };
} forEach _handlers;