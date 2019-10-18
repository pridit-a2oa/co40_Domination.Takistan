#include "x_macros.sqf"
private ["_vehicle", "_types", "_type"];

PARAMS_1(_vehicle);

_types = [0, GVAR(vehicle_deploy_types)] call FUNC(common,arrayValues);
_type = _types find (typeOf _vehicle);

if (_type != -1) then {
    _type = GVAR(vehicle_deploy_types) select _type;
};

_type