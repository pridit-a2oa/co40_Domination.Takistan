/**
 * Vehicle Menu Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_menu
#include "x_macros.sqf"
private ["_vehicle"];
PARAMS_1(_vehicle);

_vehicle addAction [format ["%1 Menu", getText (configFile >> "cfgVehicles" >> (typeOf _vehicle) >> "displayName")] call FUNC(common,GreyText), __function(show), _vehicle, -3, false, true, "", ""];