#define THIS_MODULE teleport
#include "x_macros.sqf"

disableSerialization;

_target = call FUNC(THIS_MODULE,target);

if (isNil "_target") exitWith {};

_target spawn {
    titleText ["", "BLACK", 1];
    
    sleep 1;
    
    titleText ["You are being transported", "BLACK FADED"];
    
    sleep 8;
    
    player setPos _this;
    
    1 fadeSound 1;
    titleText ["", "BLACK IN", 2];
};

closeDialog 0;