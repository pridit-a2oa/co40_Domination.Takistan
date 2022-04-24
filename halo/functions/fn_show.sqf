#include "x_macros.sqf"
private ["_map"];

disableSerialization;

createDialog "XD_HaloDialog";

if !(isNil QMODULE(mission_main)) then {
    if (isNil {X_JIPH getVariable QGVAR(target)}) exitWith {};

    _map = DIALOG("X_HALO_DIALOG", 1000);
    _map ctrlMapAnimAdd [0, 0.35, position (X_JIPH getVariable QGVAR(target))];

    ctrlMapAnimCommit _map;
};