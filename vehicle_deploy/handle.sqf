/**
 * Vehicle Deploy Module (Handler)
 */

#define THIS_MODULE vehicle_deploy
#include "x_macros.sqf"

if (hasInterface) then {
    {
        {
            _enableSimulation = _x getVariable QGVAR(enable_simulation);
            
            if (!isNil "_enableSimulation") then {
                _x enableSimulation _enableSimulation;
            };
        } forEach (entities _x);
    } forEach ([0, call FUNC(THIS_MODULE,types)] call FUNC(common,arrayValues));
};