/**
 * Base Ammobox Module
 */

#define THIS_MODULE base_ammobox
#include "x_macros.sqf"

if (!isNil QMODULE(ammobox)) then {
    _box = [
        markerPos QGVAR(player_ammobox_pos),
        markerDir QGVAR(player_ammobox_pos)
    ] call FUNC(ammobox,create);

    _box setVariable ["immune", true];

    [_box] execFSM FSM(ammobox,respawn);
};

MODULE(THIS_MODULE) = true;