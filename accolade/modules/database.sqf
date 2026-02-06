/**
 * Accolade Module - Database Submodule
 */

#include "x_macros.sqf"
private ["_experience"];

PARAMS_1(_experience);

// Use this as a read-only, in essence adding to it but whenever
// the player gains XP execute a query to store it, then update
// this value.

player setVariable [QGVAR(experience), _experience];