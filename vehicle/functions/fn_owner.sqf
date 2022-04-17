#include "x_macros.sqf"
private ["_vehicle", "_path", "_owner"];

PARAMS_2(_vehicle, _path);

_owner = (switch (_path select 0) do {
    case -1: {
        owner _vehicle
    };

    case 0: {
        if (isNull (gunner _vehicle)) then {
            // Don't know any way to find out the previous owner of a gunner slot without using something like
            // an event handler and persisting it across the network. It's really stupid individual parts of a
            // vehicle have distinct locality, and doesn't revert to vehicle owner when dismounting.
            true
        } else {
            gunner _vehicle
        };
    };
});

_owner