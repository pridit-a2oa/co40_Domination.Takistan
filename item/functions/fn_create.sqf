#define THIS_MODULE item
#include "x_macros.sqf"
private ["_parent", "_item", "_objects"];

PARAMS_1(_parent);

_item = [GVAR(item_types), typeOf _parent] call BIS_fnc_findNestedElement;

if ([_item, []] call BIS_fnc_areEqual) exitWith {};

_item = GVAR(item_types) select (_item select 0);

if ((position _parent) distance (markerPos QGVAR(base_south)) < 1000) exitWith {};
if !((call compile format ["d_%1_%2_chance", QUOTE(THIS_MODULE), toLower (_item select 0)]) > floor (random 100)) exitWith {};

_objects = [];

{
    private ["_offset", "_object"];

    _offset = [typeOf _parent] call FUNC(THIS_MODULE,offset);

    if ([_x, _item select 1] call BIS_fnc_areEqual && {isClass (configFile >> "CfgVehicles" >> "MV22" >> "UserActions")}) then {
        _offset = [0, 0, -1];
    };

    _object = createVehicle [_x, getPosATL _parent, [], 0, "CAN_COLLIDE"];
    _object setDir (random 360);
    _object setPos (_parent modelToWorld _offset);

    if ([_x, "WeaponHolder"] call BIS_fnc_areEqual) then {
        _object addWeaponCargoGlobal [_item select 1, 1];

        [_item, _parent, _object] spawn {
            private ["_item", "_parent", "_container", "_position"];

            PARAMS_3(_item, _parent, _container);

            _position = position _container;

            waitUntil {
                sleep 2 + (random 0.5);

                {[_x select 0, _item select 1] call BIS_fnc_areEqual} count (getWeaponCargo _container) < 1 || !alive _parent
            };

            deleteVehicle (nearestObject [_position, _item select 1]);

            if !(alive _parent) exitWith {
                clearWeaponCargoGlobal _container;
            };

            __log format ["Found %1", _item select 0]];
        };
    };

    [_objects, _object] call BIS_fnc_arrayPush;
} forEach [
    "WeaponHolder",
    _item select 1
];

_objects