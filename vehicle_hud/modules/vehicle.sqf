/**
 * Vehicle HUD - Vehicle Submodule
 */

#define THIS_MODULE vehicle_hud
#include "x_macros.sqf"
private ["_vehicle"];
PARAMS_1(_vehicle);

if (_vehicle isKindOf "Helicopter" || {typeOf _vehicle == "MV22"}) then {
    _vehicle addEventHandler ["getin", {
        67322 cutRsc ["XD_VehicleHudDialog", "PLAIN"];
        
        if (!isNil QUOTE(MODULE(vehicle_ammobox))) then {
            [(_this select 0)] __submodule(vehicle_ammobox);
        };

        if (!isNil QUOTE(MODULE(vehicle_lift))) then {
            [(_this select 0)] __submodule(vehicle_lift);
        };

        if (!isNil QUOTE(MODULE(vehicle_wreck))) then {
            [(_this select 0)] __submodule(vehicle_wreck);
        };
    }];

    _vehicle addEventHandler ["getout", {
        67322 cutRsc ["Default", "PLAIN"];
    }];
};