/**
 * Vehicle Teleport - Vehicle Menu Submodule
 */

#include "x_macros.sqf"
#define __ctrl(vctrl) _ctrl = _XD_display displayCtrl vctrl
#define __ctrl2(ectrl) (_XD_display displayCtrl ectrl)
private ["_vehicle", "_XD_display"];
PARAMS_2(_vehicle,_XD_display);

if (!isNil QMODULE(perk) && {!(player getVariable QGVAR(perkTeleportMHQ))}) exitWith {};

_index = __ctrl2(1500) lbAdd "Teleport";
__ctrl2(1500) lbSetData [_index, "teleport"];