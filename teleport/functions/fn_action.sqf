#define THIS_MODULE teleport
#include "x_macros.sqf"

disableSerialization;

if !(call FUNC(THIS_MODULE,valid)) exitWith {};
if !(ctrlEnabled (DIALOG("X_TELEPORT_DIALOG", 2000))) exitWith {};

[call FUNC(THIS_MODULE,target)] spawn {
    private ["_target", "_position"];

    PARAMS_1(_target);

    player enableSimulation false;

    titleText ["", "BLACK", 1];

    sleep 1;

    for "_i" from -10 to -1 do {
        titleText [
            format [
                "YOU ARE BEING TRANSPORTED\n\n%1",
                abs _i
            ],
            "BLACK FADED"
        ];

        sleep 1;
    };

    _position = _target modelToWorld ([typeOf _target] call FUNC(vehicle,offsetPlayer));

    player setDir (getDir _target);
    player setPos [_position select 0, _position select 1, 0];
    player enableSimulation true;

    titleText ["", "BLACK IN", 2];

    [50] call FUNC(client,reveal);
};

closeDialog 0;