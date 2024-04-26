#define THIS_MODULE database
#include "x_macros.sqf"
private ["_query", "_result"];

PARAMS_1(_query);

__log format ["%1", _query]];

_result = "";

while {[count (toArray _result), 0] call BIS_fnc_areEqual} do {
    _result = "Arma2Net.Unmanaged" callExtension format [
        "Arma2NETMySQLCommandAsync ['%1', '%2']",
        GVAR(database_name),
        _query
    ];

    if !([count (toArray _result), 0] call BIS_fnc_areEqual) exitWith {
        __log format ["%1", _result]];

        _result = (call compile _result) select 0;
    };

    sleep 1;
};

_result