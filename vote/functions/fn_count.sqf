#include "x_macros.sqf"
private ["_required"];

_required = ceil (count (call FUNC(common,players)) * GVAR(vote_amount_factor));

(_required max GVAR(vote_amount_players))