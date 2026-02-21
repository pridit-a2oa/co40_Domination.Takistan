#define THIS_MODULE accolade
#include "x_macros.sqf"
private ["_index", "_type", "_tasks", "_identifier", "_discipline"];

PARAMS_2(_index, _type);

_identifier = [_this, 2, []] call FUNC(common,param);

// This is fucked and needs reworking to support local hosted by supplying unit
_tasks = if (isServer && {!hasInterface}) then {
    (gameLogic getVariable ([_identifier select 1] call FUNC(THIS_MODULE,key))) select 1
} else {
    player getVariable QGVAR(tasks)
};

_discipline = [0, GVAR(accolade_types)] call FUNC(common,arrayValues) find _type;

(_tasks select _discipline) select _index