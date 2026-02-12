#include "x_macros.sqf"
private ["_group"];

PARAMS_1(_group);

if (!isNil QMODULE(communication)) then {
    BIS_MENU_Squad = [
        ["Squad", false]
    ];

    {
        [
            BIS_MENU_Squad,
            format ["Join %1", GVAR(group_names) select _forEachIndex],
            if ([str _group, GVAR(group_names) select _forEachIndex] call KRON_StrInStr) then {"0"} else {"1"},
            format ["[player] joinSilent ((X_JIP getVariable 'd_squads') select %1); [100] call d_fnc_client_reveal; [(X_JIP getVariable 'd_squads') select %1] call d_fnc_squad_populate", _forEachIndex]
        ] call FUNC(communication,add);
    } forEach (X_JIP getVariable QGVAR(squads));

    BIS_MENU_Squad = BIS_MENU_Squad + [
        ["", [(count BIS_MENU_Squad) + 1], "", -1, [["expression", ""]], "1", "1"]
    ];

    [
        BIS_MENU_Squad,
        "Leave",
        "",
        "[player] joinSilent grpNull; [100] call d_fnc_client_reveal; [0] call d_fnc_squad_populate"
    ] call FUNC(communication,add);
};