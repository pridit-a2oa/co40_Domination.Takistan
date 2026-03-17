#define THIS_MODULE accolade
#include "x_macros.sqf"
private ["_type", "_index", "_npc", "_unit", "_parent", "_holder"];

PARAMS_2(_type, _index);

_npc = (call compile format ["d_%1_%2_tasks", QUOTE(THIS_MODULE), _type]) select _index;

if !([count _npc, 2] call BIS_fnc_areEqual) exitWith {""};

_unit = (X_JIP getVariable QGVAR(accolades)) select (([0, GVAR(accolade_types)] call FUNC(common,arrayValues)) find _type);

{
    clearWeaponCargoGlobal _x;
} forEach (nearestObjects [position _unit, ["WeaponHolder"], 5]);

// TODO: Use better solution since engineer won't support this as we're just
// assuming the first index is a suitable parent.
_parent = call compile format ["d_%1_%2_objects", QUOTE(THIS_MODULE), _type];

if (!isNil QMODULE(item) && {!([_parent, []] call BIS_fnc_areEqual)}) then {
    _holder = (
        [
            (nearestObjects [position _unit, [(_parent select 0) select 0], 5]) select 0,
            _npc select 1
        ] call FUNC(item,create)
    ) select 0;
} else {
    _holder = createVehicle ["WeaponHolder", getPosATL _unit, [], 0, "CAN_COLLIDE"];
    _holder setDir (random 360);
    _holder setPosATL (getPosATL _unit);

    {
        _holder addWeaponCargoGlobal [_x, 1];
    } forEach (_npc select 1);
};

[true, "reveal", _holder] call FUNC(network,mp);

__log format ["Rewarded %1", _npc select 1]];

_holder