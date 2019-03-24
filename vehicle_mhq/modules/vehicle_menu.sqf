/**
 * Vehicle Ammobox - Vehicle Menu Submodule
 */

#include "x_macros.sqf"
#define __ctrl(vctrl) _ctrl = _XD_display displayCtrl vctrl
#define __ctrl2(ectrl) (_XD_display displayCtrl ectrl)
private ["_vehicle", "_XD_display"];
PARAMS_2(_vehicle,_XD_display);

if (GVAR(vehicle_mhq_types) find (typeOf _vehicle) == -1) exitWith {};

_deployed = _vehicle getVariable QGVAR(deployed);
_string = "MHQ";

if (!isNil "_deployed" && {_deployed}) then {
    _string = "Undeploy " + _string;
} else {
    _string = "Deploy " + _string;
};

_index = __ctrl2(1500) lbAdd _string;
__ctrl2(1500) lbSetData [_index, "mhq"];