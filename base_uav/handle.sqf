/**
 * Base UAV Module (Handler)
 */

#define THIS_MODULE base_uav
#include "x_macros.sqf"

if (isServer) then {
    private ["_vehicle", "_zone"];

    if (isNil {GVAR(base_uav)}) exitWith {};

    _vehicle = createVehicle [GVAR(base_uav_type_vehicle), position GVAR(base_uav), [], 0, "CAN_COLLIDE"];
    _vehicle setDir (direction GVAR(base_uav));
    _vehicle setPosATL (GVAR(base_uav) modelToWorld ([typeOf _vehicle] call FUNC(THIS_MODULE,offset)));
    
    if !(isNil QMODULE(vehicle_respawn)) then {
        _vehicle setVariable [QGVAR(respawnable), true, true];
    };

    X_JIPH setVariable [QGVAR(base_uav), _vehicle, true];
};

if (hasInterface) then {
    private ["_zone"];

    waitUntil {
        sleep 0.1;

        !isNil {X_JIPH getVariable QGVAR(base_uav_zone)}
    };

    _zone = X_JIPH getVariable QGVAR(base_uav_zone);

    GVAR(base_uav_trigger) = createTrigger ["EmptyDetector", position _zone];
    GVAR(base_uav_trigger) setTriggerArea [1.6, 2.5, direction _zone, true];
    GVAR(base_uav_trigger) setTriggerActivation ["WEST", "PRESENT", true];
    GVAR(base_uav_trigger) setTriggerStatements [
        "this && {player in thisList}",
        "",
        ""
    ];

    if !(isNil QMODULE(vehicle_uav)) then {
        {
            player addAction [
                (if ([typeName _x, "ARRAY"] call BIS_fnc_areEqual) then {_x select 0} else {_x}) call FUNC(common,BlueText),
                FUNCTION(vehicle_uav,assume),
                [_x select 1],
                10,
                false,
                true,
                "",
                "[_target] call d_fnc_base_uav_valid"
            ];
        } forEach [
            ["UAV (Pilot)", "driver"],
            ["UAV (Camera Pod)", "gunner"]
        ];
    };
}