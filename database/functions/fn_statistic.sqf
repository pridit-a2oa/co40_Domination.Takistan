#define THIS_MODULE database
#include "x_macros.sqf"
private ["_uid", "_statistic", "_identifier", "_character"];

PARAMS_2(_uid, _statistic);

_identifier = [GVAR(database_uid), _uid] call BIS_fnc_findNestedElement;

if ([_identifier, []] call BIS_fnc_areEqual) exitWith {};

_character = GVAR(database_uid) select (_identifier select 0);

if !([_character select 2, [["1"]]] call BIS_fnc_areEqual) exitWith {};

[format [
    "INSERT INTO character_statistic SET character_id=%1, statistic_id=%2 ON DUPLICATE KEY UPDATE value = value + 1",
    _character select 1,
    _statistic
]] call FUNC(database,query);