/**
 * Core Module - Common (client & server)
 */

#define THIS_MODULE common
#include "x_macros.sqf"
private ["_config", "_loaded", "_missing", "_expression"];

GVAR(modules) = [
    "database" // Requires: @Arma2NET
];

_config = missionConfigFile >> "Params";

for "_i" from 0 to (count (_config) - 1) do {
    private ["_param"];

    _param = if (isNil {paramsArray}) then {
        getNumber ((_config select _i) >> "default")
    } else {
        paramsArray select _i
    };

    if ([_param, 1] call BIS_fnc_areEqual) then {
        GVAR(modules) = GVAR(modules) + [configName ((_config) select _i)];
    };
};

{
    private ["_type"];

    _type = getArray (_config >> _x >> "type");

    if !([_type, []] call BIS_fnc_areEqual) then {
        if !(_type select 0 in GVAR(modules)) exitWith {
            GVAR(modules) set [_forEachIndex, ""];
        };

        GVAR(modules) set [_forEachIndex, [
            format ["%1_%2", _type select 0, _type select 1],
            format ["%1\types\%2", _type select 0, _type select 1]
        ]];
    };
} forEach GVAR(modules);

GVAR(modules) = GVAR(modules) + [
    "setting" // Note: Must be last due to reliance on variables other handlers set
];

GVAR(modules) = GVAR(modules) - [""];

_loaded = [];
_missing = [];

{
    private ["_module", "_path"];

    _module = _x;
    _path = _x;

    if ([typeName _x, "ARRAY"] call BIS_fnc_areEqual) then {
        _module = _x select 0;
        _path = _x select 1;
    };

    __module(_path);

    if !(isNil (format [QMODULE(%1), _module])) then {
        _loaded = _loaded + [_module];
    } else {
        _missing = _missing + [_module];
    };
} forEach GVAR(modules);

_expression = {
    private ["_loaded", "_missing", "_total", "_name", "_uid"];

    PARAMS_4(_loaded, _missing, _total, _name);

    _uid = [_this, 4, ""] call FUNC(common,param);

    __log format [
        "%1 %2initialized modules %3",
        _name,
        if !([_uid, ""] call BIS_fnc_areEqual) then {
            format ["(%1) ", _uid]
        } else {
            ""
        },
        if ([_loaded, _total] call BIS_fnc_areEqual) then {
            format ["(%1)", _total]
        } else {
            format ["(%1/%2) %3", _loaded, _total, _missing]
        }
    ]];
};

_this = [];

_this set [0, count _loaded];
_this set [1, _missing];
_this set [2, count GVAR(modules)];

if !(hasInterface) exitWith {
    _this set [3, "Server"];

    _this call _expression;
};

_this set [3, name player];
_this set [4, getPlayerUID player];

[gameLogic, "spawn", [_this, _expression]] call FUNC(network,mp);