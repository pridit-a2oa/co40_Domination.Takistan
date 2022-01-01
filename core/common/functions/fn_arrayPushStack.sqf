{
    if (!isNil "_x" && {(_this select 0) find _x == -1}) then {
        (_this select 0) set [count (_this select 0), _x]
    }
} forEach (_this select 1);

(_this select 0)