/**
 * Core Module
 */

#include "x_macros.sqf"

__ccppfln(core\scripts\common.sqf);

X_INIT = false;
X_Server = isServer;
X_Client = !isDedicated;
X_JIP = false;
X_SPE = false;
X_MP = isMultiplayer;

// Functions
__cppfln(FUNC(objectMapper),ca\modules\dyno\data\scripts\objectMapper.sqf);

// Modules
__module(boards);
__module(base_upgrades);
__module(cleanup);
__module(perks);
__module(wrecks);

skipTime 5;