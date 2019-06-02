#include "x_macros.sqf"
private ["_vehicle", "_hangars", "_hangar", "_full"];

PARAMS_1(_vehicle);

_hangars = X_JIPH getVariable QGVAR(wreck_hangars);

{
    if (!triggerActivated _x) then {
        _hangar = _hangars select _forEachIndex;
        
        _vehicle setDir ((getDir _hangar) - 180);
        _vehicle setPos (getPos _hangar);
    };
} forEach GVAR(wreck_hangar_triggers);

_vehicle lock false;
_vehicle allowDamage true;

if (GVAR(wreck_hangars_occupied) == (count _hangars - 1)) then {
    _full = " All hangars now full. Free up a hangar to continue rebuilding wrecks.";
} else {
    _full = "";
};

if (!isNil QMODULE(crossroad)) then {
    GVAR(crossroad) kbTell [GVAR(crossroad2), "vehicle_wreck", "Rebuilt", ["1", {}, [typeOf _vehicle] call FUNC(vehicle,name), []], ["2", {}, _full, []], true];
};

[nil, nil, rSpawn, [], {
    GVAR(rebuild) = 0;
}] call RE;

GVAR(rebuilding) = false;
GVAR(wreck) = nil;