#define THIS_MODULE item
#include "x_macros.sqf"
private ["_parent", "_types", "_objects", "_holder", "_item"];

PARAMS_1(_parent);

if ((position _parent) distance (markerPos QGVAR(base_south)) < 1000) exitWith {};

_types = [
    ["", "WeaponHolder", []]
];

{
    if (typeOf _parent in ((GVAR(item_types) select _forEachIndex) select 2)) then {
        _types = _types + [_x];
    };
} forEach (GVAR(item_types) call FUNC(common,arrayShuffle));

if ([count _types, 1] call BIS_fnc_areEqual) exitWith {};

_objects = [];

{
    private ["_object"];

    if (!([_x select 0, ""] call BIS_fnc_areEqual) && {!((call compile format ["d_%1_%2_chance", QUOTE(THIS_MODULE), toLower (_x select 0)]) > floor (random 100))}) exitWith {};
    if (!isNil "_holder" && {[count ([0, getWeaponCargo _holder] call FUNC(common,arrayValues)), 2] call BIS_fnc_areEqual}) exitWith {};

    switch (true) do {
        case ([_x select 1, "WeaponHolder"] call BIS_fnc_areEqual): {
            private ["_offset"];

            _offset = [typeOf _parent] call FUNC(THIS_MODULE,offset);

            _object = createVehicle [_x select 1, getPosATL _parent, [], 0, "NONE"];
            _object setDir (random 360);
            _object setPos (_parent modelToWorld _offset);

            _holder = _object;

            [_objects, _holder] call BIS_fnc_arrayPush;
        };

        default {
            _item = _x;

            [true, "execVM", [[_parent, _item select 1], __function(model)]] call FUNC(network,mp);

            X_JIP setVariable [
                QGVAR(item_objects),
                (X_JIP getVariable QGVAR(item_objects)) + [[_parent, _item select 1]],
                true
            ];

            _holder addWeaponCargoGlobal [_item select 1, 1];
        };
    };
} forEach _types;

if !(isNil "_item") then {
    [_parent, _item, _holder] spawn {
        private ["_parent", "_item", "_holder", "_position", "_objects"];

        PARAMS_3(_parent, _item, _holder);

        _position = position _holder;

        waitUntil {
            sleep 2 + (random 0.5);

            [count ([0, getWeaponCargo _holder] call FUNC(common,arrayValues)), 0] call BIS_fnc_areEqual || {!alive _parent}
        };

        _objects = X_JIP getVariable QGVAR(item_objects);

        X_JIP setVariable [
            QGVAR(item_objects),
            [
                _objects,
                ([_objects, _parent] call BIS_fnc_findNestedElement) select 0
            ] call FUNC(common,deleteAt),
            true
        ];

        [true, "spawn", [[_position, _item select 1], {
            if !(hasInterface) exitWith {};

            deleteVehicle (nearestObject _this);
        }]] call FUNC(network,mp);

        if !(alive _parent) exitWith {
            clearWeaponCargoGlobal _holder;
        };

        __log format ["Found %1", _item select 0]];
    };
} else {
    _objects = _objects - [_holder];

    _holder setDamage 1;

    deleteVehicle _holder;
};

_objects