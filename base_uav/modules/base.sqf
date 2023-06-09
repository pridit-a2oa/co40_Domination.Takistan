/**
 * Base UAV Module - Base Submodule
 */

#include "x_macros.sqf"
private ["_zone"];

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