/**
 * Vehicle MHQ Module - Vehicle Deploy Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_state", "_net", "_position", "_camo"];

PARAMS_2(_vehicle, _state);

switch (_state) do {
    case true: {
        [true, "enableSimulation", [_vehicle, false]] call FUNC(network,mp);
        
        _net = ((GVAR(vehicle_mhq_types_net)) select 0) select 1;

        {
            if (_x select 0 == faction _vehicle) exitWith {
                _net = _x select 1;
            };
        } forEach GVAR(vehicle_mhq_types_net);

        _position = _vehicle modelToWorld [0.3, 0, 0];

        _camo = createVehicle [_net, [_position select 0, _position select 1, 0.85], [], 0, "CAN_COLLIDE"];
        _camo setDir ((direction _vehicle) - 90);
        _camo setVectorUp (vectorUp _vehicle);
        _camo setPos [_position select 0, _position select 1, 0.85];

        [true, "addEventHandler", [_camo, "HandleDamage", {0}]] call FUNC(network,mp);

        _vehicle setVariable [QGVAR(camo), _camo, true];
    };
    
    case false: {
        _camo = _vehicle getVariable QGVAR(camo);

        // just in case it might be destroyed
        if (isNil "_camo") then {
            _camo = objNull;
        };

        if (!isNull _camo) then {
            deleteVehicle _camo;
        };

        [true, "enableSimulation", [_vehicle, true]] call FUNC(network,mp);
    };
}