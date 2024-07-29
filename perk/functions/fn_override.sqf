#define THIS_MODULE perk
#include "x_macros.sqf"

if (!isNil QMODULE(admin) && {__submodulePP(admin)}) exitWith {true};
if (!isNil QMODULE(database) && {X_JIPH getVariable QGVAR(holiday)}) exitWith {true};

false