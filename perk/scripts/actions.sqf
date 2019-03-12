#include "x_macros.sqf"

player addAction ["My Perks" call FUNC(server,GreyText), __script(show), [], -2, false, true, "", ""];

{
    _x addAction ["My Perks" call FUNC(server,GreyText), __script(show), [], -2, false, true, "", "player in _target"];
} forEach vehicles;