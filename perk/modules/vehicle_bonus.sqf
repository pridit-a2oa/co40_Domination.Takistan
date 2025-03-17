/**
 * Perk Module - Vehicle Bonus Submodule
 */

#define THIS_MODULE perk
#include "x_macros.sqf"
private ["_vehicle", "_fly"];

PARAMS_1(_vehicle);

while {true} do {
    waitUntil {sleep 0.1; !isNull player};

    _fly = player getVariable QGVAR(pilot);

    if (!_fly && {[player, driver _vehicle] call BIS_fnc_areEqual}) then {
        player action ["Eject", _vehicle];

        hint parseText "<br /><t size='1.1'><t color='#c54a30' underline='1' align='center'>MISSING&#160;PERK</t><br /><br />You must unlock the <t color='#a3ae55'>Fly attack aircraft</t> perk to pilot this vehicle</t><br /><br />";

        if (player getVariable QGVAR(perk_points) > 0) then {
            call FUNC(THIS_MODULE,show);
        };

        _vehicle addEventHandler ["getout", {
            if (player getVariable QGVAR(pilot)) exitWith {};

            (_this select 0) spawn {
                if (canMove _this) then {
                    [_this, "setHit", ["motor", 1]] call FUNC(network,mp);

                    sleep 1;

                    [_this, "setHit", ["motor", 0]] call FUNC(network,mp);
                };

                _this engineOn false;
            };
        }];
    };

    sleep 1;
};