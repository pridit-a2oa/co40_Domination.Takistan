#include "x_macros.sqf"
private ["_squads", "_squad"];

_squads = X_JIP getVariable QGVAR(squads);

{
    _x setGroupId [GVAR(group_names) select _forEachIndex];

    if (count units _x > 0) then {
        (units _x) joinSilent _x;
    };
} forEach _squads;

{
    private ["_role"];

    _role = call compile format ["d_%1", _x];

    if (str player in _role) exitWith {
        _squad = _squads select _forEachIndex;

        [player] joinSilent _squad;
    };
} forEach ([1, GVAR(roles)] call FUNC(common,arrayValues));

_squad