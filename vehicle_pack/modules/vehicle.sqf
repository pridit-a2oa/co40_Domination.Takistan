/**
 * Vehicle Pack - Vehicle Submodule
 */

#define THIS_MODULE vehicle_pack
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (isServer) then {
    _vehicle setVariable [QGVAR(packed), false, true];
};

if (hasInterface) then {
    _vehicle addEventHandler ["Engine", {
        private ["_vehicle", "_state"];
        
        PARAMS_2(_vehicle, _state);
        
        if (_vehicle getVariable QGVAR(packed) && {_state}) then {
            [_vehicle, 0] call FUNC(THIS_MODULE,fold);
        };
    }];
};