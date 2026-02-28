/**
 * Database Module (Handler)
 */

#define THIS_MODULE database
#include "x_macros.sqf"

if (isServer && {isMultiplayer}) then {
    if ((call compile ("Arma2Net.Unmanaged" callExtension "DateTime ['utcnow', 'dd/MM']")) in [
        '20/12', '21/12', '22/12', '23/12', '24/12', '25/12', '26/12',
        '27/12', '28/12', '29/12', '30/12', '31/12', '01/01', '02/01'
    ]) then {
        X_JIP setVariable [QGVAR(holiday), true, true];
    };

    0 spawn {
        while {true} do {
            {
                private ["_key", "_variables"];

                if (isPlayer _x) then {
                    _key = [getPlayerUID _x] call FUNC(THIS_MODULE,key);

                    if (isDedicated) then {
                        waitUntil {sleep 0.5; !isNil {profileNamespace getVariable _key}};
                    };

                    _variables = profileNamespace getVariable _key;

                    if !(isNil "_variables") then {
                        private ["_stored", "_score"];

                        _stored = (_variables select 1) select 2;
                        _score = score _x - (_stored select 1);

                        if ([_score, _stored select 2] call BIS_fnc_areEqual) exitWith {};

                        _stored set [2, _score];

                        [_x, "spawn", [_score, {
                            ((player getVariable QGVAR(database)) select 2) set [2, _this];
                        }]] call FUNC(network,mp);
                    };
                };
            } forEach call FUNC(common,players);

            sleep 15;
        };
    };
};

if (hasInterface) then {
    [gameLogic, "spawn", [[player, [-1, getPlayerUID player, name player], score player], {
        private ["_unit", "_identifier", "_score", "_character", "_id", "_user", "_experience", "_muted", "_role", "_key", "_variables"];

        PARAMS_3(_unit, _identifier, _score);

        if ([[_identifier select 1] call FUNC(database,sanitize), ""] call BIS_fnc_areEqual) exitWith {};

        [format [
            "INSERT INTO characters (`id64`, guid, name) VALUES ('%1', MD5(CONCAT('BE',
                CHAR(
                    CAST('%1' AS UNSIGNED) & 255,
                    (CAST('%1' AS UNSIGNED) >> 8) & 255,
                    (CAST('%1' AS UNSIGNED) >> 16) & 255,
                    (CAST('%1' AS UNSIGNED) >> 24) & 255,
                    (CAST('%1' AS UNSIGNED) >> 32) & 255,
                    (CAST('%1' AS UNSIGNED) >> 40) & 255,
                    (CAST('%1' AS UNSIGNED) >> 48) & 255,
                    (CAST('%1' AS UNSIGNED) >> 56) & 255
                )
            )), '%2') ON DUPLICATE KEY UPDATE last_seen_at = NOW()",
            _identifier select 1,
            _identifier select 2
        ]] call FUNC(database,query);

        _character = [format [
            "SELECT id, user_id, score, experience, EXISTS(SELECT `id64` FROM mutes WHERE `id64` = '%1') is_muted FROM characters WHERE `id64` = '%1' AND name = '%2' LIMIT 1",
            _identifier select 1,
            _identifier select 2
        ]] call FUNC(database,query);

        _id = (_character select 0) select 0;
        _user = (_character select 0) select 1;
        _score = [((call compile ((_character select 0) select 2)) - _score) max 0, _score max 0, 0];
        _experience = call compile ((_character select 0) select 3);
        _muted = (_character select 0) select 4;

        _role = if ([_user, ""] call BIS_fnc_areEqual) then {
            ""
        } else {
            [format [
                "SELECT COUNT(*) FROM model_has_roles WHERE model_id = '%1' AND role_id IN (2,3) AND model_type = 'App\\Models\\User' LIMIT 1",
                _user
            ]] call FUNC(database,query)
        };

        if (!isNil QMODULE(chat) && {[_muted, "1"] call BIS_fnc_areEqual}) then {
            [_unit, "execVM", [[], __submoduleRE(chat)]] call FUNC(network,mp);
        };

        if ([_id, -1] call BIS_fnc_areEqual) exitWith {};

        _identifier set [0, _id];

        _key = [_identifier select 1] call FUNC(database,key);

        waitUntil {sleep 0.1; isNil {profileNamespace getVariable _key}};

        _variables = [_user, _role, _score];

        profileNamespace setVariable [
            _key,
            [_identifier, _variables]
        ];

        [_unit, "spawn", [_variables, {
            player setVariable [QGVAR(database), _this];
        }]] call FUNC(network,mp);

        if !(isNil QMODULE(accolade)) then {
            private ["_key"];

            if (isServer || {hasInterface && {isServer}}) then {
                [gameLogic, "execVM", [[_identifier, _experience], __submoduleRE(accolade)]] call FUNC(network,mp);

                if !([_experience, 0] call BIS_fnc_areEqual) then {
                    [true, "setRank", [_unit, [_experience] call FUNC(accolade,rank)]] call FUNC(network,mp);
                };
            };

            _key = [_identifier select 1] call FUNC(accolade,key);

            if (isDedicated) then {
                waitUntil {sleep 0.5; !isNil {profileNamespace getVariable _key}};
            };

            [_unit, "execVM", [[_identifier, _experience, (profileNamespace getVariable _key) select 1], __submoduleRE(accolade)]] call FUNC(network,mp);
        };

        if !(isNil QMODULE(statistic)) then {
            private ["_key"];

            if (isServer || {hasInterface && {isServer}}) then {
                [gameLogic, "execVM", [[_identifier], __submoduleRE(statistic)]] call FUNC(network,mp);
            };

            _key = [_identifier select 1] call FUNC(statistic,key);

            if (isDedicated) then {
                waitUntil {sleep 0.5; !isNil {profileNamespace getVariable _key}};
            };

            [_unit, "execVM", [[_identifier, (profileNamespace getVariable _key) select 1], __submoduleRE(statistic)]] call FUNC(network,mp);
        };
    }]] call FUNC(network,mp);
};