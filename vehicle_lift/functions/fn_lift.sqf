#define THIS_MODULE vehicle_lift
#include "x_macros.sqf"
private ["_attacher", "_attachee"];

_attacher = _this select 0;
_attachee = _this select 3;

_attacher removeAction (_this select 2);

_attachee attachTo [_attacher, [0,0,-12]];

_attacher setVariable [QGVAR(release), _attacher addAction ["Release" call FUNC(common,RedText), __function(release), _attachee, 10, false, true, "", "player == driver _target"]];
_attacher setVariable [QGVAR(attached), true];
_attacher setVariable [QGVAR(attach), nil];

if (!isNil QMODULE(vehicle_marker)) then {
    [_attacher, _attachee] __submoduleVM(vehicle_marker);
};

if (!isNil QMODULE(crossroad)) then {
    if (!isNil QMODULE(vehicle_wreck)) then {
        if (!alive _attachee && {_attachee getVariable QGVAR(wreckable)}) then {
            [player, GVAR(crossroad2), "vehicle_lift", "Airlift", ["1", {}, format ["%1 wreck", [typeOf (_attachee)] call FUNC(vehicle,name)], []], true] call FUNC(network,kbTell);
        };
    };
    
    if (!isNil QMODULE(vehicle_mhq)) then {
        if (GVAR(vehicle_mhq_types) find (typeOf _attachee) != -1) then {
            [player, GVAR(crossroad2), "vehicle_lift", "Airlift", ["1", {}, [typeOf (_attachee)] call FUNC(vehicle,name), []], true] call FUNC(network,kbTell);
        };
    };
};