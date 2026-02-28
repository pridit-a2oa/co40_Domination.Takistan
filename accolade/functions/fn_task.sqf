#define THIS_MODULE accolade
#include "x_macros.sqf"
private ["_index", "_type", "_tasks", "_identifier", "_discipline"];

PARAMS_2(_index, _type);

_identifier = [_this, 2, []] call FUNC(common,param);

// Fine for now but would have problems in local mp, player needs to be dynamic unit
_tasks = if (isServer && {!hasInterface}) then {
    (profileNamespace getVariable ([_identifier select 1] call FUNC(THIS_MODULE,key))) select 1
} else {
    player getVariable QGVAR(tasks)
};

_discipline = [0, GVAR(accolade_types)] call FUNC(common,arrayValues) find _type;

(_tasks select _discipline) select _index