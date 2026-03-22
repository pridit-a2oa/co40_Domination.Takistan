/**
 * Vehicle Cargo Module - Diary Submodule
 */

#include "x_macros.sqf"
private ["_cargo"];

_cargo = "";

{
    private ["_types"];

    _types = "";

    {
        _types = _types + format ["<img image='%1' width='20'/>", ([_x] call FUNC(vehicle,type)) select 1];
    } forEach ((_x select 1) select 0);

    if !([getText (configFile >> "CfgVehicles" >> (_x select 0) >> "picture"), ""] call BIS_fnc_areEqual) then {
        _cargo = _cargo + format ["<br />- %1: %2<br />", [_x select 0] call FUNC(vehicle,name), _types, (_x select 1) select 1];
    };
} forEach GVAR(vehicle_cargo_types);

if ([count GVAR(vehicle_cargo_types), 0] call BIS_fnc_areEqual) exitWith {};

["Vehicle Cargo", [
    "<img image='ca\missions2_pmc\data\overview_spp01_ca' width='175'/>",
    "<br />Some vehicles are designated as cargo carriers, enabling them to load a subset of other vehicles into their cargo bay.",
    if !(isNil QMODULE(menu_vehicle)) then {"<br />To load cargo into a bay, bring an eligible vehicle to the <marker name=''>rear of the ramp</marker> and use the vehicle menu."} else {""},
    "<br />All cargo bays <marker name=''>cannot load equivalent types</marker>, as this is generally determined by the size of the bay:",
    _cargo,
    "The loaded cargo amount will <marker name=''>always be visible</marker> via the carrier's map marker through a '(+x)' designation.",
    if !(isNil QMODULE(vehicle_deploy)) then {"<br />Deployed vehicles nullify this utility, and importantly <marker name=''>cannot be deployed</marker> with an occupied cargo bay."} else {""}
]] call FUNC(diary,create);