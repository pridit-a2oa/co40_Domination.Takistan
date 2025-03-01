#define THIS_MODULE teleport
#include "x_macros.sqf"

disableSerialization;

if !(call FUNC(THIS_MODULE,valid)) exitWith {};
if !(ctrlEnabled (DIALOG("X_TELEPORT_DIALOG", 300))) exitWith {};

[call FUNC(THIS_MODULE,target), {
    private ["_target", "_position"];

    PARAMS_1(_target);

    ["YOU ARE BEING TRANSPORTED"] call FUNC(client,transition);

    _position = _target modelToWorld ([typeOf _target] call FUNC(vehicle,offsetPlayer));

    player setDir (getDir _target);
    player setPos [_position select 0, _position select 1, 0];

    [50] call FUNC(client,reveal);
}] spawn FUNC(interface,teleport);

closeDialog 0;