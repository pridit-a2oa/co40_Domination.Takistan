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

    [true, "execVM", [[], FUNCTION(THIS_MODULE,populate)]] call FUNC(network,mp);

    _vehicle setVariable [QGVAR(vehicle_uav), false];

    _expression = {
        private ["_unit"];

        PARAMS_1(_unit);

        if !(isServer) exitWith {};
        if (_unit getVariable QGVAR(vehicle_uav)) exitWith {};

        _unit setVariable [QGVAR(vehicle_uav), true];

        if !([{isPlayer _x} count crew _unit, 0] call BIS_fnc_areEqual) exitWith {
            {
                if (isPlayer _x) then {
                    [_x, "execVM", [[_unit, false], FUNCTION(THIS_MODULE,control)]] call FUNC(network,mp);
                };
            } forEach crew _unit;
        };

        [true, "execVM", [[], FUNCTION(THIS_MODULE,populate)]] call FUNC(network,mp);
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