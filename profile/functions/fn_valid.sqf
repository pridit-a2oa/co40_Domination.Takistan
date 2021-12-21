#include "x_macros.sqf"
private ["_key"];

PARAMS_1(_key);

if ([0, GVAR(profile_type_save)] call FUNC(common,arrayValues) find _key == -1) exitWith {false};

true