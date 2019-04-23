#include "x_macros.sqf"

0 fadeSound 0;
titleText ["", "BLACK FADED"];

skipTime 5;

waitUntil {!(isNil "bis_fnc_init")};
waitUntil {!(isNil "BIS_MPF_InitDone")};

if (!isDedicated) then {
    X_INIT = false;
    
    GVAR(client_init_trig) = createTrigger ["EmptyDetector", [0,0,0]];
    GVAR(client_init_trig) setTriggerArea [0,0,0,false];
    GVAR(client_init_trig) setTriggerActivation ["NONE", "PRESENT", false];
    GVAR(client_init_trig) setTriggerTimeout [1, 1, 1, false];
    GVAR(client_init_trig) setTriggerStatements ["X_INIT && {!isNil 'd_mdl_common'}", "call compile preprocessFileLineNumbers 'core\client\init.sqf'", ""];
};

enableSaving [false,false];
enableTeamSwitch false;

// process in one frame
GVAR(init_obj) = "HeliHEmpty" createVehicleLocal [0, 0, 0];
GVAR(init_obj) addEventHandler ["killed", {__core(common);deleteVehicle GVAR(init_obj);GVAR(init_obj) = nil}];
GVAR(init_obj) setDamage 1;

QGVAR(base_marker) setMarkerAlphaLocal 0;