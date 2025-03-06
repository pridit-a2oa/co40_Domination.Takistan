#define THIS_MODULE common
#include "x_macros.sqf"
private ["_entity", "_expression"];

PARAMS_1(_entity);

_expression = {
    private ["_unit", "_killer", "_crew"];

    PARAMS_2(_unit, _killer);

    switch (true) do {
        case !(isServer);
        case (_unit isKindOf "StaticWeapon");
        case (_unit getVariable QGVAR(killed));
        case (count crew _unit > 0 && {{!isPlayer _x} count crew _unit > 0}): {};

        default {
            _unit setVariable [QGVAR(killed), true];

            _crew = [_unit] call FUNC(vehicle,crew);

            __log format [
                "Destroyed %1 {""killer"":""%2""%3}",
                [typeOf _unit] call FUNC(vehicle,name),
                if (isPlayer _killer) then {name _killer} else {side _killer},
                if ([_crew, ""] call BIS_fnc_areEqual) then {
                    ""
                } else {
                    format [",""occupants"":""%1""", _crew]
                }
            ]];
        };
    };
};

_entity addEventHandler ["Killed", _expression];
_entity addMPEventHandler ["MPKilled", _expression];