#define THIS_MODULE vote
#include "x_macros.sqf"
private ["_network", "_expression"];

PARAMS_1(_network);

_expression = {
    if !([typeName (uiNamespace getVariable "X_VOTE_DIALOG"), "DISPLAY"] call BIS_fnc_areEqual) exitWith {};

    closeDialog 0;

    call FUNC(THIS_MODULE,show);
};

switch (_network) do {
    case true: {[true, "spawn", [[], _expression]] call FUNC(network,mp)};
    case false: {call _expression};
};