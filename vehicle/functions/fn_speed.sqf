//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: kylania
//////////////////////////////////////////////////////////////////

// Call this with the following line in the init field of the vehicle.
// this = object to slow.
// 60 = max speed for vehicle.
//
// null = [this, 60] execVM "speedlimit.sqf";

_vehicle = _this select 0;
_maxspeed = _this select 1;

_curspeed = speed _vehicle;

if (_curspeed > _maxspeed) then {
    // Grab the current velocity and direction of the vehicle.
    _vel = velocity _vehicle;
    _dir = direction _vehicle;

    // Limit it's to bring it back down to the max amount.
    _speed = _curspeed - _maxspeed;

    // This is math I don't understand, grabbed it from the biki. :)
    _vehicle setVelocity [(_vel select 0)-(sin _dir*_speed),(_vel select 1)- (cos _dir*_speed),(_vel select 2)];
};

sleep 0.01;