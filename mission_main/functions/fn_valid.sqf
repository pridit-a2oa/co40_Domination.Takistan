#include "x_macros.sqf"
private ["_flag", "_players", "_valid"];

PARAMS_2(_flag, _players);

_valid = true;

if (true) then {
    if (_players < 1) exitWith {_valid = false};
    if (east countSide (_flag nearEntities [["Man", "Car", "Tank", "StaticWeapon"], 75]) > _players) exitWith {_valid = false};
};

if !(_valid) exitWith {
    if (_flag getVariable QGVAR(capturing)) then {
        _flag setVariable [QGVAR(capturing), false];
    };

    if (_flag getVariable QGVAR(time) != 0) then {
        _flag setVariable [QGVAR(time), 0, true];
    };
};

if !(_flag getVariable QGVAR(capturing)) then {
    _flag setVariable [QGVAR(capturing), true];

    if (!isNil QMODULE(3d)) then {
        [true, "execVM", [
            [_flag, GVAR(mission_main_time_capture)],
            FUNCTION(3d,time)
        ]] call FUNC(network,mp);
    };
};

true