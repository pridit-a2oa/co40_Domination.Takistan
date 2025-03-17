#define THIS_MODULE vehicle_upgrade
#include "x_macros.sqf"
private ["_vehicle", "_type", "_name", "_checks"];

PARAMS_2(_vehicle, _type);

_name = [typeOf _vehicle] call FUNC(vehicle,name);
_checks = [
    [
        [format ["%1 upgrade", _name], "performed"],
        markerPos QGVAR(base_south),
        position _vehicle,
        [GVAR(vehicle_upgrade_distance_base), "within", "of base"]
    ] call FUNC(helper,distanceFrom),

    [
        [format ["%1 upgrade", _name], "performed"],
        _vehicle
    ] call FUNC(helper,isOccupied),

    [
        [format ["%1 upgrade", _name], "performed"],
        _vehicle
    ] call FUNC(helper,isDamaged)
];

if (hasInterface) then {
    if (isNil "_type") then {
        _type = (player getVariable QGVAR(vehicle_upgrade_type)) select 1;

        _this set [1, _type];
    };

    {
        [_checks, _x] call BIS_fnc_arrayPush;
    } forEach [
        [
            format ["%1 upgrade", _name],
            _vehicle getVariable QGVAR(upgrade)
        ] call FUNC(helper,inProgress),

        [
            [format ["%1 upgrade", _name], "performed"],
            player getVariable QGVAR(vehicle_upgrade_cooldown)
        ] call FUNC(helper,timeExceeded)
    ];

    {
        if ([typeName _x, "STRING"] call BIS_fnc_areEqual) exitWith {
            [_x] call FUNC(client,hint);
        };
    } forEach _checks;

    if ({[_x, true] call BIS_fnc_areEqual} count _checks < count _checks) exitWith {};

    _vehicle setVariable [QGVAR(upgrade), true, true];

    if !([[true, 2, QGVAR(sound_wrench)]] call FUNC(client,stall) && {alive _vehicle}) exitWith {
       _vehicle setVariable [QGVAR(upgrade), false, true];
    };

    player setVariable [QGVAR(vehicle_upgrade_cooldown), time + GVAR(vehicle_upgrade_time_cooldown)];

    if !(isServer) then {
        [gameLogic, "execVM", [_this, __function(upgrade)]] call FUNC(network,mp);
    };
};

if (isServer && {[{[_x, true] call BIS_fnc_areEqual} count _checks, count _checks] call BIS_fnc_areEqual}) then {
    private ["_fuel", "_damage", "_new"];

    if !(alive _vehicle) exitWith {};

    __log format ["%1 -> %2", [typeOf _vehicle] call FUNC(vehicle,name), [_type] call FUNC(vehicle,name)]];

    _fuel = fuel _vehicle;
    _damage = damage _vehicle;

    _new = [
        _vehicle,
        [(position _vehicle) select 0, (position _vehicle) select 1, 0],
        direction _vehicle,
        _type
    ] call FUNC(vehicle,respawn);

    _new setFuel _fuel;
    _new setDamage _damage;

    [true, "execVM", [[_new], FUNCTION(vehicle,handle)]] call FUNC(network,mp);
};