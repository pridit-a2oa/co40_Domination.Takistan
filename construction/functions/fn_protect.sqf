#include "x_macros.sqf"
private ["_object"];

PARAMS_1(_object);

_object addEventHandler ["HandleDamage", {
    private ["_unit", "_part", "_damage", "_injurer", "_projectile"];

    PARAMS_5(_unit, _part, _damage, _injurer, _projectile);

    switch (true) do {
        case ([_projectile, "PipeBomb"] call BIS_fnc_areEqual);
        case ([side (group _injurer), west] call BIS_fnc_areEqual): {
            0
        };

        default {_damage};
    };
}];