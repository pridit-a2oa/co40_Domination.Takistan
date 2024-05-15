#include "x_macros.sqf"
private ["_object"];

PARAMS_1(_object);

_object addEventHandler ["HandleDamage", {
    private ["_unit", "_selection", "_damage", "_injurer", "_projectile"];

    PARAMS_5(_unit, _selection, _damage, _injurer, _projectile);

    switch (true) do {
        case (_projectile in GVAR(mission_main_type_projectiles));
        case (_injurer distance _unit > 100 && {_injurer isKindOf "CAManBase" && {[_projectile, "R_"] call KRON_StrInStr}});
        case (_injurer distance _unit > 150 && {true in [_injurer isKindOf "Car", _injurer isKindOf "Tank"]});
        case (_injurer distance _unit > 300 && {_injurer isKindOf "Air" && {!([_projectile, "Bo_"] call KRON_StrInStr)}}): {
            0
        };

        default {
            _damage
        };
    };
}];