if (isMultiplayer) exitWith {
    private ["_players"];

    _players = [];

    {
        if (isPlayer _x && {!([_x, objNull] call BIS_fnc_areEqual)}) then {
            [_players, _x] call BIS_fnc_arrayPush;
        };
    } forEach (call BIS_fnc_listPlayers + allDead);

    _players
};

switchableUnits