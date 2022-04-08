/**
 * Vehicle Ammobox (Handler)
 */

#define THIS_MODULE vehicle_ammobox
#include "x_macros.sqf"

if (hasInterface) then {
    if (!isNil QMODULE(3d)) then {
        [
            GVAR(ammoload),
            format ["%1<br /><t color='#f0bfbfbf' size='0.6'>Use the vehicle menu to load a box</t>", "Ammobox Load Point" call FUNC(common,YellowText)],
            [],
            true
        ] spawn FUNC(3d,create);
    };
};