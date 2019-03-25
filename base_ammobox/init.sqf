/**
 * Base Ammobox Module
 */

#define THIS_MODULE base_ammobox
#include "x_macros.sqf"

if (!isNil QMODULE(ammobox)) then {
    _box = [
        markerPos QGVAR(player_ammobox_pos),
        markerDir QGVAR(player_ammobox_pos),
        true
    ] call FUNC(ammobox,create);

    _box setVariable [QGVAR(immune), true];
    
    [_box] call FUNC(ammobox,replenish);
    [_box] execFSM FSM(ammobox,respawn);
};

MODULE(THIS_MODULE) = true;