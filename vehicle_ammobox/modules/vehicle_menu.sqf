/**
 * Vehicle Ammobox - Vehicle Menu Submodule
 */

#include "x_macros.sqf"
#define __ctrl(vctrl) _ctrl = _XD_display displayCtrl vctrl
#define __ctrl2(ectrl) (_XD_display displayCtrl ectrl)
private ["_vehicle", "_XD_display"];
PARAMS_2(_vehicle,_XD_display);

if (GVAR(vehicle_ammobox_types) find (typeOf _vehicle) == -1) exitWith {};

__ctrl2(1500) lbAdd "Load ammobox";