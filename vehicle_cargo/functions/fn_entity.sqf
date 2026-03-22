#define THIS_MODULE vehicle_cargo
#include "x_macros.sqf"
private ["_vehicle", "_type", "_entity"];

PARAMS_2(_vehicle, _type);

if ([typeName _type, "STRING"] call BIS_fnc_areEqual) then {
    _type = [_type];
};

_entity = (
    nearestObjects [
        _vehicle modelToWorld [0, [typeOf _vehicle] call FUNC(THIS_MODULE,offset), 0],
        _type,
        5
    ] - [_vehicle] - ([0, _vehicle getVariable QGVAR(cargo)] call FUNC(common,arrayValues))
) select 0;

if (isNil "_entity" || {!alive _entity || {!simulationEnabled _entity || {locked _entity}}}) exitWith {
    objNull
};

_entity