#include "x_macros.sqf"

switch (true) do {
    // Editor environment override
    case ([getPlayerUID player, "_SP_PLAYER_"] call BIS_fnc_areEqual);
    // Server environment when logged in (but not host e.g. local mp) override
    case (isMultiplayer && {!isServer && {serverCommandAvailable "#logout"}});
    case (getPlayerUID player in GVAR(admin_type_players)): {
        true
    };

    default {
        false
    };
};