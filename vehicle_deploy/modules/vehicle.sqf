/**
 * Vehicle Deploy Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_deploy
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (typeName ([_vehicle] call FUNC(THIS_MODULE,type)) == "SCALAR") exitWith {};

if (isServer) then {
    private ["_expression"];

    _vehicle setVariable [QGVAR(cleanup), []];
    _vehicle setVariable [QGVAR(handled), false];
    _vehicle setVariable [QGVAR(deployed), [false, ""], true];
    _vehicle setVariable [QGVAR(deploy_cooldown), 0];
    _vehicle setVariable [QGVAR(enable_simulation), true, true];

    if !(isNil QMODULE(teleport)) then {
        [true, "execVM", [[], FUNCTION(teleport,populate)]] call FUNC(network,mp);
    };

    _expression = {
        private ["_unit", "_deployed"];

        PARAMS_1(_unit);

        if !(isServer) exitWith {};
        if (_unit getVariable QGVAR(handled)) exitWith {};

        _unit setVariable [QGVAR(handled), true];

        _deployed = _unit getVariable QGVAR(deployed);

        if !(_deployed select 0) exitWith {
            if !(isNil QMODULE(teleport)) then {
                [true, "execVM", [[], FUNCTION(teleport,populate)]] call FUNC(network,mp);
            };
        };

        _unit setVariable [QGVAR(deployed), [false, ""], true];

        [_unit, _deployed select 1, false] call FUNC(THIS_MODULE,deploy);

        {
            _x setDamage 1;
        } forEach (nearestObjects [position _unit, ["USVehicleBox_EP1"], 8]);

        if (isNil QMODULE(conversation)) exitWith {};

        _unit spawn {
            sleep 5;

            [
                [GVAR(crossroad), GVAR(crossroad2)],
                [QUOTE(THIS_MODULE), "Destroyed"],
                [
                    ["1", {}, [typeOf _this] call FUNC(vehicle,name), []]
                ],
                true
            ] call FUNC(conversation,radio);
        };
    };

    _vehicle addEventHandler ["Killed", _expression];
    _vehicle addMPEventHandler ["MPKilled", _expression];
};