/**
 * Construction Module (Handler)
 */

#define THIS_MODULE construction
#include "x_macros.sqf"
private ["_type", "_object"];

_objects = [];

if (!isNil QMODULE(farp)) then {
    _objects = _objects + [["FARP", GVAR(farp_type)]];
};

if (!isNil QMODULE(mash)) then {
    _objects = _objects + [["MASH", GVAR(mash_type)]];
};

if (!isNil QMODULE(nest)) then {
    _objects = _objects + [["Nest", GVAR(nest_type)]];
};

if (!isNil QMODULE(fortification)) then {
    _objects = _objects + [["Fortification", GVAR(fortification_type)]];
};

GVAR(construction_type_objects) = _objects;

if (isServer) then {
    gameLogic setVariable [QGVAR(constructed), []];
    
    __fsm(cleanup);
};

if (hasInterface) then {
    {
        _name = _x select 0;
        _type = _x select 1;
        
        {
            [_name, _x] call FUNC(THIS_MODULE,action);
            
            _x addEventHandler ["HandleDamage", {0}];
        } forEach (allMissionObjects _type);
    } forEach GVAR(construction_type_objects);
};