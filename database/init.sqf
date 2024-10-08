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
    // Name of the database to be used
    GVAR(database_name) = "arma";

    GVAR(database) = true;
    GVAR(database_uid) = [];
    GVAR(database_score) = [];

    __cppfln(FUNC(THIS_MODULE,statistic),THIS_MODULE\functions\fn_statistic.sqf);
    __cppfln(FUNC(THIS_MODULE,query),THIS_MODULE\functions\fn_query.sqf);
};

__cppfln(FUNC(THIS_MODULE,sanitize),THIS_MODULE\functions\fn_sanitize.sqf);

MODULE(THIS_MODULE) = true;