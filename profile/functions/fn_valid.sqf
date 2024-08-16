#include "x_macros.sqf"
private ["_key"];

PARAMS_1(_key);

if !(_key in ([0, GVAR(profile_type_save)] call FUNC(common,arrayValues))) exitWith {false};

true