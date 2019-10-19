#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_flag", "_trigger", "_target"];

PARAMS_2(_flag, _trigger);

_target = _flag getVariable QGVAR(target);

_flag setVariable [QGVAR(capturing), true];

if (!isNil QMODULE(3d)) then {
    [true, "execVM", [
        [_flag, GVAR(mission_main_time_capture)],
        FUNCTION(3d,time)
    ]] call FUNC(network,mp);
};

_time = GVAR(mission_main_time_capture) + call FUNC(common,time);

while {{_x distance _flag <= GVAR(mission_main_distance_camp)} count (call FUNC(common,players)) > 0} do {
    if (_time < call FUNC(common,time)) exitWith {
        if (!isNil QMODULE(crossroad) && {({alive _x} count (_target getVariable QGVAR(camps))) - 1 == 0}) then {
            GVAR(crossroad) kbTell [GVAR(crossroad2), "mission_main", "Captured", ["1", {}, _target getVariable "name", []], true];
        };
        
        if (!isNil QMODULE(marker)) then {
            _name = format ["camp_%1", _flag getVariable QGVAR(id)];
            
            [_name] call FUNC(marker,delete);
        };
        
        _newFlag = createVehicle ["FlagCarrierUSA_EP1", position _flag, [], 0, "CAN_COLLIDE"];
        deleteVehicle _flag;
        
        _target setVariable [QGVAR(cleanup), (_target getVariable QGVAR(cleanup)) + [_newFlag]];
        
        [true, "playSound", QGVAR(sound_capture)] call FUNC(network,mp);
        
        if (!isNil "_trigger") then {
            deleteVehicle _trigger;
        };
    };
    
    sleep 1;
};

_flag setVariable [QGVAR(capturing), false];
_flag setVariable [QGVAR(time), 0, true];