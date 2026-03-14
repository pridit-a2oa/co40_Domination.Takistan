/**
 * Core Module - Common (client & server)
 */

#define THIS_MODULE common
#include "x_macros.sqf"
private ["_handlers", "_count"];

_handlers = [];

if (hasInterface && {!isServer}) then {
    if !(isNil {X_JIP getVariable QGVAR(initialized)}) exitWith {};

    titleText ["WAITING FOR SERVER", "BLACK FADED", 30];

    [gameLogic, "spawn", [[name player, getPlayerUID player], {
        __log format ["%1 (%2) waiting for server", _this select 0, _this select 1]];
    }]] call FUNC(network,mp);

    waitUntil {sleep 0.1; !isNil {X_JIP getVariable QGVAR(initialized)}};
};

{
    private ["_module", "_path"];

    _module = _x;
    _path = _x;

    if ([typeName _module, "ARRAY"] call BIS_fnc_areEqual) then {
        _module = _x select 0;
        _path = _x select 1;
    };

    if (count (toArray loadFile (format ["%1\handle.sqf", _path])) > 100 && {!(isNil (format [QMODULE(%1), _module]))}) then {
        _handlers = _handlers + [[_module, _path]];
    };
} forEach GVAR(modules);

_count = count _handlers;

{
    private ["_module", "_path"];

    _module = _x select 0;
    _path = _x select 1;

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

    if (hasInterface && {isMultiplayer && {[_forEachIndex + 1, _count] call BIS_fnc_areEqual}}) then {
        titleText ["READY", "BLACK FADED", 1.6];

        if !(isNil QMODULE(gear)) then {
            waitUntil {sleep 0.1; !([weapons player, []] call BIS_fnc_areEqual)};
        };
    };
} forEach _handlers;

if (isServer) then {
    X_JIP setVariable [QGVAR(initialized), true, true];
};

if (hasInterface) then {
    [gameLogic, "spawn", [[name player, getPlayerUID player, _count], {
        __log format [
            "%1 (%2) executed handlers (%3)",
            _this select 0,
            _this select 1,
            _this select 2
        ]];
    }]] call FUNC(network,mp);
};