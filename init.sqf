#include "x_macros.sqf"

if (hasInterface) then {
    if (isMultiplayer) then {
        titleText ["", "BLACK FADED"];
    };
    
    QGVAR(base_south) setMarkerAlphaLocal 0.3;
    QGVAR(base_north) setMarkerAlphaLocal 0;
    QGVAR(map_zone) setMarkerAlphaLocal 0;
};

waitUntil {sleep 0.1; !isNil "bis_fnc_init"};
waitUntil {sleep 0.1; !isNil "BIS_MPF_InitDone"};

if (hasInterface && {isMultiplayer}) then {
    player enableSimulation false;

    0 spawn {
        disableSerialization;
        
        while {!(simulationEnabled player)} do {
            waitUntil {sleep 0.01; !isNull (findDisplay 49)};

            if (simulationEnabled player) exitWith {};

            _ctrl = (findDisplay 49) displayCtrl 1010;
            _ctrl ctrlEnable false;
        };
    };
};

if (!isDedicated) then {
    X_INIT = false;
    
    GVAR(client_init_trig) = createTrigger ["EmptyDetector", [0, 0, 0]];
    GVAR(client_init_trig) setTriggerArea [0, 0, 0, false];
    GVAR(client_init_trig) setTriggerActivation ["NONE", "PRESENT", false];
    GVAR(client_init_trig) setTriggerTimeout [1, 1, 1, false];
    GVAR(client_init_trig) setTriggerStatements ["X_INIT && {!isNil 'd_mdl_common'}", "call compile preprocessFileLineNumbers 'core\client\handle.sqf'", ""];
};

// process in one frame
GVAR(init_obj) = "HeliHEmpty" createVehicleLocal [0, 0, 0];
GVAR(init_obj) addEventHandler ["Killed", {__coreVM(common);deleteVehicle GVAR(init_obj);GVAR(init_obj) = nil}];

if (hasInterface) then {
    sleep 1;
};

GVAR(init_obj) setDamage 1;