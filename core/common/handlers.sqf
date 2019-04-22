/**
 * Core Module - Common (client & server)
 */

#include "x_macros.sqf"

if (!isNil QMODULE(airdrop)) then {
    __handler(airdrop);
};

if (!isNil QMODULE(airtaxi)) then {
    __handler(airtaxi);
};

if (!isNil QMODULE(artillery)) then {
    __handler(artillery);
};

if (!isNil QMODULE(backpack)) then {
    __handler(backpack);
};

if (!isNil QMODULE(base)) then {
    __handler(base);
};

if (!isNil QMODULE(base_ammobox)) then {
    __handler(base_ammobox);
};

if (!isNil QMODULE(base_backpack)) then {
    __handler(base_backpack);
};

if (!isNil QMODULE(base_halo)) then {
    __handler(base_halo);
};

if (!isNil QMODULE(base_shield)) then {
    __handler(base_shield);
};

if (!isNil QMODULE(base_teleport)) then {
    __handler(base_teleport);
};

if (!isNil QMODULE(base_wreck)) then {
    __handler(base_wreck);
};

if (!isNil QMODULE(board)) then {
    __handler(board);
};

if (!isNil QMODULE(cleanup)) then {
    __handler(cleanup);
};

if (!isNil QMODULE(perk)) then {
    __handler(perk);
};

if (!isNil QMODULE(vehicle_bonus)) then {
    __handler(vehicle_bonus);
};

if (!isNil QMODULE(vehicle_service)) then {
    __handler(vehicle_service);
};

// _handlers = [
//     "airdrop",
//     "airtaxi",
//     "artillery",
//     "backpack",
//     "base",
//     "base_ammobox",
//     "base_backpack",
//     "base_halo",
//     "base_shield",
//     "base_teleport",
//     "base_wreck",
//     "board",
//     "cleanup",
//     "perk",
//     "vehicle_bonus",
//     "vehicle_service"
// ];

// {
//     if (!isNil (format [QMODULE(%1), _x])) then {
//         __handler();
//     };
// } forEach _handlers;