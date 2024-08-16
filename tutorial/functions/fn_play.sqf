#define THIS_MODULE tutorial
#include "x_macros.sqf"
private ["_sequences", "_camera"];

PARAMS_1(_sequences);

titleText ["TUTORIAL", "BLACK FADED", 4];

sleep 4;

showCinemaBorder true;

{
    if ([_forEachIndex, 0] call BIS_fnc_areEqual) then {
        _camera = "camera" camCreate (_x select 0);
        _camera cameraEffect ["internal", "back"];
    };

    _camera camSetTarget (_x select 0);
    _camera camSetRelPos (_x select 1);
    _camera camSetFOV 0.500;
    _camera camCommit 0;

    if ([_forEachIndex, 0] call BIS_fnc_areEqual) then {
        titleText ["", "BLACK IN", 4];

        sleep 1;
    };

    [format ["<t color='#f0bfbfbf' size='.5'>%1</t>", _x select 2], -1, 1.25, 13, 2, 0, 789] spawn BIS_fnc_dynamicText;

    if ([_forEachIndex + 1, count _sequences] call BIS_fnc_areEqual) exitWith {
        sleep 13;

        titleText ["", "BLACK", 1];

        sleep 2;
    };

    sleep 12;
} forEach _sequences;

player cameraEffect ["terminate", "back"];

camDestroy _camera;

showCinemaBorder false;

if (!isNil QMODULE(setting)) then {
    __submodulePP(setting);
};

GVAR(tutorial) = false;