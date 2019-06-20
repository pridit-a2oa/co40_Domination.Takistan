#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_flag", "_trigger", "_target"];

PARAMS_2(_flag, _trigger);

_target = _flag getVariable QGVAR(target);

_flag setVariable [QGVAR(capturing), true];

if (!isNil QMODULE(3d)) then {
    [nil, nil, rSpawn, [_flag], {
        private ["_flag"];
        
        PARAMS_1(_flag);
        
        [_flag, GVAR(mission_main_time_capture)] call FUNC(3d,time);
    }] call RE;
};

_time = GVAR(mission_main_time_capture) + call FUNC(common,time);

while {{_x distance _flag <= GVAR(mission_main_distance_camp)} count (call FUNC(common,players)) > 0} do {
    if (_time < call FUNC(common,time)) exitWith {
        if (!isNil QMODULE(crossroad) && {(_target getVariable QGVAR(camps)) - 1 == 0}) then {
            GVAR(crossroad) kbTell [GVAR(crossroad2), "mission_main", "Captured", ["1", {}, _target getVariable "name", []], true];
        };
        
        if (!isNil QMODULE(marker)) then {
            _name = format ["camp_%1", str (position _flag)];

            [_name] call FUNC(marker,delete);
        };
        
        createVehicle ["FlagCarrierUSA_EP1", position _flag, [], 0, "CAN_COLLIDE"];
        deleteVehicle _flag;
        
        _target setVariable [QGVAR(camps), (_target getVariable QGVAR(camps)) - 1];
        
        if (!isNil "_trigger") then {
            deleteVehicle _trigger;
        };
    };
    
    sleep 1;
};

_flag setVariable [QGVAR(capturing), false];
_flag setVariable [QGVAR(time), 0, true];