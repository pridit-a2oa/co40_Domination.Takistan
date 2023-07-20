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

if (isServer) then {
    private ["_expression"];

    _expression = {
        private ["_vehicle"];

        PARAMS_1(_vehicle);

        if !(isServer) exitWith {};

        _vehicle spawn {
            while {(position _this) select 2 > 10} do {
                sleep 1;
            };

            _this setVariable [QGVAR(wrecked), position _this];
        };
    };

    _vehicle addEventHandler ["Killed", _expression];
    _vehicle addMPEventHandler ["MPKilled", _expression];
};