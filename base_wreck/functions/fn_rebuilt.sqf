#define THIS_MODULE base_wreck
#include "x_macros.sqf"
private ["_vehicle", "_hangars"];

PARAMS_1(_vehicle);

_hangars = X_JIPH getVariable QGVAR(wreck_hangars);

if !([typeOf _vehicle, "Mi17_TK_EP1"] call BIS_fnc_areEqual) then {
    if (isNil QMODULE(base_uav) || {!isNil QMODULE(base_uav) && {!([typeOf _vehicle, GVAR(base_uav_type_vehicle)] call BIS_fnc_areEqual)}}) then {
        {
            if !(triggerActivated _x) exitWith {
                private ["_hangar"];

                _hangar = _hangars select _forEachIndex;

                _vehicle setDir ((getDir _hangar) - 180);
                _vehicle setPosATL (getPosATL _hangar);
            };
        } forEach GVAR(wreck_hangar_triggers);
    } else {
        if !(isNil QMODULE(base_uav)) then {
            [_vehicle] __submodulePP(base_uav);
        };
    };
};

[true, "enableSimulation", [_vehicle, true]] call FUNC(network,mp);

_vehicle allowDamage true;
_vehicle setVectorUp surfaceNormal (position _vehicle);

_vehicle lock false;

if !(isNil QMODULE(menu) && {isNil QMODULE(menu_vehicle)}) then {
    _vehicle setVariable [QGVAR(menu), true, true];
};

if (!isNil QMODULE(vehicle_tow)) then {
    _vehicle setVariable [QGVAR(towed), false, true];
};

if (!isNil QMODULE(vehicle_uav) && {typeOf _vehicle in GVAR(vehicle_uav_types)}) then {
    [true, "execVM", [[], FUNCTION(vehicle_uav,populate)]] call FUNC(network,mp);
};

if !(isNil QMODULE(conversation)) then {
    [
        [GVAR(crossroad), GVAR(crossroad2)],
        [QUOTE(THIS_MODULE), "Rebuilt"],
        [
            ["1", {}, [typeOf _vehicle] call FUNC(vehicle,name), []],
            ["2", {}, if (GVAR(wreck_hangars_occupied) >= (count _hangars) - 1) then {
                " Clear a hangar to continue rebuilding wrecks."
            } else {
                ""
            }, []]
        ]
    ] call FUNC(conversation,radio);
};

GVAR(base_wreck) setVariable [QGVAR(time), 0, true];

GVAR(rebuilding) = false;
GVAR(wreck) = nil;