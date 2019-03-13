#include "x_macros.sqf"

private ["_ar", "_wf", "_nt", "_cf"];
_cf = diag_frameno;
if (_cf == GVAR(perframe_previous)) exitWith {};
GVAR(perframe_previous) = _cf;
if (count GVAR(perframe_array) > 0) then {
    {
        _ar = GV2(GVAR(perframe_store),_x);
        if (isNil "_ar") then {_ar = []};
        if (count _ar > 0) then {
            _wf = _ar select 1;
            if (_wf == 0) then {
                call (_ar select 0);
            } else {
                _nt = _ar select 2;
                if (time >= _nt) then {
                    call (_ar select 0);
                    _ar set [2, time + (_ar select 1)];
                };
            };
        };
    } forEach GVAR(perframe_array);
};