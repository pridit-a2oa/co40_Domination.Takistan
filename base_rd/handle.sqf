/**
 * Base R&D Module
 */

#define THIS_MODULE base_rd
#include "x_macros.sqf"

if (isServer) then {
    private ["_progress", "_trigger"];

    _progress = [];

    {
        [_progress, [_x, 0]] call BIS_fnc_arrayPush;
    } forEach GVAR(base_rd_type_vehicles);

    GVAR(base_rd) setVariable [QGVAR(progress), _progress, true];

    [
        position GVAR(base_rd),
        direction GVAR(base_rd) + 30,
        GVAR(base_rd_type_composition)
    ] call FUNC(server,objectMapper);

    _trigger = createTrigger ["EmptyDetector", position GVAR(base_rd)];
    _trigger setTriggerArea [8, 8, 0, false];
    _trigger setTriggerActivation ["ANY", "PRESENT", true];
    _trigger setTriggerStatements [
        "[thisTrigger] call d_fnc_base_rd_valid",
        "[thisTrigger] spawn d_fnc_base_rd_deconstruct",
        ""
    ];
};

if (hasInterface) then {
    player addAction [
        "R&amp;D" call FUNC(common,KhakiText),
        __function(show),
        [],
        -6,
        false,
        true,
        "",
        "[player, _target] call BIS_fnc_areEqual && {d_base_rd distance (position player) < 18}"
    ];
};