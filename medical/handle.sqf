/**
 * Medical Module (Handler)
 */

#define THIS_MODULE medical
#include "x_macros.sqf"

if (hasInterface) then {
    if !(str player in GVAR(medics)) then {
        player addAction [
            "Use Medkit" call FUNC(common,KhakiText),
            __function(heal),
            [],
            9,
            false,
            true,
            "",
            "call d_fnc_medical_valid"
        ];
    };
};