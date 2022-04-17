/**
 * Vehicle Loadout Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_loadout
#include "x_macros.sqf"
private ["_vehicle", "_loadout"];

PARAMS_1(_vehicle);

_loadout = ([0, GVAR(vehicle_loadout_types)] call FUNC(common,arrayValues)) find (typeOf _vehicle);

if (_loadout == -1) exitWith {};

if (hasInterface) then {
    private ["_handler"];

    _handler = _vehicle addEventHandler ["getin", {
        _this spawn {
            private ["_vehicle", "_position", "_unit"];

            PARAMS_3(_vehicle, _position, _unit);

            sleep 2.5;

            if (_position != "driver" || {_unit != player} || {driver _vehicle != player}) exitWith {};

            format ["%1 Weapons", [typeOf (_this select 0)] call FUNC(vehicle,name)] hintC [
                "This vehicle has had a significant experimental armament change. Things may break or not work correctly.",
                "The armament it now has is not final and will likely be tweaked.",
                "Report bugs on Discord."
            ];

            _vehicle removeEventHandler ["getin", (_vehicle getVariable QGVAR(message))];
        };
    }];

    _vehicle setVariable [QGVAR(message), _handler];
};

if (isServer) then {
    [_vehicle] call FUNC(THIS_MODULE,set);

    sleep 1;
    
    [_vehicle] call FUNC(THIS_MODULE,addMagazines);

    sleep 1;
    
    [_vehicle] call FUNC(THIS_MODULE,addWeapons);
};