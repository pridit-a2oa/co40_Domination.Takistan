#include "x_macros.sqf"

X_MP = isMultiplayer;
X_CLIENT = !isDedicated;
X_SERVER = isServer;

X_JIP = false;
X_SPE = false;
X_INIT = false;

#define __waitpl 0 spawn {scriptName "spawn_WaitForNotIsNullPlayer";waitUntil {!isNull player};X_INIT = true}
if (isServer) then {
    if (!isDedicated) then {
        X_SPE = true;
        __waitpl;
    } else {
        X_INIT = true;
    };
} else {
    if (isNull player) then {
        X_JIP = true;
        __waitpl;
    } else {
        X_INIT = true;
    };
};

if (isMultiplayer && {!isDedicated}) then {
    enableRadio false;
    0 fadeSound 0;
    titleText ["", "BLACK FADED"];
};

if (!isDedicated) then {
    GVAR(client_init_trig) = createTrigger ["EmptyDetector", [0,0,0]];
    GVAR(client_init_trig) setTriggerArea [0,0,0,false];
    GVAR(client_init_trig) setTriggerActivation ["NONE", "PRESENT", false];
    GVAR(client_init_trig) setTriggerTimeout [1, 1, 1, false];
    X_INIT = false;
    GVAR(client_init_trig) setTriggerStatements ["X_INIT && {!isNil 'd_init_processed'}", "call compile preprocessFileLineNumbers 'player\init.sqf'", ""];
    onPreloadFinished {GVAR(preloaddone) = true; onPreloadFinished {}};
};

enableSaving [false,false];
enableTeamSwitch false;

// process in one frame
GVAR(init_obj) = "HeliHEmpty" createVehicleLocal [0, 0, 0];
GVAR(init_obj) addEventHandler ["killed", {__module(core);deleteVehicle GVAR(init_obj);GVAR(init_obj) = nil}];
GVAR(init_obj) setDamage 1;

GVAR(init_processed) = true;