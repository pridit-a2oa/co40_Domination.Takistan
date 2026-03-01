#define THIS_MODULE common
#include "x_macros.sqf"

FUNC(THIS_MODULE,GreyText) = {"<t color='#f0bfbfbf'>" + _this + "</t>"};
FUNC(THIS_MODULE,RedText) = {"<t color='#c54a30'>" + _this + "</t>"};
FUNC(THIS_MODULE,YellowText) = {"<t color='#a3ae55'>" + _this + "</t>"};
FUNC(THIS_MODULE,BlueText) = {"<t color='#5398b6'>" + _this + "</t>"};
FUNC(THIS_MODULE,BrownText) = {"<t color='#806f43'>" + _this + "</t>"};
FUNC(THIS_MODULE,KhakiText) = {"<t color='#809966'>" + _this + "</t>"};

GVAR(roles) = [
    [2, "ARTY"],
    [8, "ENGI"],
    [8, "MGUN"],
    [8, "MRKS"],
    [8, "MEDI"],
    [6, "PILT"]
];

{
    private ["_role"];

    call compile format ["d_%1 = [];", _x select 1];

    _role = call compile format ["d_%1", _x select 1];

    for "_i" from 1 to (_x select 0) do {
        [
            _role,
            (_x select 1) + str _i
        ] call BIS_fnc_arrayPush;
    };
} forEach GVAR(roles);