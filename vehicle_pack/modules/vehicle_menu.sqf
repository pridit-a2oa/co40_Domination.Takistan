/**
 * Vehicle Pack Module - Vehicle Menu Submodule
 */

#define THIS_MODULE vehicle_pack
#include "x_macros.sqf"
private ["_vehicle", "_packed"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_pack_types) find (typeOf _vehicle) == -1) exitWith {false};

_packed = _vehicle getVariable QGVAR(packed);

[
    format [
        "%1: %2",
        if (_vehicle isKindOf "Plane") then {
            __localize("Wings")
        } else {
            __localize("MainRotor")
        },
        if (!isNil "_packed" && {_packed}) then {
            __localize("Unfold")
        } else {
            __localize("Fold")
        }
    ],
    "pack"
] call FUNC(vehicle_menu,populate);

true