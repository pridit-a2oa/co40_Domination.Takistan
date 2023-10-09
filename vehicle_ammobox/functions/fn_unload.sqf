#define THIS_MODULE vehicle_ammobox
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(typeOf _vehicle in GVAR(vehicle_ammobox_types)) exitWith {};

if !(isNil QMODULE(ammobox)) then {
    private ["_position"];

    _position = _vehicle modelToWorld [6, 0, 0];

    [gameLogic, "execVM", [
        [
            faction _vehicle,
            [_position select 0, _position select 1, 0],
            direction _vehicle,
            false
        ],
        FUNCTION(ammobox,create)
    ]] call FUNC(network,mp);
};

_vehicle setVariable [QGVAR(ammobox), false, true];