#define THIS_MODULE artillery
#include "x_macros.sqf"
private ["_unit", "_position", "_salvoes", "_ordnance"];

PARAMS_2(_unit, _position);

_salvoes = [_this, 2, player getVariable QGVAR(artillery_salvoes)] call FUNC(common,param);
_ordnance = [_this, 3, (player getVariable QGVAR(artillery_type)) select 1] call FUNC(common,param);

if (hasInterface) then {
    private ["_name", "_checks"];

    _name = "Artillery";
    _checks = [
        [
            [_name, "called"],
            player getVariable QGVAR(artillery_cooldown)
        ] call FUNC(helper,timeExceeded),

        [
            _name,
            X_JIP getVariable QGVAR(artillery_progress)
        ] call FUNC(helper,inProgress),

        [
            [_name, "called"],
            _position,
            player,
            [GVAR(artillery_distance_range), "of your position", "within"]
        ] call FUNC(helper,distanceFrom),

        [
            [_name, "called"],
            _position,
            markerPos QGVAR(base_south),
            [GVAR(artillery_distance_base), "away from base"]
        ] call FUNC(helper,distanceFrom),

        [
            [_name, "called"]
        ] call FUNC(helper,inVehicle),

        [
            _name,
            _position,
            west,
            GVAR(artillery_distance_friendly)
        ] call FUNC(helper,nearSide)
    ];

    if !(isNil QMODULE(conversation)) then {
        [
            _checks,
            [
                "Crossroad communication",
                X_JIP getVariable QGVAR(conversation)
            ] call FUNC(helper,inProgress)
        ] call BIS_fnc_arrayPush;
    };

    {
        if ([typeName _x, "STRING"] call BIS_fnc_areEqual) exitWith {
            [_x] call FUNC(client,hint);
        };
    } forEach _checks;

    if ({[_x, true] call BIS_fnc_areEqual} count _checks < count _checks) exitWith {};

    X_JIP setVariable [QGVAR(artillery_call), true, true];
    player setVariable [QGVAR(artillery_cooldown), time + GVAR(artillery_time_cooldown)];

    if !(isServer) then {
        _this set [2, _salvoes];
        _this set [3, _ordnance];

        [gameLogic, "execVM", [_this, __function(call)]] call FUNC(network,mp);
    };
};

if (isServer && {X_JIP getVariable QGVAR(artillery_call)}) then {
    private ["_shells", "_template", "_smoke", "_cannon", "_type"];

    X_JIP setVariable [QGVAR(artillery_call), false, true];

    if (!isNil QMODULE(conversation) && {[
        _unit,
        _position,
        format [
            "artillery strike, %1 salvo%2",
            _salvoes,
            if (_salvoes > 1) then {"es"} else {""}
        ]
    ] call FUNC(conversation,request)}) exitWith {};

    gameLogic setVariable [QGVAR(artillery_unit), [getPlayerUID _unit, name _unit]];

    X_JIP setVariable [QGVAR(artillery_progress), true, true];

    _shells = (GVAR(artillery_amount_shell) min (count synchronizedObjects BIS_ARTY_Logic));

    _salvoes = if ([_ordnance, "SMOKE"] call BIS_fnc_areEqual) then {1} else {_salvoes};

    _template = [
        "IMMEDIATE",
        _ordnance,
        0,
        _salvoes * _shells
    ];

    _smoke = GVAR(artillery_type_smoke) createVehicle _position;

    _cannon = (synchronizedObjects BIS_ARTY_Logic) select 0;

    [
        BIS_ARTY_Logic,
        [
            _cannon,
            3000,
            [_cannon, _position] call BIS_fnc_dirTo
        ] call BIS_fnc_relPos,
        _template
    ] call BIS_ARTY_F_ExecuteTemplateMission;

    waitUntil {sleep 1; [BIS_ARTY_Logic, _template] call BIS_ARTY_F_Available};

    deleteVehicle _smoke;

    _type = format ["ARTY_Sh_105_%1", _ordnance];

    for "_i" from 1 to _salvoes do {
        for "_i" from 1 to _shells do {
            switch (_ordnance) do {
                case "HE": {
                    private ["_strike", "_shell"];

                    _strike = [_position, random 40, random 360] call BIS_fnc_relPos;
                    _strike set [2, 150];

                    [_strike, _type] call FUNC(THIS_MODULE,trail);

                    _strike set [2, 0];

                    _shell = createVehicle [_type, _strike, [], 0, "NONE"];
                    _shell setPos _strike;
                };

                case "SADARM": {
                    private ["_strike", "_shell", "_sadarm"];

                    _strike = [_position, random 100, random 360] call BIS_fnc_relPos;
                    _strike set [2, 165];

                    _shell = createVehicle [_type, _strike, [], 0, "NONE"];
                    _shell setPos _strike;

                    _sadarm = [_shell] spawn BIS_ARTY_F_SadarmDeploy;

                    waitUntil {sleep 0.1; scriptDone _sadarm};
                };

                case "SMOKE": {
                    private ["_strike", "_shell"];

                    _strike = [_position, random 20, random 360] call BIS_fnc_relPos;
                    _strike set [2, 150];

                    [_strike, _type] call FUNC(THIS_MODULE,trail);

                    _strike set [2, 1];

                    _shell = createVehicle ["ARTY_SmokeShellWhite", _strike, [], 0, "NONE"];
                    _shell setPos _strike;
                };
            };

            sleep 3;
        };

        sleep 6;
    };

    X_JIP setVariable [QGVAR(artillery_progress), false, true];

    gameLogic setVariable [QGVAR(artillery_unit), []];
};