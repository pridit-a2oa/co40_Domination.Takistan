#include "x_macros.sqf";

if !(hasInterface) exitWith {false};
if (isNil {GVAR(teleport)}) exitWith {false};
if !([typeName (uiNamespace getVariable "X_TELEPORT_DIALOG"), "DISPLAY"] call BIS_fnc_areEqual) exitWith {false};

if !(alive GVAR(teleport)) exitWith {
    closeDialog 0;

    false
};

true