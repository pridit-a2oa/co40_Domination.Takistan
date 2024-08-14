/**
 * Vehicle Marker - Vehicle Deploy Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_state", "_marker"];

PARAMS_2(_vehicle, _state);

_marker = _vehicle getVariable QGVAR(id);
_text = markerText _marker;

switch (_state) do {
    case true: {
        _marker setMarkerColorLocal "ColorYellow";
        _marker setMarkerTextLocal (_text + " (Deployed)");
    };

    case false: {
        _marker setMarkerColorLocal "ColorBlack";
        _marker setMarkerTextLocal (format [" %1", [typeOf (_vehicle)] call FUNC(vehicle,name)]);
        _marker setMarkerAlphaLocal 0;
    };
};