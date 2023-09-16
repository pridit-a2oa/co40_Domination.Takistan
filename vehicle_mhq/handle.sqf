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

    if !(isNil QMODULE(vehicle_deploy)) then {
        [GVAR(vehicle_deploy_types), GVAR(vehicle_mhq_types)] call BIS_fnc_arrayPushStack;
    };
};