/**
 * Base R&D Module
 */

#define THIS_MODULE base_rd
#include "x_macros.sqf"

if (hasInterface) then {
    player addAction [
        "R&amp;D" call FUNC(common,BlueText),
        __function(show),
        [],
        2,
        false,
        true,
        "",
        "player == _target"
    ];

    if (!isNil QMODULE(3d)) then {
        [
            GVAR(base_rd),
            format ["%1<br /><t size='0.6'>Deconstruct and build OPFOR vehicles</t>", "R&amp;D" call FUNC(common,BlueText)],
            [],
            true,
            true
        ] spawn FUNC(3d,create);
    };
};

if (isServer) then {
    {
        [GVAR(base_rd_progress), [_x, 2]] call BIS_fnc_arrayPush;
    } forEach GVAR(base_rd_type_vehicles);

    [
        position GVAR(base_rd),
        175,
        GVAR(base_rd_type_composition)
    ] call FUNC(server,objectMapper);
};