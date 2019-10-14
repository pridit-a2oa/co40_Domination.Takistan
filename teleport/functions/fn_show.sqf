#define THIS_MODULE teleport
#include "x_macros.sqf"

PARAMS_1(_vehicle);

disableSerialization;

createDialog "XD_TeleportDialog";

[_vehicle, false] call FUNC(THIS_MODULE,populate);

GVAR(teleport) = _vehicle;