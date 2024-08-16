/**
 * Vehicle Pack Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_pack
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(typeOf _vehicle in GVAR(vehicle_pack_types)) exitWith {};

if (isServer && {!isEngineOn _vehicle}) then {
    [_vehicle, 1] call FUNC(THIS_MODULE,fold);
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