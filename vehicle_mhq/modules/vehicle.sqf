/**
 * Vehicle MHQ Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_mhq
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_mhq_types) find (typeOf _vehicle) == -1) exitWith {};

if (isServer) then {
    _vehicle setVariable [QGVAR(deployed), false, true];
    
    if (!isNil QMODULE(ammobox)) then {
        _vehicle setVariable [QGVAR(ammobox), true, true];
    };
};

_vehicle addEventHandler ["killed", {
    private ["_vehicle"];
    
    PARAMS_1(_vehicle);
    
    if (_vehicle getVariable QGVAR(deployed)) then {
        [_vehicle] call FUNC(THIS_MODULE,undeploy);
        
        if (!isNil QMODULE(crossroad)) then {
            [GVAR(crossroad), GVAR(crossroad2), "vehicle_mhq", "Destroyed", ["1", {}, [typeOf _vehicle] call FUNC(vehicle,name), []], true] call FUNC(network,kbTell);
        };
    };
}];