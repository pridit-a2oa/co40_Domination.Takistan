#define THIS_MODULE teleport
#include "x_macros.sqf"

disableSerialization;

_target = call FUNC(THIS_MODULE,target);

_target spawn {
    player enableSimulation false;
    
    titleText ["", "BLACK", 1];
    sleep 1;
    
    titleText ["You are being transported", "BLACK FADED"];
    sleep 5;
    
    player setDir (_this select 0);
    player setPos [(_this select 1) select 0, (_this select 1) select 1, 0];
    player enableSimulation true;
    
    1 fadeSound 1;
    titleText ["", "BLACK IN", 2];
};

closeDialog 0;