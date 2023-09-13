/**
 * Base UAV Module (Handler)
 */

#define THIS_MODULE base_uav
#include "x_macros.sqf"

if (isServer) then {
    private ["_zone", "_vehicle"];

    [
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
            ["Misc_cargo_cont_net1", "Sr_border"],
            ["Misc_cargo_cont_net2"],
            ["Misc_cargo_cont_net3"]
        ]
    ] call FUNC(server,objectMapper);

    _zone = (nearestObjects [GVAR(base_uav), ["Sr_border"], 25]) select 0;

    X_JIPH setVariable [QGVAR(base_uav_zone), _zone, true];

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
            ["UAV (Camera Pod)", "gunner"],
            ["UAV (Pilot)", "driver"]
        ];
    };
}