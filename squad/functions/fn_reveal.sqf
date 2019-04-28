0 spawn {
    sleep 1;

    {player reveal _x} forEach ((position player) nearObjects 200);
};