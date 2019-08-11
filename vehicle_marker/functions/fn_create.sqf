#define THIS_MODULE vehicle_marker
#include "x_macros.sqf"
private ["_spawn", "_name", "_position"];

PARAMS_1(_vehicle);

if (!alive _vehicle && {!(_vehicle getVariable QGVAR(wreckable))}) exitWith {};
if (alive _vehicle && {!((typeOf _vehicle) in GVAR(vehicle_mhq_types))} && {((faction _vehicle) in ["BIS_TK", "BIS_TK_INS"] && {!(_vehicle isKindOf "Air")})} && {!(_vehicle getVariable QGVAR(rebuilt))}) exitWith {};

_marker = createMarkerLocal [_vehicle getVariable QGVAR(id), position _vehicle];

if (alive _vehicle) then {
    _marker setMarkerColorLocal "ColorBlue";
    _marker setMarkerTextLocal ([typeOf (_vehicle)] call FUNC(vehicle,name));
    _marker setMarkerAlphaLocal 0;
    
    if ((faction _vehicle) in ["BIS_TK", "BIS_TK_INS"] && {!(_vehicle getVariable QGVAR(rebuilt))}) then {
        _marker setMarkerColorLocal "ColorRed";
    };
    
    if (_vehicle isKindOf "Tank") then {
        _marker setMarkerTypeLocal "o_armor";
    } else {
        _marker setMarkerTypeLocal "o_air";
    };
    
    _vehicle addMPEventHandler ["MPKilled", {
        private ["_vehicle"];

        PARAMS_1(_vehicle);

        _wreckable = _vehicle getVariable QGVAR(wreckable);

        if (!isNil QMODULE(vehicle_wreck) && {_wreckable}) exitWith {        
            [_vehicle] __submoduleVM(vehicle_wreck);
        };

        deleteMarkerLocal (_vehicle getVariable QGVAR(id));
    }];
} else {
    if (!isNil QMODULE(vehicle_wreck) && {_vehicle getVariable QGVAR(wreckable)}) exitWith {        
        [_vehicle] __submoduleVM(vehicle_wreck);
    };
};

_vehicle setVariable [QGVAR(hidden), false, true];

_marker