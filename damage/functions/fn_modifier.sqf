#include "x_macros.sqf"
private ["_unit", "_damage", "_selection", "_modifier", "_hit", "_structure"];

PARAMS_4(_unit, _damage, _selection, _modifier);

_network = [_this, 4, false] call FUNC(common,param);

_hit = switch (_selection) do {
    case "": {
        _structure = _unit getVariable QGVAR(structure);

        if ([_structure, 0] call BIS_fnc_areEqual && {_damage > _structure}) exitWith {
            systemChat format ["[DAMAGE RESET] %1 | %2", _structure, _damage];

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

// _unit spawn {
//     if !([damage _this, 0] call BIS_fnc_areEqual) exitWith {};

//     while {true} do {
//         hintSilent format ["%1", _this getVariable QGVAR(structure)];

//         sleep 0.2;
//     };
// };

if ([_selection, ""] call BIS_fnc_areEqual) then {
    _unit setVariable [QGVAR(structure), _damage, _network];
};

systemChat format ["SLT: %1 | HIT: %2 | DMG: %3", _selection, _hit, _damage];

_damage