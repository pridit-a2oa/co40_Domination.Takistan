#define THIS_MODULE intel
#include "x_macros.sqf"

X_JIPH setVariable [QGVAR(intel), true, true];

0 spawn {
    private ["_road", "_direction", "_vehicle", "_car", "_crew", "_driver"];
    
    _road = GVAR(intel_type_roads) call BIS_fnc_selectRandom;
    _direction = [position _road, (markerPos QGVAR(intel))] call BIS_fnc_dirTo;
    _vehicle = [position _road, GVAR(intel_type_vehicles) call BIS_fnc_selectRandom, 5, 0, civilian, _direction] call FUNC(server,spawnVehicle);

    _car = _vehicle select 0;
    _crew = _vehicle select 1;
    _driver = driver _car;

    {
        _x setCaptive true;
    } forEach _crew;

    _car lock true;
    _car allowCrewInImmobile true;
    _car setVariable [QGVAR(intel), true, true];

    _driver doMove (markerPos QGVAR(intel));

    while {alive _driver && {alive _car} && {canMove _car}} do {
        while {_car distance (markerPos QGVAR(intel)) > 300} do {        
            sleep 2;
        };
        
        if (_car distance (markerPos QGVAR(intel)) <= 300) exitWith {
            GVAR(crossroad) kbTell [GVAR(crossroad2), "intel", "Approach", true];
            
            [nil, _car, "per", rAddAction, "Intel" call FUNC(common,BlueText), __function(intel), [], 10, false, true, "", "alive _target && {canMove _target} && {alive (driver _target)} && {_target getVariable 'd_intel'}"] call RE;

            while {alive _driver && {alive _car} && {canMove _car}} do {
                _distance = _car distance (markerPos QGVAR(intel));
                
                if (_distance < 50 && {_car getVariable QGVAR(intel)}) then {
                    gameLogic action ["useWeapon", _car, (driver _car), 0];
                    
                    sleep 15 + (random 10);
                };

                sleep 2;
            };
        };

        sleep 2;
    };
    
    if (isNull _car) exitWith {};

    _car setDamage 1;

    sleep 20;

    if (!alive _driver) then {
        deleteVehicle _driver;
    };

    deleteVehicle _car;
    
    X_JIPH setVariable [QGVAR(intel), false, true];
};