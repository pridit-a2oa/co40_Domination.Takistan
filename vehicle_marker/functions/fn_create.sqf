#define THIS_MODULE vehicle_marker
#include "x_macros.sqf"
private ["_vehicle", "_marker"];

PARAMS_1(_vehicle);

if (!alive _vehicle && {!(_vehicle getVariable QGVAR(wreckable))}) exitWith {};
if (alive _vehicle && {!((typeOf _vehicle) in GVAR(vehicle_mhq_types)) && {((faction _vehicle) in ["BIS_TK", "BIS_TK_INS"] && {!(_vehicle isKindOf "Air")}) && {!(_vehicle getVariable QGVAR(built))}}}) exitWith {};

_marker = createMarkerLocal [_vehicle getVariable QGVAR(id), position _vehicle];
_marker setMarkerPosLocal (getPosASL _vehicle);

if (alive _vehicle) then {
    _marker setMarkerTextLocal (format [" %1", [typeOf (_vehicle)] call FUNC(vehicle,name)]);
    _marker setMarkerColorLocal "ColorBlack";
    _marker setMarkerAlphaLocal 0;

    _marker setMarkerTypeLocal ([_vehicle] call FUNC(THIS_MODULE,type));

    _vehicle addMPEventHandler ["MPKilled", {
        private ["_vehicle"];

        PARAMS_1(_vehicle);

        _wreckable = _vehicle getVariable QGVAR(wreckable);

        if (!isNil QMODULE(vehicle_wreck) && {_wreckable}) exitWith {
            [_vehicle] __submoduleVM(vehicle_wreck);
        };

        if (!isNil QMODULE(vehicle_marker) && {!([markerPos (_vehicle getVariable QGVAR(id)), [0,0,0]] call BIS_fnc_areEqual)}) then {
            deleteMarkerLocal (_vehicle getVariable QGVAR(id));
        };
    }];
} else {
    if (!isNil QMODULE(vehicle_wreck) && {_vehicle getVariable QGVAR(wreckable)}) exitWith {
        [_vehicle] __submoduleVM(vehicle_wreck);
    };
};

_vehicle setVariable [QGVAR(hidden), false, true];

_marker