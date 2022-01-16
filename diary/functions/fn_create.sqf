#define THIS_MODULE diary
#include "x_macros.sqf"
private ["_title", "_description"];

PARAMS_2(_title, _description);

player createDiaryRecord ["Diary", [_title, [_description] call FUNC(THIS_MODULE,format)]];