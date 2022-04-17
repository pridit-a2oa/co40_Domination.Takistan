#include "x_macros.sqf"
private ["_vehicle", "_types"];

PARAMS_2(_vehicle, _types);

if (isNil "_types") then {
    _types = ["magazines", "weapons"];
};

{
    switch (_x) do {
        case "magazines": {
            private ["_magazines"];

            _magazines = [
                _vehicle magazinesTurret [-1],
                _vehicle magazinesTurret [0]
            ];

            {
                private ["_path"];

                _path = [_forEachIndex - 1];

                {
                    [
                        [_vehicle, _path] call FUNC(vehicle,owner),
                        "removeMagazinesTurret",
                        [_vehicle, _x, _path]
                    ] call FUNC(network,mp);
                } forEach (_magazines select _forEachIndex);
            } forEach _magazines;
        };

        case "weapons": {
            private ["_weapons"];

            _weapons = [
                _vehicle weaponsTurret [-1],
                _vehicle weaponsTurret [0]
            ];

            {
                private ["_path"];

                _path = [_forEachIndex - 1];

                {
                    [
                        [_vehicle, _path] call FUNC(vehicle,owner),
                        "removeWeaponTurret",
                        [_vehicle, _x, _path]
                    ] call FUNC(network,mp);
                } forEach (_weapons select _forEachIndex);
            } forEach _weapons;
        };
    };
} forEach _types;