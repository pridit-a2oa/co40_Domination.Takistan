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
        if (_vehicle getVariable QGVAR(wrecked)) exitWith {};

        _vehicle setVariable [QGVAR(wrecked), true];

        _vehicle spawn {
            while {(position _this) select 2 > 10} do {
                sleep 1;
            };

            // TODO: Replace with a better solution
            if (_this distance (markerPos QGVAR(map_zone)) > 9000) then {
                [_this] call FUNC(vehicle,reset);
            };
        };
    };

    _vehicle addEventHandler ["Killed", _expression];
    _vehicle addMPEventHandler ["MPKilled", _expression];
};