#include "x_macros.sqf"
private ["_attacher", "_caller", "_id", "_attachee"];

PARAMS_4(_attacher, _caller, _id, _attachee);

if (typeName _caller == "OBJECT" && {count (nearestObjects [_attachee, ["AllVehicles"], 15]) > 2}) exitWith {
    hint format ["%1 cannot be released due to an obstruction or close proximity with another vehicle", [typeOf _attachee] call FUNC(vehicle,name)];
};

detach _attachee;

_attachee setPos [(position _attacher) select 0, (position _attacher) select 1, 0];

[_attachee, "setVectorDirAndUp", [vectorDir _attacher, vectorUp _attacher]] call FUNC(network,mp);

[true, "enableSimulation", [_attachee, true]] call FUNC(network,mp);

[_attachee, "lock", false] call FUNC(network,mp);

if (alive _attacher) then {
    _attacher setVariable [QGVAR(release), nil];
    _attacher setVariable [QGVAR(attached), objNull, true];

    if (!isNil "_id" && {typeName _id == "SCALAR"}) then {
        _attacher removeAction _id;
    };
};

if (!alive _attachee && {_attachee isKindOf "Air"}) then {
    [_attachee] call FUNC(vehicle,freeze);
};