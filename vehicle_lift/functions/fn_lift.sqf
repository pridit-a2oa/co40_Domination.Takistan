#define THIS_MODULE vehicle_lift
#include "x_macros.sqf"
private ["_attacher", "_attachee"];

_attacher = _this select 0;
_attachee = _this select 3;

_attacher removeAction (_this select 2);

_attachee attachTo [_attacher, [0,0,-12]];

_attacher addAction ["Release vehicle" call FUNC(common,RedText), __function(release), _attachee, 10, false, true, "", "player == driver _target"];

_attacher setVariable [QGVAR(attached), true];
_attacher setVariable [QGVAR(attach), nil];

if (!isNil QMODULE(marker)) then {
    [_attacher, _attachee] __submodule(marker);
};