/**
 * Database Module - Chat Submodule
 */

#define THIS_MODULE database
#include "x_macros.sqf"

X_JIPH setVariable [
    QGVAR(mutes),
    [format ["SELECT guid FROM mutes"]] call FUNC(THIS_MODULE,query),
    true
];