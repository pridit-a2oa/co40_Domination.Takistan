/**
 * Vehicle UAV Module - Diary Submodule
 */

#include "x_macros.sqf"

["Unmanned Aerial Vehicles (UAVs)", [
    "<img image='ca\missions_e\bootcamp\TE15_UAVs.Zargabad\overview_ca' width='200'/>",
    if !(isNil QMODULE(base_uav)) then {"<br />From the <marker name='base_uav'>[UAV Terminal]</marker> you can remotely control a subset of aircraft, designated as UAVs."} else {""},
    "<br />By <marker name=''>equipping</marker> a UAV backpack you can access this facility from anywhere (while performing the ""Sit down"" action).",
    if !(isNil QMODULE(base_wreck)) then {"<br />The MQ-9 spawn at base will create a <marker name=''>wreck</marker> on destruction, but has the shortest rebuild time of all aircraft."} else {""},
    "<br />The camera pod can only be controlled while the UAV has an <marker name=''>active</marker> pilot (player or AI).",
    "<br />UAVs are not weaponized and <marker name=''>cannot</marker> be boarded."
]] call FUNC(diary,create);