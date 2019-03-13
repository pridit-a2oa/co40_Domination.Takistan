#include "x_macros.sqf"
private ["_name", "_code", "_time", "_ar"];
PARAMS_3(_name,_code,_time); //_time = 0 = every frame

_name = toLower _name;
_ar = GV2(GVAR(perframe_store),_name);
if (isNil "_ar") then {_ar = []}; // workaround for getVariable default bug
_ar set [0, _code];
_ar set [1, _time];
_ar set [2, 0];
GVAR(perframe_store) setVariable [_name, _ar];
GVAR(perframe_array) set [count GVAR(perframe_array), _name];