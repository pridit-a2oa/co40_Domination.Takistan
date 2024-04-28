/**
 * Database Module (Handler)
 */

#include "x_macros.sqf"

if (isServer && {isMultiplayer}) then {
    0 spawn {
        while {true} do {
            private ["_players"];

            _players = call FUNC(common,players);

            if !([_players, []] call BIS_fnc_areEqual) then {
                {
                    missionNamespace setVariable [
                        format ["d_%1", getPlayerUID _x],
                        score _x
                    ];
                } forEach _players;
            };

            sleep 15;
        };
    };
};

if (hasInterface) then {
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

        if !(_uid in GVAR(database_uid)) then {
            [GVAR(database_uid), _uid] call BIS_fnc_arrayPush;
        };

        [GVAR(database_score), [_name, _score]] call BIS_fnc_arrayPush;
    }]] call FUNC(network,mp);
};