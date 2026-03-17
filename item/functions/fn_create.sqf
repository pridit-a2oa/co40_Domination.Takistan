#define THIS_MODULE item
#include "x_macros.sqf"
private ["_parent", "_override", "_types", "_objects", "_holder", "_item"];

PARAMS_1(_parent);

_override = [_this, 1, []] call FUNC(common,param);

if ([_override, []] call BIS_fnc_areEqual && {(position _parent) distance (markerPos QGVAR(base_south)) < 1000}) exitWith {[]};

_types = [];

{
    if (_x select 1 in _override) exitWith {
        _types = _types + [_x];
    };

    if ([_override, []] call BIS_fnc_areEqual && {typeOf _parent in ((GVAR(item_types) select _forEachIndex) select 2)}) then {
        _types = _types + [_x];
    };
} forEach (GVAR(item_types) call FUNC(common,arrayShuffle));

if ([count _types, 0] call BIS_fnc_areEqual) exitWith {[]};

_objects = [];

{
    private ["_chance"];

    if ([_override, []] call BIS_fnc_areEqual) then {
        _chance = (call compile format ["d_%1_%2_chance", QUOTE(THIS_MODULE), toLower (_x select 0)]) > (floor (random 100));
    };

    if (isNil "_chance" || {_chance}) exitWith {
        // Holder
        _offset = [typeOf _parent] call FUNC(THIS_MODULE,offset);

        _object = createVehicle ["WeaponHolder", getPosATL _parent, [], 0, "CAN_COLLIDE"];
        _object setDir (random 360);
        _object setPos (_parent modelToWorld _offset);

        [_objects, _object] call BIS_fnc_arrayPush;

        _holder = _object;

        // Item
        _item = _x;

        _holder addWeaponCargoGlobal [_item select 1, 1];

        [true, "execVM", [[_parent, _item select 1], __function(model)]] call FUNC(network,mp);

        X_JIP setVariable [
            QGVAR(item_objects),
            (X_JIP getVariable QGVAR(item_objects)) + [[_parent, _item select 1]],
            true
        ];
    };
} forEach _types;

if (isNil "_item") exitWith {[]};

[_parent, _item, _holder, _override] spawn {
    private ["_parent", "_item", "_holder", "_override", "_position", "_objects"];

    PARAMS_4(_parent, _item, _holder, _override);

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

    if (!isNil QMODULE(accolade) && {[_item select 1, "EvMap"] call BIS_fnc_areEqual}) then {
        if !([_override, []] call BIS_fnc_areEqual) exitWith {};

        {
            [["special", "Novice"], _x] call FUNC(accolade,set);
        } forEach ([_position, 10] call FUNC(server,nearPlayers));
    };

    [true, "spawn", [[_position, _item select 1], {
        if !(hasInterface) exitWith {};

        deleteVehicle (nearestObject _this);
    }]] call FUNC(network,mp);

    if !(alive _parent) exitWith {
        clearWeaponCargoGlobal _holder;
    };

    if !([_override, []] call BIS_fnc_areEqual) exitWith {};

    __log format ["Found %1", _item select 0]];
};

_objects