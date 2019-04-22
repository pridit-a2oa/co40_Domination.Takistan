_type = format ["d_perk%1", (_this select 0)];
_target = _this select 1;

_targetKits = _target getVariable _type;
_targetMax = _target getVariable (_type + "Max");

// player must have item
if (player getVariable _type < 1) exitWith {false};

// player cannot be the target
if (player == _target) exitWith {false};

// target must be alive
if (!alive _target) exitWith {false};

// player must be on foot
if (vehicle player != player) exitWith {false};

// giving an item would exceed maximum capacity
if (_targetMax > 0 && {(_targetKits + 1) > _targetMax}) exitWith {false};

// item(s) already given
if (_targetMax < 1 && {_targetKits > 0}) exitWith {false};

true