#define THIS_MODULE construction
#include "x_macros.sqf"
private ["_name", "_type", "_amount", "_cooldown", "_checks", "_position", "_object"];

PARAMS_1(_name);

_type = [player getVariable (format ["d_%1_type", toLower _name])] call FUNC(THIS_MODULE,type);

_amount = format ["d_construction_%1", toLower _name];
_cooldown = format ["d_construction_%1_time_cooldown", toLower _name];

_checks = [
    [
        [_name, "constructed", "as you have none left"],
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
        [GVAR(construction_distance_base), "away from base"]
    ] call FUNC(helper,distanceFrom),

    [
        [_name, "constructed"],
        position player,
        _type select 0,
        [GVAR(construction_distance_identical), "away from another"]
    ] call FUNC(helper,nearObject),

    [
        [_name, "constructed"]
    ] call FUNC(helper,inAir),

    [
        [_name, "constructed"]
    ] call FUNC(helper,inVehicle)
];

{
    if ([typeName _x, "STRING"] call BIS_fnc_areEqual) exitWith {
        [_x] call FUNC(client,hint);
    };
} forEach _checks;

if ({[_x, true] call BIS_fnc_areEqual} count _checks < count _checks) exitWith {};

_position = player modelToWorld [0, 5, 0];
_position set [2, 0.1];

_object = createVehicle [_type select 0, [_position select 0, _position select 1, -100], [], 0, "CAN_COLLIDE"];
_object setDir ((getDir player) - (_type select 1));

if !([] call FUNC(client,stall)) exitWith {
    deleteVehicle _object;
};

[true, "execVM", [[_object], __function(protect)]] call FUNC(network,mp);

_object setVariable [QGVAR(deconstructing), false];

_object setPosATL _position;
_object setVectorUp surfaceNormal _position;

_object addAction [
    "Deconstruct" call FUNC(common,RedText),
    __function(deconstruct),
    [_amount, _cooldown],
    10,
    false,
    true,
    "",
    "alive _target && {[player, vehicle player] call BIS_fnc_areEqual && {!(_target getVariable 'd_deconstructing')}}"
];

if (_object isKindOf "StaticWeapon") then {
    [true, "execVM", [[_object], FUNCTION(vehicle,handle)]] call FUNC(network,mp);
};

switch (typeOf _object) do {
    case "US_WarfareBVehicleServicePoint_Base_EP1": {
        [true, "setAmmoCargo", [_object, 0]] call FUNC(network,mp);
    };

    if !(isNil QMODULE(construction_nest)) then {
        case "WarfareBMGNest_M240_US_EP1": {
            [true, "setVehicleAmmo", [_object, player getVariable QGVAR(nest_ammo)]] call FUNC(network,mp);
        };
    };
};

[gameLogic, "spawn", [[_object], {
    private ["_object"];

    PARAMS_1(_object);

    gameLogic setVariable [
        QGVAR(constructed),
        (gameLogic getVariable QGVAR(constructed)) + [[_object, call FUNC(common,time) + GVAR(construction_time_lifetime)]]
    ];
}]] call FUNC(network,mp);

[_amount, _cooldown] call FUNC(THIS_MODULE,consume);