/**
 * Vehicle MHQ Module (Handler)
 */

#include "x_macros.sqf"

if (hasInterface) then {
    private ["_nets"];
    
    _nets = [1, GVAR(vehicle_mhq_types_net)] call FUNC(common,arrayValues);
    
    {
        {
            _x addEventHandler ["HandleDamage", {0}];
        } forEach (allMissionObjects _x);
    } forEach _nets;
};