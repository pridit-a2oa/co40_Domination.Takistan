#define THIS_MODULE teleport
#include "x_macros.sqf"
private ["_map", "_target"];

disableSerialization;

_map = DIALOG("X_TELEPORT_DIALOG", 1000);

ctrlMapAnimClear _map;

_target = call FUNC(THIS_MODULE,target);

_map ctrlMapAnimAdd [0.5, 0.03, (_target select 2)];

ctrlMapAnimCommit _map;