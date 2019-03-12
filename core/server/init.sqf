/**
 * Core Module - Server
 */

#define THIS_MODULE server
#include "x_macros.sqf"

__ccppfln(core\THIS_MODULE\scripts\common.sqf);

__cppfln(FUNC(THIS_MODULE,objectMapper),ca\modules\dyno\data\scripts\objectMapper.sqf);

__ccppfln(core\THIS_MODULE\modules.sqf);

QGVAR(base_marker) setMarkerAlphaLocal 0;
QGVAR(island_marker) setMarkerAlphaLocal 0;
QGVAR(isledefense_marker) setMarkerAlphaLocal 0;

skipTime 5;

GVAR(init_processed) = true;