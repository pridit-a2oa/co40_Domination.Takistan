/**
 * Name Module (Handler)
 */

#define THIS_MODULE name
#include "x_macros.sqf"

if (hasInterface) then {
    ["marker_players", {
        {
            _marker = [_x] call FUNC(THIS_MODULE,valid);
            
            if (isNil "_marker" && {isPlayer _x} && {alive _x}) then {
                _marker = [_x] call FUNC(THIS_MODULE,create);
            };
                
            if (!isNil "_marker") then {
                if (!visibleMap && {isNil {uiNamespace getVariable "BIS_RscMiniMap"}} && {isNil {uiNamespace getVariable "RscMiniMapSmall"}}) exitWith {};
                
                [_x] __submodulePP(revive);
                
                _marker setMarkerPosLocal (getPosASL _x);
            };
        } forEach allUnits;
    }, 1] call FUNC(client,addPerFrame);
};