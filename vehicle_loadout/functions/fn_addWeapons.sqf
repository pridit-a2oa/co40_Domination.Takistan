#define THIS_MODULE vehicle_loadout
#include "x_macros.sqf"
private ["_vehicle", "_weapons", "_paths"];

PARAMS_1(_vehicle);

_weapons = [0, (_vehicle getVariable QGVAR(loadout)) select 1] call FUNC(common,arrayValues);
_paths = [2, (_vehicle getVariable QGVAR(loadout)) select 1] call FUNC(common,arrayValues);

{
    private ["_weapon", "_path"];

    _weapon = if ([typeName _x, "ARRAY"] call BIS_fnc_areEqual) then {_x select 0} else {_x};
    _path = if (count _paths < (_forEachIndex + 1)) then {[-1]} else {_paths select _forEachIndex};

    if ([(weapons _vehicle) find _weapon, -1] call BIS_fnc_areEqual) then {
        sleep 0.1 + random 0.1;
        
        [
            [_vehicle, _path] call FUNC(vehicle,owner),
            "addWeaponTurret",
            [_vehicle, _weapon, _path]
        ] call FUNC(network,mp);
    };
} forEach _weapons;