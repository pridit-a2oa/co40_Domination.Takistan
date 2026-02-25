#define THIS_MODULE item
#include "x_macros.sqf"
private ["_parent", "_item", "_offset", "_object"];

PARAMS_2(_parent, _item);

if !(hasInterface) exitWith {};

_offset = [typeOf _parent] call FUNC(THIS_MODULE,offset);

if (isClass (configFile >> "CfgVehicles" >> "MV22" >> "UserActions")) then {
    _offset = [0, 0, -1];
};

_object = _item createVehicleLocal (getPosATL _parent);
_object setDir (random 360);
_object setPos (_parent modelToWorld _offset);