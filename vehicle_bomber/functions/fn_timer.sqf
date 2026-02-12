#define THIS_MODULE vehicle_bomber
#include "x_macros.sqf"
private ["_vehicle", "_group"];

PARAMS_1(_vehicle);

_group = createGroup east;

[driver _vehicle] joinSilent _group;

X_JIP setVariable [QGVAR(groups), (X_JIP getVariable QGVAR(groups)) + [_group], true];

sleep 1;

_vehicle spawn {
    while {alive (driver _this)} do {
        [true, "say3D", [_this, QGVAR(sound_tick), 20]] call FUNC(network,mp);

        if (damage _this > 0.5 || {!canMove _this} || {!([_this] call FUNC(common,canMove))}) exitWith {
            [_this] spawn FUNC(THIS_MODULE,detonate);
        };

        sleep 0.5;
    };
};

sleep 5;

if !(alive (driver _vehicle)) exitWith {};

[true, "say3D", [(driver _vehicle), QGVAR(sound_exclaim), 20]] call FUNC(network,mp);

sleep 1.5;

[_vehicle] spawn FUNC(THIS_MODULE,detonate);