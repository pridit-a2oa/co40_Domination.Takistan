if (isMultiplayer) exitWith {
    private ["_players"];

    _players = [];

    {
        [_players, _x] call BIS_fnc_arrayPush;
    } forEach (call BIS_fnc_listPlayers);

    _players
};

switchableUnits