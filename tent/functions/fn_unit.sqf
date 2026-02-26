#include "x_macros.sqf"
private ["_object", "_group", "_position", "_unit"];

PARAMS_1(_object);

if !(GVAR(tent_chance_unit) > floor (random 100)) exitWith {};

_group = createGroup east;
_position = _object modelToWorld [[-2, 2] call BIS_fnc_selectRandom, 0, 0];

_unit = _group createUnit [GVAR(tent_type_unit), _position, [], 0, "FORM"];
_unit setPos _position;
_unit setVectorUp (surfaceNormal _position);

_group allowFleeing 0;

X_JIP setVariable [QGVAR(groups), (X_JIP getVariable QGVAR(groups)) + [_group], true];

__addDead(_unit);

_unit spawn {
    while {alive _this && {[{alive _x} count (units (group _this)), 1] call BIS_fnc_areEqual}} do {
        private ["_nearest"];

        sleep 5;

        _nearest = nearestObjects [position _this, ["CAManBase"], 25] - [_this];

        {
            if (alive _x && {[side _x, east] call BIS_fnc_areEqual}) exitWith {
                [_this] joinSilent (group _x);
            };
        } forEach _nearest;
    };
};

if !(isNil QMODULE(accolade)) then {
    _unit addEventHandler ["Killed", {
        private ["_unit", "_killer"];

        PARAMS_2(_unit, _killer);

        if !([_killer] call FUNC(common,ready)) exitWith {};

        [["special", "Intermediate"], [getPlayerUID _killer, name _killer]] call FUNC(accolade,set);
    }];
};

_unit