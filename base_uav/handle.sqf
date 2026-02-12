/**
 * Base UAV Module (Handler)
 */

#define THIS_MODULE base_uav
#include "x_macros.sqf"

if (isServer) then {
    private ["_objects", "_zone", "_vehicle"];

    _objects = [
        position GVAR(base_uav),
        direction GVAR(base_uav),
        GVAR(base_uav_type_composition),
        [
            ["Fort_Crate_wood"],
            ["Land_BagFenceEnd"],
            ["Land_BagFenceLong"],
            ["Land_BagFenceShort"],
            ["Land_BagFenceCorner"],
            ["Land_CamoNetVar_NATO_EP1"],
            ["Land_HBarrier_large"],
            ["MetalBucket", "US_WarfareBUAVterminal_EP1"],
            ["Misc_cargo_cont_net1", "ClutterCutter_small_EP1"],
            ["Misc_cargo_cont_net2"],
            ["Misc_cargo_cont_net3"]
        ]
    ] call FUNC(server,objectMapper);

    {
        if !(isClass (configFile >> "CfgVehicles" >> "MV22" >> "UserActions")) exitWith {};

        if ([typeOf _x, "ClutterCutter_small_EP1"] call BIS_fnc_areEqual) exitWith {
            private ["_border"];

            _border = createVehicle ["Sr_border", position _x, [], 0, "CAN_COLLIDE"];
            _border setDir (direction _x);
            _border setPos (position _x);

            _border addEventHandler ["HandleDamage", {0}];
        };
    } forEach _objects;

    _zone = (nearestObjects [GVAR(base_uav), ["ClutterCutter_small_EP1"], 25]) select 0;

    X_JIP setVariable [QGVAR(base_uav_zone), _zone, true];

    {
        private ["_object"];

        _object = createVehicle [_x select 0, _x select 1, [], 0, "CAN_COLLIDE"];
        _object setDir (_x select 2);
        _object setPos (_x select 1);

        _object addEventHandler ["HandleDamage", {0}];

        [true, "enableSimulation", [_object, false]] call FUNC(network,mp);
    } forEach [
        ["FoldTable", _zone modelToWorld [0, 0, 0], direction _zone],
        ["FoldChair", _zone modelToWorld [-0.8, 1, 0], direction _zone - 30],
        ["FoldChair", _zone modelToWorld [0.8, -1, 0], direction _zone - 210],
        ["Laptop_EP1", _zone modelToWorld [0.5, -0.1, 0.8], direction _zone],
        ["Laptop_EP1", _zone modelToWorld [-0.5, 0.1, 0.8], direction _zone - 180]
    ];

    _vehicle = createVehicle [GVAR(base_uav_type_vehicle), position GVAR(base_uav), [], 0, "CAN_COLLIDE"];
    _vehicle setDir (direction GVAR(base_uav));
    _vehicle setPosATL (GVAR(base_uav) modelToWorld ([typeOf _vehicle] call FUNC(THIS_MODULE,offset)));

    // if !(isNil QMODULE(vehicle_respawn)) then {
    //     _vehicle setVariable [QGVAR(respawnable), false, true];
    // };

    // if !(isNil QMODULE(vehicle_wreck)) then {
    //     _vehicle setVariable [QGVAR(wreckable), true, true];
    // };

    X_JIP setVariable [QGVAR(base_uav), true, true];
};

if (hasInterface) then {
    private ["_zone"];

    createMarkerLocal ["base_uav", position GVAR(base_uav)];

    waitUntil {
        sleep 0.1;

        !isNil {X_JIP getVariable QGVAR(base_uav_zone)}
    };

    _zone = X_JIP getVariable QGVAR(base_uav_zone);

    GVAR(base_uav_trigger) = createTrigger ["EmptyDetector", position _zone];
    GVAR(base_uav_trigger) setTriggerArea [1.6, 2.5, direction _zone, true];
    GVAR(base_uav_trigger) setTriggerActivation ["WEST", "PRESENT", true];
    GVAR(base_uav_trigger) setTriggerStatements [
        "this && {player in thisList}",
        "",
        ""
    ];
};