if ([rank ((_this select 1) select 0), (_this select 1) select 1] call BIS_fnc_areEqual) exitWith {};

((_this select 1) select 0) setRank ((_this select 1) select 1);