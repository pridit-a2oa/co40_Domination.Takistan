#define THIS_MODULE teleport
#include "x_macros.sqf"
private ["_parent"];

PARAMS_1(_parent);

createDialog "XD_TeleportDialog";

GVAR(teleport) = _parent;

0 spawn FUNC(THIS_MODULE,populate);