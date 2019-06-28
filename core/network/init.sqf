/**
 * Core Module - Network
 */

#define THIS_MODULE network
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,engineOn),core\THIS_MODULE\functions\fn_engineOn.sqf);
__cppfln(FUNC(THIS_MODULE,kbTell),core\THIS_MODULE\functions\fn_kbTell.sqf);
__cppfln(FUNC(THIS_MODULE,lock),core\THIS_MODULE\functions\fn_lock.sqf);
__cppfln(FUNC(THIS_MODULE,setCaptive),core\THIS_MODULE\functions\fn_setCaptive.sqf);
__cppfln(FUNC(THIS_MODULE,setDamage),core\THIS_MODULE\functions\fn_setDamage.sqf);
__cppfln(FUNC(THIS_MODULE,setFuel),core\THIS_MODULE\functions\fn_setFuel.sqf);
__cppfln(FUNC(THIS_MODULE,setHit),core\THIS_MODULE\functions\fn_setHit.sqf);
__cppfln(FUNC(THIS_MODULE,setUnconscious),core\THIS_MODULE\functions\fn_setUnconscious.sqf);
__cppfln(FUNC(THIS_MODULE,setVectorDir),core\THIS_MODULE\functions\fn_setVectorDir.sqf);
__cppfln(FUNC(THIS_MODULE,setVectorUp),core\THIS_MODULE\functions\fn_setVectorUp.sqf);
__cppfln(FUNC(THIS_MODULE,setVelocity),core\THIS_MODULE\functions\fn_setVelocity.sqf);
__cppfln(FUNC(THIS_MODULE,switchMove),core\THIS_MODULE\functions\fn_switchMove.sqf);

"engineOnGlobal" addPublicVariableEventHandler {
    (_this select 1) call FUNC(THIS_MODULE,engineOn);
};

"kbTellGlobal" addPublicVariableEventHandler {
    (_this select 1) call FUNC(THIS_MODULE,kbTell);
};

"lockGlobal" addPublicVariableEventHandler {
    (_this select 1) call FUNC(THIS_MODULE,lock);
};

"setCaptiveGlobal" addPublicVariableEventHandler {
    (_this select 1) call FUNC(THIS_MODULE,setCaptive);
};

"setDamageGlobal" addPublicVariableEventHandler {
    (_this select 1) call FUNC(THIS_MODULE,setDamage);
};

"setFuelGlobal" addPublicVariableEventHandler {
    (_this select 1) call FUNC(THIS_MODULE,setFuel);
};

"setHitGlobal" addPublicVariableEventHandler {
    ((_this select 1) select 0) setHit [((_this select 1) select 1), ((_this select 1) select 2)];
};

"setUnconsciousGlobal" addPublicVariableEventHandler {
    ((_this select 1) select 0) setUnconscious ((_this select 1) select 1);
};

"setVectorDirGlobal" addPublicVariableEventHandler {
    ((_this select 1) select 0) setVectorDir ((_this select 1) select 1);
};

"setVectorUpGlobal" addPublicVariableEventHandler {
    ((_this select 1) select 0) setVectorUp ((_this select 1) select 1);
};

"setVelocityGlobal" addPublicVariableEventHandler {
    ((_this select 1) select 0) setVelocity ((_this select 1) select 1);
};

"switchMoveGlobal" addPublicVariableEventHandler {
    ((_this select 1) select 0) switchMove ((_this select 1) select 1);
};

MODULE(THIS_MODULE) = true;