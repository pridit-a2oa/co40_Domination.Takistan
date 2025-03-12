#define THIS_MODULE perk
#include "x_macros.sqf"

if (!isNil QMODULE(admin) && {call FUNC(admin,valid)}) exitWith {true};
if (!isNil QMODULE(database) && {X_JIPH getVariable QGVAR(holiday)}) exitWith {true};

false