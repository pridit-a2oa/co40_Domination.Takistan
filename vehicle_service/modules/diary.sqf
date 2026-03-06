/**
 * Vehicle Service Module - Diary Submodule
 */

#include "x_macros.sqf"

["Vehicle Service", [
    "<img image='ca\missions_e\scenarios\SPE1_Benchmark1.Takistan\overview_benchmark_ca' width='175'/>",
    "<br />To repair, refuel, and rearm there are 3 vehicle service point facilities at base, corresponding to type of vehicle:",
    "<br />- <marker name='d_service_chopper'>[Chopper Service]</marker>",
    "- <marker name='d_service_jet'>[Jet Service]</marker>",
    "- <marker name='d_service_land'>[Land Vehicle Service]</marker>",
    "<br />For balancing reasons, vehicles <marker name=''>cannot</marker> be rearmed in the field and so must rearm at their facility.",
    "<br />To discourage abandonment on the pad, vehicles <marker name=''>cannot be disembarked</marker> while actively being serviced.",
    if !(isNil QMODULE(vehicle_loadout)) then {"<br />Vehicles with loadout changes <marker name=''>must</marker> be rearmed at one of these facilities to equip the new armament."} else {""},
    format ["<br />There is a <marker name=''>%1 second</marker> global cooldown between subsequent uses of a facility.", GVAR(vehicle_service_time_cooldown)]
]] call FUNC(diary,create);