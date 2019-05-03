#define THIS_MODULE squad
#include "x_macros.sqf"

[player] joinSilent (_this select 0);

call FUNC(THIS_MODULE,reveal);