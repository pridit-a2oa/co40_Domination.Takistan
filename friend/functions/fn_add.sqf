#include "x_macros.sqf"
private ["_friend", "_file"];

PARAMS_1(_friend);

_file = format ["d_sound_friend_%1", round (random 1)];

player action ["salute", player];

player setVariable [QGVAR(friends), (player getVariable QGVAR(friends)) + [getPlayerUIDOld _friend]];

_file spawn {
    sleep 0.5;
    
    [nil, player, rSay, (format ["%1", _this]), 20] call RE;
};