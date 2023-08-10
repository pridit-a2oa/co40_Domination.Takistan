#include "x_macros.sqf"
private ["_array", "_format"];

PARAMS_1(_array);

_format = "";

{
    private ["_weapon", "_magazine"];
    
    switch (typeName (_x select 0)) do {
        case "ARRAY": {
            _weapon = (_x select 0) select 0;
            _magazine = (_x select 0) select 1;
        };

        case "STRING": {
            _weapon = _x select 0;
            _magazine = getArray ((configFile >> "CfgWeapons" >> _x select 0 >> "magazines")) select 0;
        };
    };

    _format = _format + format [
        "%1 (%2)<br />",
        getText (configFile >> "CfgWeapons" >> _weapon >> "displayName"),
        (getNumber (configFile >> "CfgMagazines" >> _magazine >> "count")) * (_x select 1)
    ];
} forEach _array;

_format