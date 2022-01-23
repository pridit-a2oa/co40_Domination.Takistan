/**
 * Base 3D Module (Handler)
 */

#define THIS_MODULE base_3d
#include "x_macros.sqf"

if (hasInterface) then {
    private ["_name"];

    {
        {
            _name = _x getVariable QGVAR(name);

            if (!isNil "_name" && {!isNil QMODULE(3d)}) then {
                [
                    _x,
                    format [
                        "<t size='0.8'>%1</t><t color='#f0bfbfbf' size='0.6'>%2</t>",
                        ([_name] call FUNC(vehicle,name)) call FUNC(common,BlueText),
                        [_name] call FUNC(THIS_MODULE,description)
                    ],
                    [],
                    true
                ] spawn FUNC(3d,create);

                sleep 0.1;
            };
        } forEach (allMissionObjects _x);
    } forEach GVAR(base_3d_type_objects);
};