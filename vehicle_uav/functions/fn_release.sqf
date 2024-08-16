#define THIS_MODULE vehicle_uav
#include "x_macros.sqf"

objNull remoteControl (driver (X_JIPH getVariable QGVAR(base_uav)));

if !(isNil QMODULE(setting)) then {
    player switchCamera ((player getVariable QGVAR(camera)) select 1);
} else {
    player switchCamera "EXTERNAL";
};

setGroupIconsVisible [false, false];

[false] call FUNC(THIS_MODULE,effect);