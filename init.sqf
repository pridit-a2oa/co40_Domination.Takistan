#include "x_macros.sqf"

if (isMultiplayer && {!isDedicated}) then {
    enableRadio false;
    0 fadeSound 0;
    titleText ["", "BLACK FADED"];
};

enableSaving [false,false];
enableTeamSwitch false;

// process in one frame
GVAR(init_obj) = "HeliHEmpty" createVehicleLocal [0, 0, 0];
GVAR(init_obj) addEventHandler ["killed", {__ccppfln(core\init.sqf);deleteVehicle GVAR(init_obj);GVAR(init_obj) = nil}];
GVAR(init_obj) setDamage 1;