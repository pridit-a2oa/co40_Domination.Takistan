/**
 * Vehicle Deploy Module - Diary Submodule
 */

#include "x_macros.sqf"

["Mobile Respawn", [
    "<img image='ca\missions_e\data\images\mpte06_ca' width='200'/><br />",
    "Some vehicles have the ability to be deployed, allowing them to act as a <marker name=''>mobile respawn</marker> point.<br />",
    "Through <marker name=''>Settings</marker> you are able to select one of these points to spawn at should you die.<br />",
    "You will <marker name=''>never</marker> respawn at a selected point if you die beyond the maximum distance specified.<br />",
    "By default you will <marker name=''>always</marker> respawn at the [<marker name='respawn_west'>south east airfield</marker>], which is the main base."
]] call FUNC(diary,create);