/**
 * Vehicle Texture Module
 *
 * Description: This module enables players to switch textures of vehicles.
 *
 */

#define THIS_MODULE vehicle_texture
#include "x_macros.sqf"

// Valid types of texture types: vehicle, name, (optional) addon, texture(s)
GVAR(vehicle_texture_types) = [
    ["A10_US_EP1", [
        [["Black", ["STI_A10", isClass (configFile >> "CfgFactionClasses" >> "STI_A10")]], [
            "\sti_a10\black\a10_01_co_black",
            "\sti_a10\black\a10_02_co_black"
        ]],

        [["Green", ["STI_A10", isClass (configFile >> "CfgFactionClasses" >> "STI_A10")]], [
            "\sti_a10\green\a10_01_co_green",
            "\sti_a10\green\a10_02_co_green"
        ]],

        [["Desert", ["STI_A10", isClass (configFile >> "CfgFactionClasses" >> "STI_A10")]], [
            "\sti_a10\desert\a10_01_co_desert",
            "\sti_a10\desert\a10_02_co_desert"
        ]],

        [["Winter", ["STI_A10", isClass (configFile >> "CfgFactionClasses" >> "STI_A10")]], [
            "\sti_a10\winter\a10_01_co_winter",
            "\sti_a10\winter\a10_02_co_winter"
        ]]
    ]]
];

// Maximum distance from base the texture can be changed
GVAR(vehicle_texture_distance_base) = 450;

__cppfln(FUNC(THIS_MODULE,addon),THIS_MODULE\functions\fn_addon.sqf);
__cppfln(FUNC(THIS_MODULE,default),THIS_MODULE\functions\fn_default.sqf);
__cppfln(FUNC(THIS_MODULE,options),THIS_MODULE\functions\fn_options.sqf);
__cppfln(FUNC(THIS_MODULE,set),THIS_MODULE\functions\fn_set.sqf);
__cppfln(FUNC(THIS_MODULE,switch),THIS_MODULE\functions\fn_switch.sqf);
__cppfln(FUNC(THIS_MODULE,textures),THIS_MODULE\functions\fn_textures.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);

MODULE(THIS_MODULE) = true;