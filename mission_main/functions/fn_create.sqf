#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_target", "_name", "_marker"];

PARAMS_1(_target);

_name = text (_target);

_marker = createMarker [text (_target), position _target];
_marker setMarkerColor "ColorRed";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerSize [400, 400];

GVAR(crossroad) kbTell [GVAR(crossroad2), "mission_main", "NewTarget", ["1", {}, _name, ["pause", [_name] call FUNC(THIS_MODULE,name)]], true];