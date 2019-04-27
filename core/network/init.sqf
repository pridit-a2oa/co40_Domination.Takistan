/**
 * Core Module - Network
 */

#define THIS_MODULE network
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,kbTell),core\THIS_MODULE\functions\fn_kbTell.sqf);
__cppfln(FUNC(THIS_MODULE,setDamage),core\THIS_MODULE\functions\fn_setDamage.sqf);
__cppfln(FUNC(THIS_MODULE,setFuel),core\THIS_MODULE\functions\fn_setFuel.sqf);
__cppfln(FUNC(THIS_MODULE,setHit),core\THIS_MODULE\functions\fn_setHit.sqf);
__cppfln(FUNC(THIS_MODULE,setVectorUp),core\THIS_MODULE\functions\fn_setVectorUp.sqf);

"kbTellGlobal" addPublicVariableEventHandler {
    (_this select 1) call FUNC(THIS_MODULE,kbTell);
};

"setDamageGlobal" addPublicVariableEventHandler {
    (_this select 1) call FUNC(THIS_MODULE,setDamage);
};

"setFuelGlobal" addPublicVariableEventHandler {
    (_this select 1) call FUNC(THIS_MODULE,setFuel);
};

"setHitGlobal" addPublicVariableEventHandler {
    (_this select 1) call FUNC(THIS_MODULE,setHit);
};

"setVectorUpGlobal" addPublicVariableEventHandler {
    (_this select 1) call FUNC(THIS_MODULE,setVectorUp);
};

MODULE(THIS_MODULE) = true;