{
    if (!isNil "_x" && {!(_x in (_this select 0))}) then {
        (_this select 0) set [
            count (_this select 0),
            _x
        ]
    }
} forEach (_this select 1);

(_this select 0)