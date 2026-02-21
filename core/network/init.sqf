/**
 * Core Module - Network
 */

#define THIS_MODULE network
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,action),core\THIS_MODULE\functions\library\fn_action.sqf);
__cppfln(FUNC(THIS_MODULE,addAction),core\THIS_MODULE\functions\library\fn_addAction.sqf);
__cppfln(FUNC(THIS_MODULE,addEventHandler),core\THIS_MODULE\functions\library\fn_addEventHandler.sqf);
__cppfln(FUNC(THIS_MODULE,addMagazine),core\THIS_MODULE\functions\library\fn_addMagazine.sqf);
__cppfln(FUNC(THIS_MODULE,addMagazineTurret),core\THIS_MODULE\functions\library\fn_addMagazineTurret.sqf);
__cppfln(FUNC(THIS_MODULE,addScore),core\THIS_MODULE\functions\library\fn_addScore.sqf);
__cppfln(FUNC(THIS_MODULE,addWeapon),core\THIS_MODULE\functions\library\fn_addWeapon.sqf);
__cppfln(FUNC(THIS_MODULE,addWeaponTurret),core\THIS_MODULE\functions\library\fn_addWeaponTurret.sqf);
__cppfln(FUNC(THIS_MODULE,allowDamage),core\THIS_MODULE\functions\library\fn_allowDamage.sqf);
__cppfln(FUNC(THIS_MODULE,deleteMarkerLocal),core\THIS_MODULE\functions\library\fn_deleteMarkerLocal.sqf);
__cppfln(FUNC(THIS_MODULE,enableSimulation),core\THIS_MODULE\functions\library\fn_enableSimulation.sqf);
__cppfln(FUNC(THIS_MODULE,engineOn),core\THIS_MODULE\functions\library\fn_engineOn.sqf);
__cppfln(FUNC(THIS_MODULE,execVM),core\THIS_MODULE\functions\library\fn_execVM.sqf);
__cppfln(FUNC(THIS_MODULE,hideBody),core\THIS_MODULE\functions\library\fn_hideBody.sqf);
__cppfln(FUNC(THIS_MODULE,hideObject),core\THIS_MODULE\functions\library\fn_hideObject.sqf);
__cppfln(FUNC(THIS_MODULE,hintSilent),core\THIS_MODULE\functions\library\fn_hintSilent.sqf);
__cppfln(FUNC(THIS_MODULE,kbTell),core\THIS_MODULE\functions\library\fn_kbTell.sqf);
__cppfln(FUNC(THIS_MODULE,lock),core\THIS_MODULE\functions\library\fn_lock.sqf);
__cppfln(FUNC(THIS_MODULE,moveInCargo),core\THIS_MODULE\functions\library\fn_moveInCargo.sqf);
__cppfln(FUNC(THIS_MODULE,playActionNow),core\THIS_MODULE\functions\library\fn_playActionNow.sqf);
__cppfln(FUNC(THIS_MODULE,playMoveNow),core\THIS_MODULE\functions\library\fn_playMoveNow.sqf);
__cppfln(FUNC(THIS_MODULE,playSound),core\THIS_MODULE\functions\library\fn_playSound.sqf);
__cppfln(FUNC(THIS_MODULE,removeMagazine),core\THIS_MODULE\functions\library\fn_removeMagazine.sqf);
__cppfln(FUNC(THIS_MODULE,removeMagazines),core\THIS_MODULE\functions\library\fn_removeMagazines.sqf);
__cppfln(FUNC(THIS_MODULE,removeMagazinesTurret),core\THIS_MODULE\functions\library\fn_removeMagazinesTurret.sqf);
__cppfln(FUNC(THIS_MODULE,removeWeapon),core\THIS_MODULE\functions\library\fn_removeWeapon.sqf);
__cppfln(FUNC(THIS_MODULE,removeWeaponTurret),core\THIS_MODULE\functions\library\fn_removeWeaponTurret.sqf);
__cppfln(FUNC(THIS_MODULE,reveal),core\THIS_MODULE\functions\library\fn_reveal.sqf);
__cppfln(FUNC(THIS_MODULE,say3D),core\THIS_MODULE\functions\library\fn_say3D.sqf);
__cppfln(FUNC(THIS_MODULE,setAmmoCargo),core\THIS_MODULE\functions\library\fn_setAmmoCargo.sqf);
__cppfln(FUNC(THIS_MODULE,setDamage),core\THIS_MODULE\functions\library\fn_setDamage.sqf);
__cppfln(FUNC(THIS_MODULE,setDir),core\THIS_MODULE\functions\library\fn_setDir.sqf);
__cppfln(FUNC(THIS_MODULE,setFuel),core\THIS_MODULE\functions\library\fn_setFuel.sqf);
__cppfln(FUNC(THIS_MODULE,setGroupId),core\THIS_MODULE\functions\library\fn_setGroupId.sqf);
__cppfln(FUNC(THIS_MODULE,setHit),core\THIS_MODULE\functions\library\fn_setHit.sqf);
__cppfln(FUNC(THIS_MODULE,setObjectTexture),core\THIS_MODULE\functions\library\fn_setObjectTexture.sqf);
__cppfln(FUNC(THIS_MODULE,setOwner),core\THIS_MODULE\functions\library\fn_setOwner.sqf);
__cppfln(FUNC(THIS_MODULE,setRank),core\THIS_MODULE\functions\library\fn_setRank.sqf);
__cppfln(FUNC(THIS_MODULE,setVariable),core\THIS_MODULE\functions\library\fn_setVariable.sqf);
__cppfln(FUNC(THIS_MODULE,setVectorDir),core\THIS_MODULE\functions\library\fn_setVectorDir.sqf);
__cppfln(FUNC(THIS_MODULE,setVectorDirAndUp),core\THIS_MODULE\functions\library\fn_setVectorDirAndUp.sqf);
__cppfln(FUNC(THIS_MODULE,setVectorUp),core\THIS_MODULE\functions\library\fn_setVectorUp.sqf);
__cppfln(FUNC(THIS_MODULE,setVehicleAmmo),core\THIS_MODULE\functions\library\fn_setVehicleAmmo.sqf);
__cppfln(FUNC(THIS_MODULE,setVelocity),core\THIS_MODULE\functions\library\fn_setVelocity.sqf);
__cppfln(FUNC(THIS_MODULE,skipTime),core\THIS_MODULE\functions\library\fn_skipTime.sqf);
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