#include "x_macros.sqf"

if !(isNil QMODULE(communication)) then {
    BIS_MENU_AdminCaptive = [
        ["Captive", false]
    ];

    {
        [
            BIS_MENU_AdminCaptive,
            _x,
            format ["%1", if !(captive player) then {abs (_forEachIndex - 1)} else {0 max _forEachIndex}],
            format ["player setCaptive %1; call d_fnc_admin_captive_populate", abs (_forEachIndex - 1)]
        ] call FUNC(communication,add);
    } forEach [
        "Enable",
        "Disable"
    ];
};