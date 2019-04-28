#define THIS_MODULE squad
#include "x_macros.sqf"

((units group (_this select 0)) + [player]) joinSilent (_this select 0);

call FUNC(THIS_MODULE,reveal);