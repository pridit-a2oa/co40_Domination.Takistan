/**
 * Board Module
 */

{
    help addAction [_x, format ["board\help\%1.sqf", toLower(_x)]];
} forEach ["Missions", "Perks", "Roles", "Tips"];