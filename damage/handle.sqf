/**
 * Damage Module (Handler)
 */

#define THIS_MODULE damage
#include "x_macros.sqf"

if (hasInterface) then {
    player setVariable [QGVAR(structure), 0];

    player addEventHandler ["HandleDamage", {
        private ["_unit", "_selection", "_damage", "_injurer", "_projectile"];

        PARAMS_5(_unit, _selection, _damage, _injurer, _projectile);

        switch (true) do {
            case !(alive _unit);
            case (_unit getVariable QGVAR(unconscious));
            // don't damage units by vehicle proxy, unless vehicle sustained significant damage (avoid exploding vehicle not injuring occupants but occupants may die before the vehicle does)
            case ([_selection, ""] call BIS_fnc_areEqual && {!([vehicle _unit, _unit] call BIS_fnc_areEqual)} && {damage (vehicle _unit) < 0.7});
            // don't damage if injurer is self, unless satcheled or impacting the ground via freefall
            case ([_unit, _injurer] call BIS_fnc_areEqual && {!([_projectile, "PipeBomb"] call BIS_fnc_areEqual)} && {!([animationState _injurer, "halofreefall"] call KRON_StrInStr)});
            // don't damage friendly units, unless self-inflicted or occupying the same vehicle
            case (!([_unit, _injurer] call BIS_fnc_areEqual) && {!([vehicle _unit, vehicle _injurer] call BIS_fnc_areEqual)} && {[side (group _injurer), side (group _unit)] call BIS_fnc_areEqual}): {
                _damage = 0;
            };

            default {
                private ["_limb", "_config"];

                _limb = false;

                _damage = [
                    _unit,
                    _damage,
                    _selection,
                    switch (true) do {
                        case ([_unit, vehicle _unit] call BIS_fnc_areEqual && {_injurer isKindOf "CAManBase" && {[getText (configFile >> "CfgAmmo" >> _projectile >> "simulation"), "shotBullet"] call BIS_fnc_areEqual}}): {
                            _unit getVariable QGVAR(damage_man)
                        };

                        default {
                            0.8
                        };
                    }
                ] call FUNC(THIS_MODULE,modifier);

                _config = configFile >> "cfgVehicles" >> (typeOf _unit);

                switch (_selection) do {
                    case "head_hit": {
                        private ["_armor"];

                        _armor = getNumber (_config >> "hitpoints" >> "HitHead" >> "armor");

                        _damage = ([
                            _unit,
                            _damage,
                            _selection,
                            0.6 + (1 - _armor)
                        ] call FUNC(THIS_MODULE,modifier)) min 0.89;
                    };

                    case "body": {
                        private ["_armor", "_pass_through"];

                        _armor = getNumber (_config >> "hitpoints" >> "HitBody" >> "armor");
                        _pass_through = getNumber (_config >> "hitpoints" >> "HitBody" >> "passThrough");

                        _damage = ([
                            _unit,
                            _damage,
                            _selection,
                            if (_pass_through < 1 && {[_armor, 1] call BIS_fnc_areEqual}) then {
                                0.5
                            } else {
                                0.6 + (1 - _armor)
                            }
                        ] call FUNC(THIS_MODULE,modifier)) min 0.89;
                    };

                    case "": {
                        _damage = ([
                            _unit,
                            _damage,
                            _selection,
                            1
                        ] call FUNC(THIS_MODULE,modifier)) min 0.89;
                    };

                    case "hands";
                    case "legs": {
                        _limb = true;

                        _damage = ([
                            _unit,
                            _damage,
                            _selection,
                            1
                        ] call FUNC(THIS_MODULE,modifier)) min 15;
                    };
                };

                39671 cutRsc [
                    [QGVAR(damage_blood_1), QGVAR(damage_blood_2)] call BIS_fnc_selectRandom,
                    "PLAIN"
                ];

                if (isNil QMODULE(revive)) exitWith {};

                switch (true) do {
                    case (_limb && {_damage >= 15});
                    case (!_limb && {_damage >= 0.89});
                    case (!([player, vehicle player] call BIS_fnc_areEqual) && {!alive (vehicle player)}): {
                        [_unit] call FUNC(revive,unconscious);
                    };
                };
            };
        };

        _damage
    }];
};