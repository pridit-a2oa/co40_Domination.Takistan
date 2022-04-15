#define THIS_MODULE common
#include "x_macros.sqf"
private ["_position", "_minDist", "_maxDist", "_objDist", "_waterMode", "_maxGrad", "_shoreMode"];

PARAMS_7(_position, _minDist, _maxDist, _objDist, _waterMode, _maxGrad, _shoreMode);

_position = [_position, _minDist, _maxDist, _objDist, _waterMode, _maxGrad, _shoreMode] call BIS_fnc_findSafePos;

if (count (_position nearRoads 25) > 0) exitWith {
    _this call FUNC(THIS_MODULE,safePos);
};

_position