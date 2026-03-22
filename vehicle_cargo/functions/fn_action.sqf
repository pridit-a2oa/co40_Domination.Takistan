#define THIS_MODULE vehicle_cargo
#include "x_macros.sqf"
private ["_vehicle", "_entity", "_network", "_expression"];

PARAMS_2(_vehicle, _entity);

if !(hasInterface) exitWith {};

_network = [_this, 2, false] call FUNC(common,param);

_expression = {
    private ["_vehicle", "_entity", "_action"];

    PARAMS_2(_vehicle, _entity);

    if !(hasInterface) exitWith {};

    _action = +(_entity getVariable QGVAR(action));

    if (!isNil "_action" && {!([_action, -1] call BIS_fnc_areEqual)}) then {
        _entity setVariable [QGVAR(action), -1];

        _vehicle removeAction _action;
    };

    _entity setVariable [
        QGVAR(action),
        _vehicle addAction [
            format ["Unload %1", [typeOf _entity] call FUNC(vehicle,name)] call FUNC(common,RedText),
            __function(unload),
            ([_vehicle getVariable QGVAR(cargo), _entity] call BIS_fnc_findNestedElement) select 0,
            9,
            false,
            true,
            "",
            "[player, driver _target] call BIS_fnc_areEqual && {[_target animationPhase ""ramp_bottom"", 1] call BIS_fnc_areEqual && {[_target] call d_fnc_vehicle_cargo_valid}}"
        ]
    ];
};

switch (_network) do {
    case true: {[true, "spawn", [_this, _expression]] call FUNC(network,mp)};
    case false: {_this call _expression};
};