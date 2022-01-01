#define THIS_MODULE base_rd
#include "x_macros.sqf"
private ["_trigger", "_vehicle", "_player", "_type", "_time", "_progress"];

PARAMS_1(_trigger);

GVAR(base_rd) setVariable [QGVAR(processing), true, true];

_vehicle = _trigger getVariable QGVAR(vehicle);

if (isNil "_vehicle") exitWith {};

_player = call FUNC(THIS_MODULE,player);

_type = typeOf _vehicle;

[_vehicle] call FUNC(vehicle,delete);

sleep 0.5;

_position = [(position GVAR(base_rd)) select 0, (position GVAR(base_rd)) select 1, 0];

_vehicle = createVehicle [_type, _position, [], 0, "NONE"];
_vehicle setDir (getDir GVAR(base_rd));
_vehicle setPos _position;
_vehicle setVelocity [0, 0, 0];
_vehicle setVectorUp surfaceNormal (position GVAR(base_rd));

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

_time = _time + call FUNC(common,time);

if (!isNil QMODULE(vehicle_menu)) then {
    _vehicle setVariable [QGVAR(menu), false, true];
};

if (!isNil QMODULE(vehicle_respawn)) then {
    _vehicle setVariable [QGVAR(respawnable), false, true];
};

[true, "execVM", [[_vehicle], FUNCTION(vehicle,handle)]] call FUNC(network,mp);

while {call FUNC(common,time) < _time} do {   
    // remaining time is greater than the maximum it could ever be
    if ((_time - call FUNC(common,time)) > call FUNC(THIS_MODULE,max)) exitWith {};

    if ({_x distance _vehicle < 30} count (call FUNC(common,players)) > 0) then {      
        _vehicle spawn {
            sleep (random 10);
            
            [true, "say", [_this, QGVAR(sound_weld), 20]] call FUNC(network,mp);
        };
    };
    
    sleep 15;
};

_progress = [typeOf _vehicle, "progress"] call FUNC(THIS_MODULE,item);

(GVAR(base_rd) getVariable QGVAR(progress)) set [
    ([0, GVAR(base_rd) getVariable QGVAR(progress)] call FUNC(common,arrayValues)) find (typeOf _vehicle),
    [typeOf _vehicle, (_progress select 0) + 1]
];

GVAR(base_rd) setVariable [QGVAR(progress), GVAR(base_rd) getVariable QGVAR(progress), true];

[true, "spawn", [[], {
    private ["_selected"];

    if (isNil {uiNamespace getVariable "X_RD_DIALOG"}) exitWith {};

    _selected = lbCurSel 100;

    [true] call FUNC(THIS_MODULE,populate);
    [_selected] call FUNC(THIS_MODULE,switch);

    DIALOG("X_BASE_RD_DIALOG", 100) lbSetCurSel _selected;
}]] call FUNC(network,mp);

if (!isNil QMODULE(crossroad) && {_progress select 1 == (_progress select 0) + 1}) then {
    GVAR(crossroad) kbTell [
        GVAR(crossroad2),
        "base_rd",
        "Researched",
        ["1", {}, [typeOf _vehicle] call FUNC(vehicle,name), []],
        true
    ];
};

[_vehicle] call FUNC(vehicle,delete);

if !([_player, objNull] call BIS_fnc_areEqual) then {
    {
        if (name _x == _player) exitWith {
            _x addScore GVAR(base_rd_amount_score);
            
            [_x, "systemChat", format [
                "You have been rewarded %1 score for deconstructing a vehicle",
                GVAR(base_rd_amount_score)
            ]] call FUNC(network,mp);
        };
    } forEach (call FUNC(common,players));
};

GVAR(base_rd) setVariable [QGVAR(processing), false, true];