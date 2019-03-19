/**
 * Vehicle Ammobox - Vehicle HUD Submodule
 */

#include "x_macros.sqf"
#define __ctrl(vctrl) _ctrl = _XD_display displayCtrl vctrl
#define __ctrl2(ectrl) (_XD_display displayCtrl ectrl)
private ["_vehicle"];
PARAMS_1(_vehicle);

disableSerialization;

_XD_display = uiNamespace getVariable "X_VEHICLE_HUD_DIALOG";

{
    if (typeOf _vehicle == _x) then {
        __ctrl2(1003) ctrlSetText "\ca\ui\data\igui_sidebriefing_indep_ca";
    };
} forEach GVAR(vehicle_ammobox_types);