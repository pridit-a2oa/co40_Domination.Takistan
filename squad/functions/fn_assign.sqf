#include "x_macros.sqf"

waitUntil {!isNil QMODULE(network)};

if (GVAR(artillery) find (str(player)) != -1) then {
    [player, "Alpha"] call FUNC(network,setGroupId);
};

if (GVAR(engineers) find (str(player)) != -1) then {
    [player, "Bravo"] call FUNC(network,setGroupId);
};

if (GVAR(machine_gunners) find (str(player)) != -1) then {
    [player, "Charlie"] call FUNC(network,setGroupId);
};

if (GVAR(marksman) find (str(player)) != -1) then {
    [player, "Delta"] call FUNC(network,setGroupId);
};

if (GVAR(medics) find (str(player)) != -1) then {
    [player, "Echo"] call FUNC(network,setGroupId);
};

if (GVAR(pilots) find (str(player)) != -1) then {
    [player, "Foxtrot"] call FUNC(network,setGroupId);
};