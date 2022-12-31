#define THIS_MODULE vehicle_lift
#include "x_macros.sqf"
private ["_attacher", "_attachee"];

_attacher = _this select 0;
_attachee = _this select 3;

_attacher removeAction (_this select 2);
_attachee attachTo [_attacher, [0, 0, -12]];
_attachee setVariable [QGVAR(lifter), getPlayerUID player, true];

_attacher setVariable [QGVAR(release), _attacher addAction ["Release" call FUNC(common,RedText), __function(release), _attachee, 10, false, true, "", "player == driver _target && {(position _target) select 2 < 17}"]];
_attacher setVariable [QGVAR(attached), _attachee, true];
_attacher setVariable [QGVAR(attach), nil];

{
    [_x, "action", ["Eject", vehicle _x]] call FUNC(network,mp);
} forEach crew _attachee;

waitUntil {count crew _attachee < 1};

[_attachee, "lock", true] call FUNC(network,mp);

if (isEngineOn _attachee) then {
    [_attachee, "engineOn", false] call FUNC(network,mp);
};

[true, "enableSimulation", [_attachee, false]] call FUNC(network,mp);

if (!isNil QMODULE(vehicle_marker)) then {
    [_attacher, _attachee] __submoduleVM(vehicle_marker);
};

if (!isNil QMODULE(conversation) && {call FUNC(common,time) > player getVariable QGVAR(conversation_cooldown)}) then {
    private ["_broadcast"];
    
    _broadcast = false;

    if (!isNil QMODULE(vehicle_mhq) && {alive _attachee} && {GVAR(vehicle_mhq_types) find (typeOf _attachee) != -1}) then {_broadcast = true};
    if (!isNil QMODULE(vehicle_wreck) && {!alive _attachee} && {_attachee getVariable QGVAR(wreckable)} && {(position _attacher) distance (markerPos QGVAR(base_south)) > 500}) then {_broadcast = true};

    if !(_broadcast) exitWith {};

    [
        [player, GVAR(crossroad)],
        [QUOTE(THIS_MODULE), "Airlift"],
        [
            ["1", {}, [typeOf _attachee] call FUNC(vehicle,name), []],
            ["2", {}, if !(alive _attachee) then {" wreck"} else {""}, []]
        ],
        true
    ] call FUNC(conversation,radio);

    player setVariable [
        QGVAR(conversation_cooldown),
        call FUNC(common,time) + GVAR(conversation_time_cooldown)
    ];
};

while {alive _attacher && {!isNull (_attacher getVariable QGVAR(attached))}} do {
    sleep 2;
};

if (!isNull (_attacher getVariable QGVAR(attached))) then {
    [_attacher, "", "", _attachee] call FUNC(THIS_MODULE,release);
};