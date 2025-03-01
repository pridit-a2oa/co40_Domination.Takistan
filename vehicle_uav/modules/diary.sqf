/**
 * Vehicle UAV Module - Diary Submodule
 */

#include "x_macros.sqf"

["Unmanned Aerial Vehicles (UAVs)", [
    "<img image='ca\missions_e\bootcamp\TE15_UAVs.Zargabad\overview_ca' width='200'/><br />",
    if !(isNil QMODULE(base_uav)) then {"From the <marker name='base_uav'>[UAV Terminal]</marker> you can remotely control a subset of aircraft designated as UAVs.<br />"} else {""},
    "By <marker name=''>equipping</marker> a UAV backpack it is possible to assume control of a UAV from anywhere in the field.<br />",
    "With the UAV backpack equipped, you must be sitting on the ground via the ""Sit down"" action to <marker name=''>reveal</marker> the option.<br />",
    if !(isNil QMODULE(base_wreck)) then {"The MQ-9 spawn at base will create a <marker name=''>wreck</marker> on destruction, but has the shortest rebuild time of all aircraft.<br />"} else {""},
    "The camera pod can only be controlled while the UAV has an <marker name=''>active</marker> pilot (player or AI).<br />",
    "UAVs are not weaponized and <marker name=''>cannot</marker> be boarded."
]] call FUNC(diary,create);