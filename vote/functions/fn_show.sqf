#define THIS_MODULE vote
#include "x_macros.sqf"
private ["_type", "_subtype", "_yes", "_no", "_start", "_vote", "_votes"];

disableSerialization;

createDialog "XD_VoteDialog";

_type = DIALOG("X_VOTE_DIALOG", 300);
_subtype = DIALOG("X_VOTE_DIALOG", 301);
_yes = DIALOG("X_VOTE_DIALOG", 400);
_no = DIALOG("X_VOTE_DIALOG", 401);
_start = DIALOG("X_VOTE_DIALOG", 500);

_start ctrlShow false;

{
    _x ctrlShow false;
} forEach [_type, _subtype];

{
    _x ctrlShow false;
    _x ctrlEnable false;
} forEach [_yes, _no];

_vote = X_JIPH getVariable QGVAR(vote);
_votes = [1, X_JIPH getVariable QGVAR(votes)] call FUNC(common,arrayValues);

switch ([_vote, ""] call BIS_fnc_areEqual) do {
    case true: {
        _start ctrlShow true;
        _start ctrlEnable false;

        _type ctrlShow true;

        {
            _type lbAdd (_x select 0);
        } forEach GVAR(vote_types);
    };

    case false: {
        private ["_voted"];

        _voted = [[X_JIPH getVariable QGVAR(votes), getPlayerUID player] call BIS_fnc_findNestedElement, []] call BIS_fnc_areEqual;

        DIALOG("X_VOTE_DIALOG", 100) ctrlSetText format [
            "Active Vote: %1",
            X_JIPH getVariable QGVAR(vote)
        ];

        DIALOG("X_VOTE_DIALOG", 102) ctrlSetText (switch (false) do {
            case GVAR(vote): {"You cannot participate in this vote"};
            case _voted: {"You have already voted"};
            default {""};
        });

        {
            private ["_button", "_choice", "_count", "_remain"];

            _button = _x select 0;
            _choice = _x select 1;

            _button ctrlShow true;


            _count = {[_x, _choice] call BIS_fnc_areEqual} count _votes;

            if ([_choice, true] call BIS_fnc_areEqual) then {
                _remain = (X_JIPH getVariable QGVAR(vote_players)) - _count;

                if (_remain < 1) exitWith {};

                DIALOG("X_VOTE_DIALOG", 101) ctrlSetText format [
                    "%1 Vote%2 Required",
                    _remain,
                    if (_remain > 1) then {"s"} else {""}
                ];
            };

            if !([_count, 0] call BIS_fnc_areEqual) then {
                _button ctrlSetText format [
                    "%1 (%2)",
                    ctrlText _button,
                    _count
                ]
            };
        } forEach [
            [_yes, true],
            [_no, false]
        ];

        if (GVAR(vote) && {_voted}) then {
            {
                _x ctrlEnable true;
            } forEach [_yes, _no];
        };
    };
};

{
    [
        (switch (_x select 1) do {
            case true: {200};
            case false: {201};
        }),
        (_x select 0) select 0
    ] call FUNC(THIS_MODULE,add);
} forEach (X_JIPH getVariable QGVAR(votes));