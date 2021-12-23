/**
 * Vehicle Wreck Module - Vehicle Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(_vehicle getVariable QGVAR(wreckable)) exitWith {};

if (!isNil QMODULE(vehicle_respawn)) then {
    _vehicle setVariable [QGVAR(respawnable), false, true];
};

_vehicle addMPEventHandler ["MPKilled", {
    private ["_vehicle"];

    PARAMS_1(_vehicle);

    if !(isServer) exitWith {};

    _vehicle spawn {
        while {(position _this) select 2 > 10} do {
            sleep 1;
        };

        _this setVariable [QGVAR(wrecked), position _this];
    };
}];