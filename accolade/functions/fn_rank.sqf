#define THIS_MODULE accolade
#include "x_macros.sqf"
private ["_experience", "_ranks", "_rank"];

_experience = ([_this, 0, 0] call FUNC(common,param)) min (call FUNC(THIS_MODULE,max));

if ([_experience, 0] call BIS_fnc_areEqual) exitWith {"PRIVATE"};

_ranks = GVAR(accolade_types_rank);

{
    private ["_index"];

    if (_experience <= (_x select 1)) exitWith {
        _index = _forEachIndex + (
            if ([_experience, _x select 1] call BIS_fnc_areEqual) then {1} else {0}
        );

        _rank = _ranks select (
            ((_index - 1) max 0) min ((count _ranks) - 1)
        );
    };
} forEach _ranks;

toUpper (_rank select 0)