/**
 * Core Module
 */

#define THIS_MODULE core
#include "x_macros.sqf"

X_INIT = false;
X_Server = isServer;
X_Client = !isDedicated;
X_JIP = false;
X_SPE = false;
X_MP = isMultiplayer;

__ccppfln(core\scripts\common.sqf);

// Functions
__cppfln(FUNC(THIS_MODULE,objectMapper),ca\modules\dyno\data\scripts\objectMapper.sqf);

// Modules
__module(ammobox);
__module(backpacks);
__module(base_upgrades);
__module(boards);
__module(cleanup);
__module(perks);
__module(wrecks);

skipTime 5;