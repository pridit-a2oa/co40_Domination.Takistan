if (vehicle _this != _this) then {
    _this action ["Eject", vehicle _this];
};

if (alive _this) then {
    _this setDamage 1;
};

hideBody _this;

if (isPlayer _this) then {
    [_this, "endMission", "END1"] call d_fnc_network_mp;
};