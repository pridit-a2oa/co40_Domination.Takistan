#define THIS_MODULE construction
#include "x_macros.sqf"
private ["_name", "_type", "_amount", "_cooldown", "_checks", "_position", "_object"];

PARAMS_1(_name);

_type = call FUNC(THIS_MODULE,type);
_amount = format ["d_%1", toLower(_name)];
_cooldown = format ["d_%1_cooldown", toLower(_name)];

_checks = [
    [
        [_name, "constructed"],
        player getVariable (format [QUOTE(%1), _amount]),
        1
    ] call FUNC(helper,greaterThan),
    
    [
        [_name, "constructed"],
        player getVariable (format [QUOTE(%1), _cooldown])
    ] call FUNC(helper,timeExceeded),
    
    [
        [_name, "constructed"],
        position player,
        markerPos QGVAR(base_south),
        [GVAR(construction_distance_base), "in excess of", "from base"]
    ] call FUNC(helper,distanceFrom),
    
    [
        [_name, "constructed"],
        position player,
        _type,
        [GVAR(construction_distance_identical), "in excess of", "from another"]
    ] call FUNC(helper,nearObject),
    
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

player playMove "AinvPknlMstpSlayWrflDnon_medic";

_position = player modelToWorld [0, 7, 0];

_object = createVehicle [_type, [_position select 0, _position select 1, -15], [], 0, "CAN_COLLIDE"];
_object setDir ((getDir player) - 180);

sleep 7;

if (!alive player || {lifeState player == "UNCONSCIOUS"}) exitWith {
    deleteVehicle _object;
};

_object setPos _position;
_object setVariable [QGVAR(deconstructing), false];

_object addEventHandler ["HandleDamage", {0}];
_object addAction ["Deconstruct" call FUNC(common,RedText), __function(deconstruct), [_amount, _cooldown], 2, false, true, "", "!(_target getVariable 'd_deconstructing')"];

[nil, nil, rExecVM, __function(action), _name, _object] call RE;

X_JIPH setVariable [QGVAR(constructed), (X_JIPH getVariable QGVAR(constructed)) + [[_object, call FUNC(common,time) + GVAR(construction_time_lifetime)]], true];

[_amount, _cooldown] call FUNC(THIS_MODULE,consume);