/**
 * Base Protection Module (Handler)
 */

#define THIS_MODULE base_protection
#include "x_macros.sqf"

if (hasInterface) then {
    player addEventHandler ["fired", {
        private ["_unit", "_magazine", "_projectile"];

        _unit = _this select 0;
        _magazine = _this select 5;
        _projectile = _this select 6;

        if !(_magazine in GVAR(base_protection_projectiles_player)) exitWith {};

        switch (true) do {
            case ((position _unit) select 2 > 1): {
                deleteVehicle _projectile;
            };

            case !([{!(true in [_x isKindOf "CAManBase", _x isKindOf "ATV_Base_EP1", _x isKindOf "TT650_Base"]) && {side _x in [west, civilian]}} count nearestObjects [_unit, ["AllVehicles", "USVehicleBox_EP1"], 20], 0] call BIS_fnc_areEqual);
            case ((position _unit) distance (markerPos QGVAR(base_south)) <= GVAR(base_protection_distance)): {
                deleteVehicle _projectile;

                [gameLogic, "spawn", [[_unit, _magazine], {
                    private ["_unit", "_magazine", "_holder", "_object"];

                    PARAMS_2(_unit, _magazine);

                    if !([_unit] call FUNC(common,ready)) exitWith {};

                    _holder = nearestObjects [_unit, ["WeaponHolder"], 5];

                    if ([count _holder, 0] call BIS_fnc_areEqual) then {
                        _object = createVehicle ["WeaponHolder", getPosATL _unit, [], 0, "CAN_COLLIDE"];
                        _object setDir (direction _unit);
                        _object setPosATL (_unit modelToWorld [0, 0.5, 0]);

                        [true, "reveal", _object] call FUNC(network,mp);
                    } else {
                        _object = _holder select 0;
                    };

                    _object addMagazineCargoGlobal [_magazine, 1];

                    __log format [
                        "Disallowed %1 (%2)",
                        getText (configFile >> "CfgMagazines" >> _magazine >> "displayName"),
                        name _unit
                    ]];
                }]] call FUNC(network,mp);
            };

            default {};
        };
    }];
};