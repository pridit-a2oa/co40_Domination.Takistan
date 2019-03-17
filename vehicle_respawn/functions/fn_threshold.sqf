#include "x_macros.sqf"

{
    if (typeOf _this == _x select 1) then {
        _threshold = _x select 0;
    };
} forEach GVAR(respawnable_times);

if (isNil "_threshold") then {
    _threshold = GVAR(respawnable_threshold);
};

time + _threshold