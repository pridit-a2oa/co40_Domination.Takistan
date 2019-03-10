/**
 * Core Module (Server)
 */

#define THIS_MODULE core
#include "x_macros.sqf"

__ccppfln(THIS_MODULE\scripts\common.sqf);

// Functions
__cppfln(FUNC(THIS_MODULE,objectMapper),ca\modules\dyno\data\scripts\objectMapper.sqf);

// Modules
__module(base_shield);
__module(base_upgrades);
__module(boards);
__module(cleanup);
__module(wrecks);

QGVAR(base_marker) setMarkerAlphaLocal 0;
QGVAR(island_marker) setMarkerAlphaLocal 0;
QGVAR(isledefense_marker) setMarkerAlphaLocal 0;

skipTime 5;

GVAR(init_processed) = true;