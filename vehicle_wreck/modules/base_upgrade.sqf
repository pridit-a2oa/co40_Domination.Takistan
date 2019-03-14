/**
 * Vehicle Wreck - Base Upgrade Submodule
 */

#include "x_macros.sqf"

GVAR(wreck_hangars) = [];
GVAR(wreck_hangar_triggers) = [];

for "_i" from 1 to 3 do {
    _marker = format [QGVAR(wreck_hangar_%1), _i];
    if (str (markerPos _marker) == "[0,0,0]") exitWith {};
    GVAR(wreck_hangars) set [count GVAR(wreck_hangars), [markerPos _marker, markerDir _marker]];
    
    _hangar = createVehicle ["Land_Mil_hangar_EP1", markerPos _marker, [], 0, "NONE"];
    _hangar setDir (markerDir _marker);
    _hangar addEventHandler ["handleDamage", {0}];
    
    // _trigger = [QGVAR(%1_trigger), _mna];
    // GVAR(_trigger) = createTrigger ["EmptyDetector", _mpos];
    // GVAR(_trigger) setTriggerArea [12, 20, -30, true];
    // GVAR(_trigger) setTriggerActivation ["ANY", "PRESENT", true];
    // GVAR(_trigger) setTriggerStatements [
    //     "{_x isKindOf 'Air'} count thislist > 0",
    //     "X_JIPH setVariable ['d_wreck_hangars_occupied', (X_JIPH getVariable 'd_wreck_hangars_occupied') + 1, true]",
    //     "X_JIPH setVariable ['d_wreck_hangars_occupied', (X_JIPH getVariable 'd_wreck_hangars_occupied') - 1, true]"
    // ];
    
    // GVAR(wreck_hangar_triggers) set [count GVAR(wreck_hangar_triggers), GVAR(_trigger)];
};