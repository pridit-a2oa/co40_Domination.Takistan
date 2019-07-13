#define THIS_MODULE vehicle_marker
#include "x_macros.sqf"
private ["_spawn", "_name", "_position"];

PARAMS_1(_vehicle);

if (!alive _vehicle && {!(_vehicle getVariable QGVAR(wreckable))}) exitWith {};
if (alive _vehicle && {!((typeOf _vehicle) in GVAR(vehicle_mhq_types))} && {count crew _vehicle > 0} && {{!isPlayer _x} count crew _vehicle > 0}) exitWith {};
if (alive _vehicle && {!((typeOf _vehicle) in GVAR(vehicle_mhq_types))} && {faction _vehicle == "BIS_TK"} && {!(_vehicle getVariable QGVAR(rebuilt))} && {}) exitWith {};

_marker = createMarkerLocal [str ((_vehicle getVariable QGVAR(position)) select 0), position _vehicle];

if (alive _vehicle) then {
    _marker setMarkerColorLocal "ColorBlue";
    _marker setMarkerTextLocal ([typeOf (_vehicle)] call FUNC(vehicle,name));
    _marker setMarkerAlphaLocal 0;
    
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

        deleteMarkerLocal (str (((_this select 0) getVariable QGVAR(position)) select 0));
    }];
} else {
    if (!isNil QMODULE(vehicle_wreck) && {_vehicle getVariable QGVAR(wreckable)}) exitWith {        
        [_vehicle] __submoduleVM(vehicle_wreck);
    };
};

_vehicle setVariable [QGVAR(hidden), false, true];

_marker