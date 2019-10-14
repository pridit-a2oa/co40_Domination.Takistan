#define THIS_MODULE teleport
#include "x_macros.sqf"

disableSerialization;

if (!ctrlEnabled (DIALOG("X_TELEPORT_DIALOG", 2000))) exitWith {};

(call FUNC(THIS_MODULE,target)) spawn {
    private ["_target", "_position"];
    
    PARAMS_1(_target);
    
    player enableSimulation false;
    
    titleText ["", "BLACK", 1];
    
    sleep 1;
    
    titleText ["You are being transported", "BLACK FADED"];
    
    sleep 5;
    
    _position = _target modelToWorld [0, -6, 0];
    
    player setDir (getDir _target);
    player setPos [_position select 0, _position select 1, 0];
    player enableSimulation true;
    
    titleText ["", "BLACK IN", 2];
    
    {player reveal _x} forEach ((position player) nearObjects 50);
};

closeDialog 0;