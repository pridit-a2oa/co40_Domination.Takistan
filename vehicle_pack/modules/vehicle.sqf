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
    _vehicle addEventHandler ["getin", {
        private ["_vehicle"];

        PARAMS_1(_vehicle);

        if (_vehicle getVariable QGVAR(packed)) then {
            [_vehicle, 0] call FUNC(THIS_MODULE,fold);
        };
    }];
};