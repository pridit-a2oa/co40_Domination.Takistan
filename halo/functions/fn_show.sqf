#include "x_macros.sqf"
private ["_map"];

disableSerialization;

createDialog "XD_HaloDialog";

if !(isNil QMODULE(mission_main)) then {
    private ["_targets"];

    _targets = X_JIP getVariable QGVAR(targets);

    if ([_targets, []] call BIS_fnc_areEqual) exitWith {};

    _map = DIALOG("X_HALO_DIALOG", 10000);
    _map ctrlMapAnimAdd [0, 0.35, position (_targets call BIS_fnc_selectRandom)];

    ctrlMapAnimCommit _map;
};