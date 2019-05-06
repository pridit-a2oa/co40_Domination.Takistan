#include "x_macros.sqf"
private ["_object", "_type"];

_object = _this select 0;
_amount = (_this select 3) select 0;
_cooldown = (_this select 3) select 1;

player playMove "AinvPknlMstpSlayWrflDnon_medic";

sleep 7;

if (!alive player) exitWith {};

deleteVehicle _object;

player setVariable [format [QUOTE(%1), _amount], (player getVariable (format [QUOTE(%1), _amount])) + 1];
player setVariable [format [QUOTE(%1), _cooldown], time + (call compile _cooldown)];