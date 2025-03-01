/**
 * Vehicle UAV Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_uav
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(typeOf _vehicle in GVAR(vehicle_uav_types)) exitWith {};

if (isServer) then {
    private ["_expression"];

    _vehicle lock true;
    _vehicle allowCrewInImmobile true;

    _expression = {
        private ["_unit"];

        PARAMS_1(_unit);

        {
            if (isPlayer _x) then {
                [_x, "execVM", [[_unit, false], FUNCTION(THIS_MODULE,control)]] call FUNC(network,mp);
            };
        } forEach crew _unit;
    };

    _vehicle addEventHandler ["Killed", _expression];
    _vehicle addMPEventHandler ["MPKilled", _expression];
};

if (hasInterface) then {
    _vehicle addAction [
        "Disconnect" call FUNC(common,RedText),
        __function(disconnect),
        [],
        10,
        false,
        true,
        "",
        "player in _target"
    ];
};