#include "x_macros.sqf"
private ["_time"];

disableSerialization;

_time = [player, GVAR(revive_time_respawn)] call FUNC(3d,time);

3000 cutRsc ["XD_Notice", "PLAIN"];

DIALOG(QGVAR(notice), 1000) ctrlSetText "You are unconscious";
DIALOG(QGVAR(notice), 1001) ctrlSetText "You can wait to be revived or respawn faster by selecting Respawn from the escape menu";

while {player getVariable QGVAR(unconscious) && {alive player}} do {
    _time = [player] call FUNC(3d,time);
    
    if (visibleMap) then {
        DIALOG(QGVAR(notice), 1000) ctrlShow false;
        DIALOG(QGVAR(notice), 1001) ctrlShow false;
        DIALOG(QGVAR(notice), 1002) ctrlShow false;
    } else {
        DIALOG(QGVAR(notice), 1000) ctrlShow true;
        DIALOG(QGVAR(notice), 1001) ctrlShow true;
        DIALOG(QGVAR(notice), 1002) ctrlShow true;
    };
    
    DIALOG(QGVAR(notice), 1002) ctrlSetText format ["%1", [_time] call FUNC(common,displayTime)];
    
    if (_time < 0) exitWith {
        player setDamage 1;
    };
    
    sleep 0.01;
};

3000 cutRsc ["Default", "PLAIN"];