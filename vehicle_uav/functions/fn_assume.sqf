#include "x_macros.sqf"
private ["_target", "_caller", "_action", "_arguments", "_vehicle", "_role", "_camera"];

PARAMS_4(_target, _caller, _action, _arguments);

_vehicle = X_JIPH getVariable QGVAR(base_uav);

_role = if (count _arguments > 0) then {_arguments select 0} else {""};

switch (_role) do {
    case "driver":  {
        _role = driver _vehicle;
        _camera = "EXTERNAL";
    };

    default {
        _role = gunner _vehicle;
        _camera = "INTERNAL";
    };
};

player remoteControl _role;

_vehicle switchCamera _camera;