/**
 * Core Module - Network
 */

#define THIS_MODULE network
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,addAction),core\THIS_MODULE\functions\library\fn_addAction.sqf);
__cppfln(FUNC(THIS_MODULE,addEventHandler),core\THIS_MODULE\functions\library\fn_addEventHandler.sqf);
__cppfln(FUNC(THIS_MODULE,addMagazine),core\THIS_MODULE\functions\library\fn_addMagazine.sqf);
__cppfln(FUNC(THIS_MODULE,directSay),core\THIS_MODULE\functions\library\fn_directSay.sqf);
__cppfln(FUNC(THIS_MODULE,enableSimulation),core\THIS_MODULE\functions\library\fn_enableSimulation.sqf);
__cppfln(FUNC(THIS_MODULE,engineOn),core\THIS_MODULE\functions\library\fn_engineOn.sqf);
__cppfln(FUNC(THIS_MODULE,execVM),core\THIS_MODULE\functions\library\fn_execVM.sqf);
__cppfln(FUNC(THIS_MODULE,hideObject),core\THIS_MODULE\functions\library\fn_hideObject.sqf);
__cppfln(FUNC(THIS_MODULE,kbTell),core\THIS_MODULE\functions\library\fn_kbTell.sqf);
__cppfln(FUNC(THIS_MODULE,lock),core\THIS_MODULE\functions\library\fn_lock.sqf);
__cppfln(FUNC(THIS_MODULE,moveInCargo),core\THIS_MODULE\functions\library\fn_moveInCargo.sqf);
__cppfln(FUNC(THIS_MODULE,playActionNow),core\THIS_MODULE\functions\library\fn_playActionNow.sqf);
__cppfln(FUNC(THIS_MODULE,playMoveNow),core\THIS_MODULE\functions\library\fn_playMoveNow.sqf);
__cppfln(FUNC(THIS_MODULE,playSound),core\THIS_MODULE\functions\library\fn_playSound.sqf);
__cppfln(FUNC(THIS_MODULE,removeMagazines),core\THIS_MODULE\functions\library\fn_removeMagazines.sqf);
__cppfln(FUNC(THIS_MODULE,reveal),core\THIS_MODULE\functions\library\fn_reveal.sqf);
__cppfln(FUNC(THIS_MODULE,say),core\THIS_MODULE\functions\library\fn_say.sqf);
__cppfln(FUNC(THIS_MODULE,setDamage),core\THIS_MODULE\functions\library\fn_setDamage.sqf);
__cppfln(FUNC(THIS_MODULE,setDir),core\THIS_MODULE\functions\library\fn_setDir.sqf);
__cppfln(FUNC(THIS_MODULE,setFuel),core\THIS_MODULE\functions\library\fn_setFuel.sqf);
__cppfln(FUNC(THIS_MODULE,setGroupId),core\THIS_MODULE\functions\library\fn_setGroupId.sqf);
__cppfln(FUNC(THIS_MODULE,setHit),core\THIS_MODULE\functions\library\fn_setHit.sqf);
__cppfln(FUNC(THIS_MODULE,setVectorDir),core\THIS_MODULE\functions\library\fn_setVectorDir.sqf);
__cppfln(FUNC(THIS_MODULE,setVectorUp),core\THIS_MODULE\functions\library\fn_setVectorUp.sqf);
__cppfln(FUNC(THIS_MODULE,setVehicleAmmo),core\THIS_MODULE\functions\library\fn_setVehicleAmmo.sqf);
__cppfln(FUNC(THIS_MODULE,setVelocity),core\THIS_MODULE\functions\library\fn_setVelocity.sqf);
__cppfln(FUNC(THIS_MODULE,spawn),core\THIS_MODULE\functions\library\fn_spawn.sqf);
__cppfln(FUNC(THIS_MODULE,switchAction),core\THIS_MODULE\functions\library\fn_switchAction.sqf);
__cppfln(FUNC(THIS_MODULE,switchMove),core\THIS_MODULE\functions\library\fn_switchMove.sqf);
__cppfln(FUNC(THIS_MODULE,systemChat),core\THIS_MODULE\functions\library\fn_systemChat.sqf);
__cppfln(FUNC(THIS_MODULE,vehicleChat),core\THIS_MODULE\functions\library\fn_vehicleChat.sqf);

__cppfln(FUNC(THIS_MODULE,mp),core\THIS_MODULE\functions\fn_mp.sqf);

"BIS_fnc_MP_packet" addPublicVariableEventHandler {
    (_this select 1) call FUNC(THIS_MODULE,mp);
};

MODULE(THIS_MODULE) = true;