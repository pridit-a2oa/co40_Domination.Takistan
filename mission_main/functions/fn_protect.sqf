#include "x_macros.sqf"
private ["_type", "_object"];

PARAMS_2(_type, _object);

_object setVariable [QGVAR(type), _type];

_object addEventHandler ["HandleDamage", {
    private ["_unit", "_selection", "_damage", "_injurer", "_projectile", "_type"];

    PARAMS_5(_unit, _selection, _damage, _injurer, _projectile);

    _type = _unit getVariable QGVAR(type);

    switch (true) do {
        case (_projectile in GVAR(mission_main_type_projectiles));
        case (_injurer distance _unit > 100 && {_injurer isKindOf "CAManBase" && {!([_projectile, "PipeBomb"] call BIS_fnc_areEqual)}});
        case (_injurer distance _unit > 150 && {true in [_injurer isKindOf "Car", _injurer isKindOf "Tank"]});
        case (_injurer distance _unit > 300 && {_injurer isKindOf "Air" && {!([_projectile, "Bo_"] call KRON_StrInStr)}}): {
            0
        };

        case ([_type, "radio"] call BIS_fnc_areEqual && {[_projectile, "ARTY_Sh_105_HE"] call BIS_fnc_areEqual}): {
            if !(isNil QMODULE(artillery)) then {
                private ["_killer"];

                _killer = gameLogic getVariable QGVAR(artillery_unit);

                if (_damage < 1) exitWith {};
                if ([_killer, []] call BIS_fnc_areEqual) exitWith {};

                gameLogic setVariable [QGVAR(artillery_unit), []];

                if !(isNil QMODULE(accolade)) then {
                    [["combat", "Intermediate"], _killer] call FUNC(accolade,set);
                };
            };

            _damage
        };

        default {
            _damage
        };
    };
}];