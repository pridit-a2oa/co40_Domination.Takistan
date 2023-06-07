#include "x_macros.sqf"

if !(isNil QMODULE(setting)) then {
    player switchCamera ((player getVariable QGVAR(camera)) select 1);
} else {
    player switchCamera "EXTERNAL";
};

objNull remoteControl (gunner (X_JIPH getVariable QGVAR(base_uav)));