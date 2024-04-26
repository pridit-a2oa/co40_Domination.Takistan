/**
 * Database Module (Handler)
 */

#include "x_macros.sqf"

if !(hasInterface) exitWith {};

[gameLogic, "spawn", [[getPlayerUID player, name player, score player], {
    private ["_uid", "_name", "_score", "_character"];

    PARAMS_3(_uid, _name, _score);

    if ([[_name] call FUNC(database,sanitize), ""] call BIS_fnc_areEqual) exitWith {};

    _character = [format [
        "SELECT COUNT(*) FROM characters WHERE uid = '%1' AND name = '%2' LIMIT 1",
        _uid,
        _name
    ]] call FUNC(database,query);

    if ([_character, [["0"]]] call BIS_fnc_areEqual) then {
        [format [
            "INSERT INTO characters (uid, name) VALUES ('%1', '%2')",
            _uid,
            _name
        ]] call FUNC(database,query);
    };

    [GVAR(database_score), [_name, _score]] call BIS_fnc_arrayPush;
}]] call FUNC(network,mp);