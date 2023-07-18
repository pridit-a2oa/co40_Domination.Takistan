/**
 * Construction Module (Handler)
 */

#define THIS_MODULE construction
#include "x_macros.sqf"

if (isServer) then {
    gameLogic setVariable [QGVAR(constructed), []];

    {
        private ["_type"];

        _type = _x select 1;

        if ([_type, "US_WarfareBVehicleServicePoint_Base_EP1"] call BIS_fnc_areEqual) then {
            {
                _x setAmmoCargo 0;
            } forEach (allMissionObjects _type);
        };
    } forEach GVAR(construction_types);

    __fsm(cleanup);
};

if (hasInterface) then {
    {    
        {
            _x addEventHandler ["HandleDamage", {0}];
        } forEach (allMissionObjects (_x select 1));
    } forEach GVAR(construction_types);
};