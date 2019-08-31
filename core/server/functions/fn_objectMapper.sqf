/*
    File: objectMapper.sqf
    Author: Joris-Jan van 't Land

    Description:
    Takes an array of data about a dynamic object template and creates the objects.

    Parameter(s):
    _this select 0: side (to determine crew to spawn) - Side
    _this select 1: position of the template - Array [X, Y, Z]
    _this select 2: azimuth of the template in degrees - Number 
    _this select 3: objects for the template - Array / composition class - String / tag list - Array
    _this select 4: (optional) randomizer value (how much chance each object has of being created. 0.0 is 100% chance) - Number

    Returns:
    Created objects (Array)
*/

#define THIS_MODULE server
#include "x_macros.sqf"
private ["_side", "_pos", "_azi", "_objs", "_rdm", "_replace", "_store"];

_side = _this select 0;
_pos = _this select 1;
_azi = _this select 2;
_objs = _this select 3;

if (typeName _side == "ARRAY") then {
    _side = (_this select 0) select 0;
    _store = (_this select 0) select 1;
};

_group = if (typeName _side == "GROUP") then {_side} else {createGroup _side};

if (typeName _side != "SIDE") then {
    _side = side _side;
};

_rdm = if (count _this > 4) then {_this select 4} else {0};
_replace = if (count _this > 5) then {_this select 5} else {[]};

if (typeName _pos != typeName [] || {typeName _azi != typeName 0} || {!((typeName _objs) in [typeName "", typeName []])} || {typeName _rdm != typeName 0} || {_rdm < 0.0} || {_rdm > 1.0}) exitWith {[]};

private ["_cfgObjectComps", "_script", "_newObjs"];
_cfgObjectComps = configFile >> "CfgObjectCompositions";

if (typeName _objs == typeName "") then {
    _script = getText(_cfgObjectComps >> _objs >> "objectScript");
    _objs = [];
} else {
    private "_testSample";
    _testSample = _objs select 0;
    if (typeName _testSample != typeName []) then {
        private "_queryTags";
        _queryTags = +_objs;
        _objs = [];

        private "_candidates";
        _candidates = [];

        for "_i" from 0 to (count _cfgObjectComps - 1) do {
            private ["_candidate", "_candidateTags"];
            _candidate = _cfgObjectComps select _i;
            _candidateTags = getArray(_candidate >> "tags");

            if (({_x in _candidateTags} count _queryTags) == count _queryTags) then {
                _candidates set [count _candidates, getText(_candidate >> "objectScript")];
            };
        };

        _script = _candidates select (floor (random (count _candidates)));
    };
};

if (!isNil "_script") then {_objs = call (compile (preprocessFileLineNumbers _script))};

if (count _objs == 0) exitWith {[]};

if (count _replace > 0) then {
    {
        if (_x select 0 == (_replace select 0)) exitWith {_x set [0, _replace select 1]};
    } forEach _objs;
};

_newObjs = [];

private ["_posX", "_posY"];
_posX = _pos select 0;
_posY = _pos select 1;

private ["_multiplyMatrixFunc"];
_multiplyMatrixFunc = {
    private ["_array1", "_array2", "_result"];
    _array1 = _this select 0;
    _array2 = _this select 1;

    _result = [
        (((_array1 select 0) select 0) * (_array2 select 0)) + (((_array1 select 0) select 1) * (_array2 select 1)),
        (((_array1 select 1) select 0) * (_array2 select 0)) + (((_array1 select 1) select 1) * (_array2 select 1))
    ];

    _result
};

{
    if ((random 1) > _rdm) then {
        private ["_type", "_relPos", "_azimuth", "_fuel", "_damage", "_object", "_crew"];
        _type = _x select 0;
        _relPos = _x select 1;
        _azimuth = _x select 2;
        
        if (_type in GVAR(server_objects_banned)) exitWith {};
        
        if (count _x > 3) then {_fuel = _x select 3};
        if (count _x > 4) then {_damage = _x select 4};

        private ["_rotMatrix", "_newRelPos", "_newPos"];
        _rotMatrix = [
            [cos _azi, sin _azi],
            [-(sin _azi), cos _azi]
        ];
        _newRelPos = [_rotMatrix, _relPos] call _multiplyMatrixFunc;

        private "_z";
        _z = if (count _relPos > 2) then {_relPos select 2} else {0};
    
        _newPos = [_posX + (_newRelPos select 0), _posY + (_newRelPos select 1), _z];
        
        _dir = (_azi + _azimuth);
        
        _vehicle = [_newPos, _dir, _type, _group] call BIS_fnc_spawnVehicle;
        
        _object = _vehicle select 0;
        _crew = _vehicle select 1;
        
        _object setDir _dir;
        _object setPos _newPos;

        if (!isNil "_fuel") then {_object setFuel _fuel};
        if (!isNil "_damage") then {_object setDamage _damage};
        
        if (_side == west && {_object isKindOf "LandVehicle"}) then {
            _object lock true;
            _object allowCrewInImmobile true;
            
            _object addEventHandler ["Fired", {(_this select 0) setVehicleAmmo 1}];
            _object addEventHandler ["HandleDamage", {0}];
            
            {
                _x addEventHandler ["HandleDamage", {0}];
            } forEach crew _object;
            
            if !(_object isKindOf "StaticVehicle") then {
                (driver _object) disableAI "MOVE";
                
                _object addEventHandler ["GetOut", {            
                    private ["_vehicle", "_position", "_unit"];
                    
                    PARAMS_3(_vehicle, _position, _unit);
                    
                    if (_position == "driver") then {
                        _unit moveInDriver _vehicle;
                    };
                }];
            };
        };

        if (_side == east && {_object isKindOf "Car"} && {!(_object isKindOf "Wheeled_APC")}) exitWith {
            [_object] call FUNC(vehicle,delete);
        };

        if (_side == east && {_object isKindOf "LandVehicle"} && {!(_object isKindOf "StaticWeapon")}) then {
            [true, "execVM", [[_object], __handlerRE(vehicle)]] call FUNC(network,mp);
            
            __addDead(_object);
        };

        _newObjs set [count _newObjs, _object];
    };
    
    sleep 0.2;
} forEach _objs;

if (!isNil "_store") then {
    _store setVariable [QGVAR(cleanup), (_store getVariable QGVAR(cleanup)) + _newObjs];
};