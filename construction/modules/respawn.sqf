/**
 * Construction Module - Respawn Submodule
 */

#include "x_macros.sqf"

{
    if (!isNil QMODULE(setting) && {[_x select 0, "mash"] call KRON_StrInStr}) then {
        GVAR(mash_type) = "MASH_EP1";
        GVAR(mash_distance_respawn) = 300;

        player setVariable [QGVAR(respawn_types), (player getVariable QGVAR(respawn_types)) + [
            [format ["MASH (%1m)", GVAR(mash_distance_respawn)], "mash"]
        ]];
    };
} forEach GVAR(construction_types);