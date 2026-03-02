/**
 * Statistic Module - Database Submodule
 */

#define THIS_MODULE statistic
#include "x_macros.sqf"
private ["_identifier", "_statistics"];

PARAMS_1(_identifier);

_statistics = [_this, 1, []] call FUNC(common,param);

if (isServer && {[_statistics, []] call BIS_fnc_areEqual}) then {
    private ["_key", "_data"];

    _key = [_identifier select 1, _identifier select 2] call FUNC(THIS_MODULE,key);

    if (isMultiplayer) then {
        waitUntil {sleep 0.5; isNil {serverNamespace getVariable _key}};
    };

    _data = [format [
        "SELECT JSON_ARRAYAGG(JSON_ARRAY(statistics.id, IFNULL(character_statistic.value, 0))) AS value FROM statistics LEFT JOIN character_statistic ON statistics.id = character_statistic.statistic_id AND character_id = '%1' LIMIT 1",
        _identifier select 0
    ]] call FUNC(database,query);

    serverNamespace setVariable [
        _key,
        [_identifier, call compile ((_data select 0) select 0)]
    ];
};

if (hasInterface && {!([_statistics, []] call BIS_fnc_areEqual)}) then {
    player setVariable [QGVAR(statistics), _statistics];
};