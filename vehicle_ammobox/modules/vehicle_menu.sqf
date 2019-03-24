/**
 * Vehicle Ammobox - Vehicle Menu Submodule
 */

#include "x_macros.sqf"
#define __ctrl(vctrl) _ctrl = _XD_display displayCtrl vctrl
#define __ctrl2(ectrl) (_XD_display displayCtrl ectrl)
private ["_vehicle", "_XD_display"];
PARAMS_2(_vehicle,_XD_display);

if (GVAR(vehicle_ammobox_types) find (typeOf _vehicle) == -1) exitWith {};

_ammobox = _vehicle getVariable QGVAR(ammobox);
_string = "ammobox";

if (!isNil "_ammobox" && {_ammobox}) then {
    _string = "Unload " + _string;
    
    __ctrl2(1202) ctrlSetTextColor [0.6, 0.5, 0.3, 1];
} else {
    _string = "Load " + _string;
};

_index = __ctrl2(1500) lbAdd _string;
__ctrl2(1500) lbSetData [_index, "ammobox"];