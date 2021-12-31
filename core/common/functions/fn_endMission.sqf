if (vehicle _this != _this) then {
    [_this, "action", ["Eject", vehicle _this]] call d_fnc_network_mp;
};

if (alive _this) then {
    _this setDamage 1;
};

[_this, "hideBody"] call d_fnc_network_mp;

if (isPlayer _this) then {
    [_this, "endMission", "END1"] call d_fnc_network_mp;
};

deleteVehicle _this;