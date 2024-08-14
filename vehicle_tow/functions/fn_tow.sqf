/**
 * Original Author: rundll.exe
 * http://www.armaholic.com/page.php?id=8168
 */

#define THIS_MODULE vehicle_tow
#include "x_macros.sqf"
private ["_vehicle", "_tow"];

PARAMS_1(_vehicle);

if !(isServer) exitWith {
    [gameLogic, "execVM", [_this, __function(tow)]] call FUNC(network,mp);
};

_tow = _this select 3;

_tow setVariable [QGVAR(towed), true, true];
_vehicle setVariable [QGVAR(towing), _tow, true];

_offset = [typeOf _tow] call FUNC(vehicle,offsetTow);
_axis = (_offset select 0) + [0];
_wheel = (_offset select 1) + [0];

[true, "setVectorUp", [_tow, surfaceNormal (position _tow)]] call FUNC(network,mp);

_tow setDir (getDir _vehicle);

while {alive _tow && {_tow getVariable QGVAR(towed)}} do {
    _aTpos = _vehicle modelToWorld [0, -2, 0];
    _aPpos = _tow modelToWorld _axis;
    _wheelPpos = _tow modelToWorld _wheel;

    //get the x and y length of the difference vector
    _dx_axis = (_aTpos select 0) - (_aPpos select 0);
    _dy_axis = (_aTpos select 1) - (_aPpos select 1);
    _d_axis = sqrt(_dx_axis^2 + _dy_axis^2);//absolute length of diff vector

    if (_d_axis > 0.05) then {
        //get global distance between the T axis and P wheelpos
        _dx = (_aTpos select 0) - (_wheelPpos select 0);
        _dy = (_aTpos select 1) - (_wheelPpos select 1);
        _dirdeg = _dx atan2 _dy; //convert to direction in deg

        [_tow, "setVectorDir", [_dx, _dy, 0]] call FUNC(network,mp); //set the direction of P, preserving pitch and bank

        //velocity implementation (smoother but elastic)
        _dirdeg_axis = _dx_axis atan2 _dy_axis; //get the direction of the difference vector
        _speed = _d_axis * 4; //control the speed needed to make this distance smaller TWEAK HERE Higher value means less elasticty, but more choppy.
        _speed = _speed min 15; //set max speed for safety.
        _Pvel = velocity _tow;

        sleep 0.1;

        [_tow, "setVelocity", [
            (sin _dirdeg_axis * _speed),
            (cos _dirdeg_axis * _speed),
            (_Pvel select 2)
        ]] call FUNC(network,mp); //set the velocity in the correct direction

        [true, "execVM", [
            [_vehicle, GVAR(vehicle_tow_amount_speed)],
            FUNCTION(vehicle,speed)
        ]] call FUNC(network,mp);
    };
};

[nil, _vehicle, "per", rRemoveAction, "vehicleDetach"] call RE;