/**
 * Artillery Module (Handler)
 */

#define THIS_MODULE artillery
#include "x_macros.sqf"

if !(isServer) exitWith {};
if !(isNil QMODULE(base_artillery)) exitWith {};

BIS_ARTY_Logic = (group gameLogic) createUnit ["BIS_ARTY_Logic", [0, 0, 0], [], 0, "NONE"];

for "_i" from 1 to GVAR(artillery_amount_shell) do {
    private ["_cannon"];

    _cannon = (group gameLogic) createUnit ["BIS_ARTY_Virtual_Artillery", [0, 0, 0], [], 0, "NONE"];

    BIS_ARTY_Logic synchronizeObjectsAdd [_cannon];

    sleep 0.1;

    [_cannon, "M119"] call BIS_ARTY_F_SetVirtualGun;
};

[BIS_ARTY_Logic, true] call BIS_ARTY_F_SetShellSpawn;