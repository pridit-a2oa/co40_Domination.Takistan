/**
 * Base Upgrades Module
 */

#include "x_macros.sqf"

_mpos = markerPos QGVAR(base_radar_pos);
_mpos set [2,0];
GVAR(base_radar_pos) = _mpos;

[GVAR(base_radar_pos), random 0, ["radar","us_army"], 0, [
    "76n6ClamShell_EP1",
    "US_WarfareBAntiAirRadar_EP1"
]] call FUNC(objectMapper);

// _dgrp = ["WEST"] call FUNC(creategroup);
// _unit_array = ["basic", "WEST"] call FUNC(getunitliste);
// [GVAR(base_radar_pos), _unit_array select 0, _dgrp, true] call FUNC(makemgroup);
// [_dgrp, GVAR(base_radar_pos)] call FUNC(taskDefend);