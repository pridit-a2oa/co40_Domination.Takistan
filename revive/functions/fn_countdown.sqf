#define THIS_MODULE revive
#include "x_macros.sqf"
private ["_time"];

disableSerialization;

_time = [player, GVAR(revive_time_respawn)] call FUNC(3d,time);

3000 cutRsc ["XD_Notice", "PLAIN"];

DIALOG(QGVAR(notice), 1000) ctrlSetStructuredText parseText "<t underline='1'>You are incapacitated</t>";
DIALOG(QGVAR(notice), 1001) ctrlSetText "Wait to be revived before the timer runs out\n\nOR\n\nRespawn from the escape menu";

if !(isNil QMODULE(conversation)) then {
    0 spawn {
        sleep 2;

        while {player getVariable QGVAR(unconscious) && {alive player}} do {
            private ["_time", "_unit"];

            _time = [player] call FUNC(3d,time);

            if ([floor (_time % 50), 30] call BIS_fnc_areEqual) then {
                _unit = call FUNC(THIS_MODULE,nearest);

                if !([typeName _unit, "OBJECT"] call BIS_fnc_areEqual) exitWith {};

                player kbTell [
                    _unit,
                    "Medic",
                    [
                        "InjuredCallMedic",
                        "InjuredHelpMe",
                        "InjuredNeedHelp"
                    ] call BIS_fnc_selectRandom,
                    false
                ];
            };

            sleep 1;
        };
    };
};

while {player getVariable QGVAR(unconscious) && {alive player}} do {
    _time = [player] call FUNC(3d,time);

    {
        DIALOG(QGVAR(notice), _x) ctrlShow !visibleMap;
    } forEach [1000, 1001, 1002];

    DIALOG(QGVAR(notice), 1002) ctrlSetText ([_time] call FUNC(common,displayTime));

    if (_time < 0) exitWith {
        setPlayerRespawnTime 5;

        player setDamage 1;
    };

    sleep 0.1;
};

3000 cutText ["", "PLAIN"];