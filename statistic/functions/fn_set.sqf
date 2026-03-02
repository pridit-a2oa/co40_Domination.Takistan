#define THIS_MODULE statistic
#include "x_macros.sqf"
private ["_statistic", "_identifier", "_key", "_statistics"];

PARAMS_2(_statistic, _identifier);

if !(isServer) exitWith {};

_key = _identifier call FUNC(THIS_MODULE,key);

_statistics = serverNamespace getVariable _key;

(_statistics select 1) set [
    _statistic - 1,
    [_statistic, (((_statistics select 1) select (_statistic - 1)) select 1) + 1]
];

[format [
    "INSERT INTO character_statistic SET character_id=%1, statistic_id=%2 ON DUPLICATE KEY UPDATE value = value + 1",
    (_statistics select 0) select 0,
    _statistic
]] spawn FUNC(database,query);

{
    if ([[_identifier select 0, _identifier select 1], [getPlayerUID _x, name _x]] call BIS_fnc_areEqual) exitWith {
        [_x, "spawn", [[_statistics select 1], {
            private ["_statistics"];

            PARAMS_1(_statistics);

            player setVariable [QGVAR(statistics), _statistics];
        }]] call FUNC(network,mp);
    };
} forEach call FUNC(common,players);