/**
 * Vehicle Deploy Module (Handler)
 */

#include "x_macros.sqf"

_types = [];

if (!isNil QMODULE(vehicle_fob)) then {
    {
        _types = _types + [[_x, "FOB"]];
    } forEach GVAR(vehicle_fob_types);
};

if (!isNil QMODULE(vehicle_mhq)) then {
    {
        _types = _types + [[_x, "MHQ"]];
    } forEach GVAR(vehicle_mhq_types);
};

GVAR(vehicle_deploy_types) = _types;

if (hasInterface) then {
    {
        {
            _enableSimulation = _x getVariable QGVAR(enable_simulation);
            
            if (!isNil "_enableSimulation") then {
                _x enableSimulation _enableSimulation;
            };
        } forEach (entities _x);
    } forEach ([0, _types] call FUNC(common,arrayValues));
};