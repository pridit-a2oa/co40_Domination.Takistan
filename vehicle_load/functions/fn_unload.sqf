#include "x_macros.sqf"
private ["_aircraft", "_load", "_vehicle", "_id", "_loaded", "_actions"];

_aircraft = _this select 0;
_load = _this select 3;

_aircraft removeAction (_this select 2);

_vehicle = [_aircraft, position _aircraft, _load] call FUNC(helper,paradrop);

_loaded = _aircraft getVariable QGVAR(loaded);
_actions = _aircraft getVariable QGVAR(actions);

{
    _id = _x find (typeOf _vehicle);
    
    if (_id != -1) exitWith {
        _loaded set [_id, objNull];
        _actions set [_id, objNull];
        
        _loaded = [];
        _actions = [];
        
        {
            if (isNil "_x") then {
                _loaded = _loaded + [_x]
            };
        } forEach _loaded;
        
        _aircraft setVariable [QGVAR(loaded), _loaded, true];
        
        {
            if (isNil "_x") then {
                _actions = _actions + [_x]
            };
        } forEach _actions;

        _aircraft setVariable [QGVAR(actions), _actions, true];
    };
} forEach _loaded;