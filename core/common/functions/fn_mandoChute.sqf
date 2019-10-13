/*
   mando_chute.sqf v1.1
   by Mandoble

   Moves a chute to the landing position
*/
private ["_parachute", "__object", "_target", "_radius", "_deg_sec", "_dir", "_ang", "_posASL", "_dif", "_difabs", "_turn", "_hspd", "_max_spd", "_deltatime", "_timeold", "_vx", "_vy", "_vh", "_vz", "_acc", "_cone", "_type", "_vvel", "_vdir", "_vup"];

_parachute = _this select 0;
_object = _this select 1;
_target = _this select 2;
_radius = _this select 3;

_ang = random 360;

_target = if (_radius == 0) then {
    [_target select 0, _target select 1, 0]
} else {
    [(_target select 0) + (sin _ang) * _radius, (_target select 1) + (cos _ang) * _radius, 0]
};

sleep 1;

_deg_sec = 30;
_max_spd = 4;
_hspd = _max_spd;
_acc = 2;
_vh = 0;
_vz = -3;

sleep 3;

_timeold = time;
_dir = getDir _parachute;

while {((getPos _object select 2) > 1)} do {
    _deltatime = (time - _timeold) max 0.001;
    _timeold = time;

    _posASL = getPosASL _object;
    _ang = ((_target select 0) - (_posASL select 0)) atan2 ((_target select 1) - (_posASL select 1));
    
    if (([_target select 0, _target select 1, 0] distance [_posASL select 0, _posASL select 1, 0]) > 10) then {
        if ((_vz + 0.5 * _deltatime) < -1.5) then {_vz = _vz + 0.5 * _deltatime};
    } else {
        if ((_vz - 0.5 * _deltatime) > -3) then {_vz = _vz - 0.5 * _deltatime};
    };

    _dif = (_ang - _dir);
    
    if (_dif < 0) then {_dif = 360 + _dif};
    if (_dif > 180) then {_dif = _dif - 360};
    
    _difabs = abs(_dif);
    
    _turn = if (_difabs > 0.01) then {_dif / _difabs} else {0};
    _dir = _dir + (_turn * ((_deg_sec * _deltatime) min _difabs));

    if (_vh < _hspd) then {
        _vh = _vh + (_acc * _deltatime);
    } else {
        if (_vh > _hspd) then {
            _vh = _vh - (_acc * _deltatime);
        };
    };
    
    _hspd = if (_difabs > 45) then {_max_spd / 3} else {_max_spd};

    _parachute setDir _dir;
    _parachute setVelocity [sin(_dir) * _vh, cos(_dir) * _vh, _vz];

    sleep 0.01;
};

detach _object;

deleteVehicle _parachute;