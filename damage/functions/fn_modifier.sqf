#include "x_macros.sqf"
private ["_unit", "_damage", "_selection", "_modifier", "_hit"];

PARAMS_4(_unit, _damage, _selection, _modifier);

_network = [_this, 4, false] call FUNC(common,param);

_hit = switch (_selection) do {
    case "": {
        private ["_structure"];

        _structure = _unit getVariable QGVAR(structure);

        if ([_structure, 0] call BIS_fnc_areEqual && {_damage > _structure}) exitWith {
            _damage = _damage * _modifier;

            0
        };

        _structure
    };

    case "?": {
        -1
    };

    default {
        _unit getHit _selection
    };
};

if ([_hit, -1] call BIS_fnc_areEqual) exitWith {0};

_damage = switch (true) do {
    case ([_selection, ""] call BIS_fnc_areEqual && {_structure > _damage}): {
        _structure
    };

    default {
        _hit + ((_damage - _hit) * _modifier)
    };
};

if ([_selection, ""] call BIS_fnc_areEqual) then {
    _unit setVariable [QGVAR(structure), _damage, _network];
};

_damage