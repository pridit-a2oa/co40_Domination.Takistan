#define THIS_MODULE intel
#include "x_macros.sqf"
private ["_parent", "_objects"];

PARAMS_1(_parent);

if !((typeOf _parent) in GVAR(intel_type_objects)) exitWith {};
if ((position _parent) distance (markerPos QGVAR(base_south)) < 1000) exitWith {};
if !(GVAR(intel_chance_spawn) > floor (random 100)) exitWith {};

_objects = [];

{
    private ["_offset", "_object"];

    _offset = [typeOf _parent] call FUNC(THIS_MODULE,offset);

    if ([_x, GVAR(intel_type_item)] call BIS_fnc_areEqual && {isClass (configFile >> "CfgVehicles" >> "MV22" >> "UserActions")}) then {
        _offset = [0, 0, -1];
    };

    _object = createVehicle [_x, getPosATL _parent, [], 0, "CAN_COLLIDE"];
    _object setDir (random 360);
    _object setPos (_parent modelToWorld _offset);

    if ([_x, "WeaponHolder"] call BIS_fnc_areEqual) then {
        _object addWeaponCargoGlobal [GVAR(intel_type_item), 1];

        [_parent, _object] spawn {
            private ["_parent", "_container", "_position"];

            PARAMS_2(_parent, _container);

            _position = position _container;

            waitUntil {sleep 2 + (random 0.5); {[_x select 0, GVAR(intel_type_item)] call BIS_fnc_areEqual} count (getWeaponCargo _container) < 1 || !alive _parent};

            deleteVehicle (nearestObject [_position, GVAR(intel_type_item)]);

            if !(alive _parent) exitWith {
                clearWeaponCargoGlobal _container;
            };

            __log format ["Found %1", GVAR(intel_type_item)]];
        };
    };

    [_objects, _object] call BIS_fnc_arrayPush;
} forEach [
    "WeaponHolder",
    GVAR(intel_type_item)
];

_objects