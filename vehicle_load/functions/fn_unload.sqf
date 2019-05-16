#define THIS_MODULE vehicle_load
#include "x_macros.sqf"
private ["_aircraft", "_load", "_loaded", "_actions", "_vehicle", "_types", "_id"];

_aircraft = _this select 0;
_load = _this select 3;

_loaded = _aircraft getVariable QGVAR(loaded);
_actions = _aircraft getVariable QGVAR(actions);

_id = ([_aircraft] call FUNC(THIS_MODULE,types)) find (_load select 0);

if (_id != -1) then {
    [nil, _aircraft, "per", rRemoveAction, format ["vehicleLoad%1", _id]] call RE;
    
    _loaded set [_id, [nil]];
    _actions set [_id, false];
    
    _aircraft setVariable [QGVAR(loaded), _loaded, true];
    _aircraft setVariable [QGVAR(actions), _actions, true];
};

[_aircraft, position _aircraft, _load, ""] call FUNC(common,paradrop);