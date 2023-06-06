/**
 * Vehicle Deploy Module - Diary Submodule
 */

#include "x_macros.sqf"

["Unmanned Aerial Vehicles (UAVs)", [
    "<img image='ca\missions_e\bootcamp\TE15_UAVs.Zargabad\overview_ca' width='200'/><br />",
    "From the UAV station you able to remotely pilot the spawned UAV, and from sufficient height control the camera pod.<br />",
    "When switching to the camera pod the UAV will <marker name=''>automatically</marker> hold a formation pattern circling an area.<br />",
    "By <marker name=''>equipping</marker> a UAV backpack it is possible to control just the camera pod of any UAV from anywhere.<br />",
    "Using the UAV backpack will locate the <marker name=''>nearest</marker>, active AI or player flown UAV.<br />",
    "Only <marker name=''>one player</marker> can control a UAV's camera pod at a time."
]] call FUNC(diary,create);