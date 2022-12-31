/**
 * Vehicle Deploy Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_deploy
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (typeName ([_vehicle] call FUNC(THIS_MODULE,type)) == "SCALAR") exitWith {};

if (isServer) then {
    _vehicle setVariable [QGVAR(cleanup), []];
    _vehicle setVariable [QGVAR(deployed), [false, ""], true];
    _vehicle setVariable [QGVAR(deploy_cooldown), 0];
    _vehicle setVariable [QGVAR(enable_simulation), true, true];
    
    _vehicle addMPEventHandler ["MPKilled", {
        private ["_vehicle", "_deployed"];
        
        PARAMS_1(_vehicle);
        
        if !(isServer) exitWith {};

        _deployed = _vehicle getVariable QGVAR(deployed);

        if !(_deployed select 0) exitWith {};

        _vehicle setVariable [QGVAR(deployed), [false, ""], true];
    
        [_vehicle, _deployed select 1, false] call FUNC(THIS_MODULE,deploy);

        {
            _x setDamage 1;
        } forEach (nearestObjects [position _vehicle, ["USVehicleBox_EP1"], 8]);

        if (isNil QMODULE(conversation)) exitWith {};

        _vehicle spawn {
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
    }];
};