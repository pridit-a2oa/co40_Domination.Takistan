/**
 * Vehicle Deploy Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_deploy
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (typeName ([_vehicle] call FUNC(THIS_MODULE,type)) == "SCALAR") exitWith {};

if (isServer) then {
    _vehicle setVariable [QGVAR(deployed), false, true];
};

_vehicle addEventHandler ["killed", {
    private ["_vehicle"];
    
    PARAMS_1(_vehicle);
    
    if (_vehicle getVariable QGVAR(deployed)) then {
        [_vehicle, false] call FUNC(THIS_MODULE,deploy);
        
        if (!isNil QMODULE(crossroad)) then {
            [GVAR(crossroad), "kbTell", [
                GVAR(crossroad2),
                "vehicle_deploy",
                "Destroyed",
                ["1", {}, [typeOf _vehicle] call FUNC(vehicle,name), []],
                true
            ]] call FUNC(network,mp);
        };
    };
}];