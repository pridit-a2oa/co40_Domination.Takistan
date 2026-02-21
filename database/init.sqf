/**
 * Database Module
 *
 * Description: This module facilitates database support.
 */

#define THIS_MODULE database
#include "x_macros.sqf"

// Incompatible with SP environment
if !(isMultiplayer) exitWith {};

if (isServer) then {
    private ["_health"];

    GVAR(database) = true;
    GVAR(database_uid) = [];
    GVAR(database_score) = [];

    __cppfln(FUNC(THIS_MODULE,statistic),THIS_MODULE\functions\fn_statistic.sqf);
    __cppfln(FUNC(THIS_MODULE,query),THIS_MODULE\functions\fn_query.sqf);

    _health = [["SELECT 1"] call FUNC(THIS_MODULE,query), [["1"]]] call BIS_fnc_areEqual;

    if (_health) then {
        MODULE(THIS_MODULE) = true;
    } else {
        __log "(FATAL) Unreachable"];
    };

    X_JIP setVariable [QGVAR(database), _health, true];
};

__cppfln(FUNC(THIS_MODULE,sanitize),THIS_MODULE\functions\fn_sanitize.sqf);

if (hasInterface) then {
    waitUntil {sleep 0.1; !isNil {X_JIP getVariable QGVAR(database)}};

    if !(X_JIP getVariable QGVAR(database)) exitWith {};

    MODULE(THIS_MODULE) = true;
};