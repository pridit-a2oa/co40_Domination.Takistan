#define THIS_MODULE accolade
#include "x_macros.sqf"
private ["_experience", "_ranks", "_rank"];

PARAMS_1(_experience);

_experience = _experience min (call FUNC(THIS_MODULE,max));

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