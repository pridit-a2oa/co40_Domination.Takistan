#define THIS_MODULE vehicle_lift
#include "x_macros.sqf"
private ["_attacher", "_attachee"];

_attacher = _this select 0;
_attachee = _this select 3;

_attacher removeAction (_this select 2);
_attachee attachTo [_attacher, [0, 0, -12]];
_attachee setVariable [QGVAR(lifter), name player, true];

_attacher setVariable [QGVAR(release), _attacher addAction ["Release" call FUNC(common,RedText), __function(release), _attachee, 10, false, true, "", "player == driver _target"]];
_attacher setVariable [QGVAR(attached), _attachee];
_attacher setVariable [QGVAR(attach), nil];

if (!isNil QMODULE(vehicle_marker)) then {
    [_attacher, _attachee] __submoduleVM(vehicle_marker);
};

if (!isNil QMODULE(vehicle_deploy) && {_attachee getVariable QGVAR(deployed)}) then {
    [_attachee, false] call FUNC(vehicle_deploy,deploy);
};

if (!isNil QMODULE(crossroad)) then {
    if (!isNil QMODULE(vehicle_wreck) && call FUNC(common,time) > player getVariable QGVAR(cooldown)) then {
        if (!alive _attachee && {_attachee getVariable QGVAR(wreckable)}) then {
            [player, "kbTell", [
                GVAR(crossroad),
                "vehicle_lift",
                "Airlift",
                ["1", {}, format ["%1 wreck", [typeOf (_attachee)] call FUNC(vehicle,name)], []],
                true
            ]] call FUNC(network,mp);
            
            player setVariable [QGVAR(cooldown), call FUNC(common,time) + GVAR(crossroad_time_cooldown)];
        };
    };
    
    if (!isNil QMODULE(vehicle_mhq) && call FUNC(common,time) > player getVariable QGVAR(cooldown)) then {
        if (GVAR(vehicle_mhq_types) find (typeOf _attachee) != -1) then {
            [player, "kbTell", [
                GVAR(crossroad),
                "vehicle_lift",
                "Airlift",
                ["1", {}, [typeOf (_attachee)] call FUNC(vehicle,name), []],
                true
            ]] call FUNC(network,mp);
            
            player setVariable [QGVAR(cooldown), call FUNC(common,time) + GVAR(crossroad_time_cooldown)];
        };
    };
};

while {alive _attacher && {!isNull (_attacher getVariable QGVAR(attached))}} do {
    sleep 2;
};

if (!isNull (_attacher getVariable QGVAR(attached))) then {
    [_attacher, "", "", _attachee] call FUNC(THIS_MODULE,release);
};