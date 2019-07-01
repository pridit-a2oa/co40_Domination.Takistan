/**
 * Vehicle Tow Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_tow
#include "x_macros.sqf"
private ["_vehicle", "_towing", "_action"];

PARAMS_1(_vehicle);

if (isServer && {{_vehicle isKindOf _x} count GVAR(vehicle_tow_type_towable) > 0}) then {
    _vehicle setVariable [QGVAR(towed), false, true];
};

if (typeOf _vehicle != GVAR(vehicle_tow_type)) exitWith {};

if (isServer) then {
    _vehicle setVariable [QGVAR(towing), objNull, true];
    _vehicle setVariable [QGVAR(action), false, true];
    
    _vehicle addEventHandler ["killed", {
        private ["_vehicle"];
        
        PARAMS_1(_vehicle);
        
        [_vehicle] spawn {
            private ["_vehicle"];
            
            PARAMS_1(_vehicle);
            
            _towing = _vehicle getVariable QGVAR(towing);
            
            if (isNull _towing) exitWith {};
            
            [_vehicle, "", "", _towing] call FUNC(THIS_MODULE,detach);
        };
    }];
};
    
if (hasInterface) then {
    waitUntil {sleep 2; !isNil {_vehicle getVariable QGVAR(towing)}};
    
    while {alive _vehicle} do {
        _towing = _vehicle getVariable QGVAR(towing);
        _action = _vehicle getVariable QGVAR(action);

        if (!isNull _towing && {!_action}) then {
            [
                nil,
                _vehicle,
                "per",
                rAddAction,
                "Detach" call FUNC(common,RedText),
                __function(detach),
                _towing,
                10,
                false,
                true,
                "",
                "",
                "vehicleDetach"
            ] call RE;
            
            _vehicle setVariable [QGVAR(action), true, true];
        };
        
        sleep 5;
    };
};