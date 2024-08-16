#define THIS_MODULE vehicle_tow
#include "x_macros.sqf"
private ["_vehicle", "_tow"];

PARAMS_2(_vehicle, _tow);

_vehicle addAction [
    format ["Tow %1", [typeOf _tow] call FUNC(vehicle,name)] call FUNC(common,YellowText),
    __function(tow),
    _tow,
    10,
    false,
    true,
    "",
    "[player, driver _target] call BIS_fnc_areEqual && {[(typeOf _target), d_vehicle_tow_type] call BIS_fnc_areEqual && {!(d_tow getVariable 'd_towed')}}"
];