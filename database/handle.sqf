/**
 * Database Module (Handler)
 */

#define THIS_MODULE database
#include "x_macros.sqf"

if (isServer && {isMultiplayer}) then {
    X_JIPH setVariable [
        QGVAR(holiday),
        (call compile ("Arma2Net.Unmanaged" callExtension "DateTime ['utcnow', 'dd/MM']")) in [
            '20/12',
            '21/12',
            '22/12',
            '23/12',
            '24/12',
            '25/12',
            '26/12',
            '27/12',
            '28/12',
            '29/12',
            '30/12',
            '31/12',
            '01/01',
            '02/01'
        ],
        true
    ];

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
    [gameLogic, "spawn", [[player, getPlayerUID player, name player, score player], {
        private ["_unit", "_uid", "_name", "_score", "_character", "_id", "_user", "_muted", "_role"];

        PARAMS_4(_unit, _uid, _name, _score);

        if ([[_name] call FUNC(database,sanitize), ""] call BIS_fnc_areEqual) exitWith {};

        [format [
            "INSERT INTO characters (guid, name) VALUES ('%1', '%2') ON DUPLICATE KEY UPDATE id=id",
            _uid,
            _name
        ]] call FUNC(database,query);

        _character = [format [
            "SELECT id, user_id, EXISTS(SELECT guid FROM mutes WHERE guid = '%1') is_muted FROM characters WHERE guid = '%1' AND name = '%2' LIMIT 1",
            _uid,
            _name
        ]] call FUNC(database,query);

        _id = (_character select 0) select 0;
        _user = (_character select 0) select 1;
        _muted = (_character select 0) select 2;

        if (!isNil QMODULE(chat) && {[_muted, "1"] call BIS_fnc_areEqual}) then {
            [_unit, "execVM", [[], __submoduleRE(chat)]] call FUNC(network,mp);
        };

        _role = if ([_user, ""] call BIS_fnc_areEqual) then {
            ""
        } else {
            [format [
                "SELECT COUNT(*) FROM model_has_roles WHERE model_id = '%1' AND role_id IN (2,3) AND model_type = 'App\\Models\\User' LIMIT 1",
                _user
            ]] call FUNC(database,query)
        };

        if ([[GVAR(database_uid), _uid] call BIS_fnc_findNestedElement, []] call BIS_fnc_areEqual) then {
            [GVAR(database_uid), [_uid, _id, _role]] call BIS_fnc_arrayPush;
        };

        [GVAR(database_score), [_name, _score]] call BIS_fnc_arrayPush;
    }]] call FUNC(network,mp);
};