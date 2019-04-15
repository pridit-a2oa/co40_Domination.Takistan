/************************************************************
    Direction To
    By Andrew Barron

Parameters: [object or position 1, object or position 2]

Returns the compass direction from object/position 1 to
object/position 2. Return is always >=0 <360.

Example: [player, getpos dude] call FUNC(DirTo)
************************************************************/
#include "x_macros.sqf"
private ["_pos1","_pos2","_ret"];
PARAMS_2(_pos1,_pos2);

if (typename _pos1 == "OBJECT") then {_pos1 = getposASL _pos1};
if (typename _pos2 == "OBJECT") then {_pos2 = getposASL _pos2};

_ret = ((_pos2 select 0) - (_pos1 select 0)) atan2 ((_pos2 select 1) - (_pos1 select 1));
if (_ret < 0) then {_ret = _ret + 360};
_ret