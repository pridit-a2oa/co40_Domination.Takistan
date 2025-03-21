/**
 * Core Module - Common (client & server)
 */

#define THIS_MODULE common
#include "x_macros.sqf"
private ["_handlers", "_count"];

_handlers = [];

{
    private ["_file", "_path"];

    _file = _x;

    if ([typeName _x, "ARRAY"] call BIS_fnc_areEqual) then {
        _file = _x select 1;
    };

    _path = format ["%1\handle.sqf", _file];

    if (count (toArray loadFile _path) > 100) then {
        _handlers = _handlers + [_x];
    };
} forEach GVAR(modules);

_count = count _handlers;

{
    private ["_module", "_path"];

    _module = _x;
    _path = _module;

    if ([typeName _module, "ARRAY"] call BIS_fnc_areEqual) then {
        _module = _x select 0;
        _path = _x select 1;
    };

    if !(isNil (format [QMODULE(%1), _module])) then {
        if (hasInterface && {isMultiplayer}) then {
            titleText [format [
                "%1%2\n\n%3",
                round ((round (_forEachIndex + 1) / _count) * 100),
                "%",
                toUpper _module
            ], "BLACK FADED", 1.6];

            sleep 0.05;
        };

        __handlerPP(_path);

        if ([_forEachIndex + 1, count _handlers] call BIS_fnc_areEqual) then {
            titleText ["READY", "BLACK FADED", 1.6];
        };
    };
} forEach _handlers;

if (hasInterface) then {
    [gameLogic, "spawn", [[name player, getPlayerUID player, _count], {
        __log format [
            "Player %1 (%2) executed handlers (%3)",
            _this select 0,
            _this select 1,
            _this select 2
        ]];
    }]] call FUNC(network,mp);
};