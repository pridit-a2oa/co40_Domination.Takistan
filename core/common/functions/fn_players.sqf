if (isMultiplayer) exitWith {
    private ["_players"];

    _players = [];

    {
        if !(isNull _x) then {
            _players = _players + [_x]
        };
    } forEach (call BIS_fnc_listPlayers);

    _players
};

switchableUnits