private ["_type", "_target", "_targetKits", "_targetMax"];

_type = format ["d_inventory_%1", (_this select 0)];
_target = _this select 1;

_targetKits = _target getVariable _type;
_targetMax = _target getVariable (_type + "_max");

// player must have item
if (player getVariable _type < 1) exitWith {false};

// player cannot be the target
if (player == _target) exitWith {false};

// player must be on foot
if (player != vehicle player) exitWith {false};

// target must be alive
if (!alive _target) exitWith {false};

// target already has item
if (_targetKits > 0) exitWith {false};

// giving an item would exceed maximum capacity
if (_targetMax > 0 && {(_targetKits + 1) > _targetMax}) exitWith {false};

true