#define THIS_MODULE construction
#include "x_macros.sqf"
private ["_name", "_type", "_cooldown", "_checks", "_position", "_object"];

PARAMS_1(_name);

_type = call FUNC(THIS_MODULE,type);
_cooldown = format ["d_%1_cooldown", toLower(_name)];

_checks = [
    [
        [_name, "constructed"],
        position player,
        markerPos QGVAR(base_marker),
        [GVAR(construction_distance_base), "in excess of", "from base"]
    ] call FUNC(helper,distanceFrom),
    
    [
        [_name, "constructed"],
        position player,
        _type,
        [GVAR(construction_distance_identical), "in excess of", "from another"]
    ] call FUNC(helper,nearObject),
    
    [
        [_name, "constructed"],
        player getVariable (format [QUOTE(%1), _cooldown])
    ] call FUNC(helper,timeExceeded),
    
    [
        [_name, "constructed"]
    ] call FUNC(helper,inVehicle)
];

{
    if (typeName _x == "STRING") exitWith {
        hint _x;
    };
} forEach _checks;

if ({str (_x) == "true"} count _checks < count _checks) exitWith {};

player setVariable [QGVAR(_name), (player getVariable QGVAR(_name)) - 1];
player setVariable [format [QUOTE(%1), _cooldown], time + (call compile _cooldown)];

player playMove "AinvPknlMstpSlayWrflDnon_medic";

sleep 7;

_position = player modelToWorld [0, 7, 0];

_object = _type createVehicle _position;
_object setDir ((getDir player) - 180);
_object setPos _position;

[nil, nil, rExecVM, __function(action), _name, _object] call RE;