#define THIS_MODULE statistic
#include "x_macros.sqf"
private ["_index", "_identifier", "_statistics"];

PARAMS_1(_index);

_identifier = [_this, 1, [getPlayerUID player, name player]] call FUNC(common,param);

_index = _index - 1;

// Fine for now but would have problems in local mp, player needs to be dynamic unit
_statistics = if (isServer && {!hasInterface}) then {
    (serverNamespace getVariable ([_identifier select 0] call FUNC(THIS_MODULE,key))) select 1
} else {
    player getVariable QGVAR(statistics)
};

(_statistics select _index) select 1