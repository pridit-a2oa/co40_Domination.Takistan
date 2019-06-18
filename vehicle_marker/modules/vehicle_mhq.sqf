/**
 * Vehicle Marker - Vehicle MHQ Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_state", "_marker"];

PARAMS_2(_vehicle, _state);

_marker = str ((_vehicle getVariable QGVAR(position)) select 0);
_text = markerText _marker;

switch (_state) do {
    case true: {
        _marker setMarkerTextLocal (_text + " (Deployed)");
    };
    
    case false: {
        _marker setMarkerTextLocal ([typeOf (_vehicle)] call FUNC(vehicle,name));
    };
};