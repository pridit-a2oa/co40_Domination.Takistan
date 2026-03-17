#define THIS_MODULE accolade
#include "x_macros.sqf"
private ["_type", "_network", "_expression"];

PARAMS_1(_type);

_network = [_this, 1, false] call FUNC(common,param);

_expression = {
    if !(hasInterface) exitWith {};
    if !([typeName (uiNamespace getVariable "X_ACCOLADE_DIALOG"), "DISPLAY"] call BIS_fnc_areEqual) exitWith {};

    closeDialog 0;

    _type call FUNC(THIS_MODULE,show);
};

switch (_network) do {
    case true: {[true, "spawn", [[], _expression]] call FUNC(network,mp)};
    case false: {call _expression};
};