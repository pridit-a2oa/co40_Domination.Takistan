#include "x_macros.sqf"
private ["_vehicle", "_types", "_type"];

PARAMS_1(_vehicle);

_types = GVAR(vehicle_texture_types);
_type = ([0, _types] call FUNC(common,arrayValues)) find (typeOf _vehicle);

if (_type != -1) then {
    _type = _types select _type;
};

_type