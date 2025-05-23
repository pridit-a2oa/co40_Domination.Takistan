#define THIS_MODULE base_rd
#include "x_macros.sqf"
private ["_trigger", "_vehicle", "_player", "_time", "_progress"];

PARAMS_1(_trigger);

GVAR(base_rd) setVariable [QGVAR(processing), true, true];

_vehicle = _trigger getVariable QGVAR(vehicle);

if (isNil "_vehicle") exitWith {};

_player = call FUNC(THIS_MODULE,player);

_vehicle = [
    _vehicle,
    [(position GVAR(base_rd)) select 0, (position GVAR(base_rd)) select 1, 0],
    direction GVAR(base_rd)
] call FUNC(vehicle,respawn);

_vehicle lock true;
_vehicle allowDamage false;

[true, "setObjectTexture", [_vehicle, [0, "#(argb,512,512,1)r2t(rendersurface,1.333)"]]] call FUNC(network,mp);

sleep 2;

[true, "enableSimulation", [_vehicle, false]] call FUNC(network,mp);

__log format ["Deconstructing %1", [typeOf _vehicle] call FUNC(vehicle,name)]];

_time = ([typeOf _vehicle, "time"] call FUNC(THIS_MODULE,item)) select 1;

if (!isNil QMODULE(3d)) then {
    [true, "spawn", [[_time], {
        private ["_time"];

        PARAMS_1(_time);

        [GVAR(base_rd), _time] call FUNC(3d,time);
    }]] call FUNC(network,mp);
};

if !(isNil QMODULE(menu) && {isNil QMODULE(menu_vehicle)}) then {
    _vehicle setVariable [QGVAR(menu), false, true];
};

if (!isNil QMODULE(vehicle_respawn)) then {
    _vehicle setVariable [QGVAR(respawnable), false, true];
};

[true, "execVM", [[_vehicle], FUNCTION(vehicle,handle)]] call FUNC(network,mp);

["Deconstruct", _vehicle, _time, call FUNC(THIS_MODULE,max)] call FUNC(vehicle,stall);

_progress = [typeOf _vehicle, "progress"] call FUNC(THIS_MODULE,item);

(GVAR(base_rd) getVariable QGVAR(progress)) set [
    ([0, GVAR(base_rd) getVariable QGVAR(progress)] call FUNC(common,arrayValues)) find (typeOf _vehicle),
    [typeOf _vehicle, (_progress select 0) + 1]
];

GVAR(base_rd) setVariable [QGVAR(progress), GVAR(base_rd) getVariable QGVAR(progress), true];

if !(isNil QMODULE(database)) then {
    [format [
        "UPDATE game SET data = '%1' WHERE `key` = 'base_rd'",
        [1, GVAR(base_rd) getVariable QGVAR(progress)] call FUNC(common,arrayValues)
    ]] call FUNC(database,query);
};

[true, "spawn", [[], {
    private ["_selected"];

    if (isNil {uiNamespace getVariable "X_RD_DIALOG"}) exitWith {};

    _selected = lbCurSel 100;

    [true] call FUNC(THIS_MODULE,populate);
    [_selected] call FUNC(THIS_MODULE,switch);

    DIALOG("X_BASE_RD_DIALOG", 100) lbSetCurSel _selected;
}]] call FUNC(network,mp);

if (!isNil QMODULE(conversation) && {[_progress select 1, (_progress select 0) + 1] call BIS_fnc_areEqual}) then {
    [
        [GVAR(crossroad), GVAR(crossroad2)],
        [QUOTE(THIS_MODULE), "Researched"],
        [
            ["1", {}, [typeOf _vehicle] call FUNC(vehicle,name), []]
        ]
    ] call FUNC(conversation,radio);
};

[_vehicle] call FUNC(vehicle,delete);

if !([_player, objNull] call BIS_fnc_areEqual) then {
    {
        if ([getPlayerUID _x, _player] call BIS_fnc_areEqual) exitWith {
            if !(isNil QMODULE(reward)) then {
                [
                    _x,
                    GVAR(base_rd_amount_score),
                    "deconstructing a vehicle"
                ] call FUNC(reward,score);
            };

            if !(isNil QMODULE(database)) then {
                [getPlayerUID _x, 9] spawn FUNC(database,statistic);
            };
        };
    } forEach (call FUNC(common,players));
};

GVAR(base_rd) setVariable [QGVAR(processing), false, true];