#define THIS_MODULE name
#include "x_macros.sqf"
private ["_unit", "_marker"];

PARAMS_1(_unit);

_marker = createMarkerLocal [str _unit, position _unit];
_marker setMarkerTextLocal (name _unit);
_marker setMarkerColorLocal "ColorGreen";
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal "DOT";

_unit addMPEventHandler ["MPKilled", {
    private ["_unit"];
    
    PARAMS_1(_unit);
    
    deleteMarkerLocal (str _unit);
}];

_marker