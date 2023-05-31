#include "x_macros.sqf"
private ["_time"];

disableSerialization;

_time = [player, GVAR(revive_time_respawn)] call FUNC(3d,time);

3000 cutRsc ["XD_Notice", "PLAIN"];

DIALOG(QGVAR(notice), 1000) ctrlSetStructuredText parseText "<t underline='1'>You are incapacitated</t>";
DIALOG(QGVAR(notice), 1001) ctrlSetText "Wait to be revived before the timer runs out\n\nOR\n\nRespawn from the escape menu";

0 spawn {
    sleep (7 + random 4);

    while {player getVariable QGVAR(unconscious) && {alive player}} do {
        private ["_distances", "_distance", "_closest", "_player"];
        
        _distances = [];

        {

            if (!([_x, player] call BIS_fnc_areEqual) && {_x distance player < GVAR(revive_distance_exclaim)} && {alive _x} && {!(_x getVariable QGVAR(unconscious))}) then {
                if (_x distance player > 35 && {!(_x in units (group player))}) exitWith {};

                _distances = _distances + [[_x, player distance _x]];
            };
        } forEach (call FUNC(common,players));

        if (count _distances > 0) then {
            _distance = ([1, _distances] call FUNC(common,arrayValues)) call BIS_fnc_lowestNum;
            _closest = ([1, _distances] call FUNC(common,arrayValues)) find _distance;
            _player = (_distances select _closest) select 0;

            if (player distance _player < 5) exitWith {};

            if !(isNil QMODULE(conversation)) then {
                player kbTell [
                    if (player distance _player < 35) then {player} else {_player},
                    "Medic",
                    ["InjuredCallMedic", "InjuredHelpMe", "InjuredNeedHelp"] call BIS_fnc_selectRandom,
                    false
                ];
            };
        };

        sleep 50;
    };
};

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
        setPlayerRespawnTime 5;

        player setDamage 1;
    };
    
    sleep 0.1;
};

3000 cutRsc ["Default", "PLAIN"];


