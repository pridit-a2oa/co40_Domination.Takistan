/**
 * Vehicle Lift (Handler)
 */

if (hasInterface) then {
    {
        _x addEventHandler ["HandleDamage", {0}];
        _x enableSimulation false;
    } forEach (allMissionObjects "RoadCone");
};