#define THIS_MODULE base_rd
#include "x_macros.sqf"

disableSerialization;

createDialog "XD_BaseRdDialog";

[] call FUNC(THIS_MODULE,populate);

if !(isNil QMODULE(database)) then {
    private ["_expiration"];

    _expiration = GVAR(base_rd) getVariable QGVAR(expiration);

    if (isNil "_expiration") exitWith {};

    DIALOG("X_RD_DIALOG", 2000) ctrlSetText format [
        "Resets: %1",
        if !([_expiration, 1] call BIS_fnc_areEqual) then {
            format ["%1d", _expiration]
        } else {
            "next restart"
        }
    ];
};

DIALOG("X_RD_DIALOG", 100) lbSetCurSel 0;