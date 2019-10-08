/**
 * Vehicle Lift (Handler)
 */

if (hasInterface) then {
    {
        _x hideObject true;
        _x enableSimulation false;
        
        _x addEventHandler ["HandleDamage", {0}];
    } forEach (allMissionObjects "RoadCone");
};