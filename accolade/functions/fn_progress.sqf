#include "x_macros.sqf"
private ["_experience", "_ranks", "_max", "_current", "_next"];

PARAMS_1(_experience);

_ranks = GVAR(accolade_types_rank);

_max = [
    _experience,
    ([1, _ranks] call FUNC(common,arrayValues)) call BIS_fnc_greatestNum
] call BIS_fnc_areEqual;

_current = [];
_next = [];

{
    private ["_index"];

    if (_experience <= (_x select 1)) exitWith {
        _index = _forEachIndex;

        _next = _ranks select (_index min ((count _ranks - 1)));

        if ([_experience, _next select 1] call BIS_fnc_areEqual) then {
            if !(_max) then {
                _index = _index + 1;
            };

            _next = _ranks select (_index min ((count _ranks - 1)));
        };

        _current = _ranks select ((_index - 1) max 0);
    };
} forEach _ranks;

[_current, _next]