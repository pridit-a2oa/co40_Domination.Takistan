/**
 * Accolade Module - Diary Submodule
 */

#include "x_macros.sqf"

if ([GVAR(accolade_types), []] call BIS_fnc_areEqual) exitWith {};

["Accolades", [
    "<img image='ca\missions_e\bootcamp\TE01_Basic_controls.Zargabad\overview_ca' width='170'/>",
    "<br />Accolades is the name of the proficiency system, designed as a way to introduce and familiarize systems and mechanics.",
    "<br />There are a total of 4 distinct <marker name=''>NPC task givers</marker> of different disciplines within the building at base, closest to spawn.",
    "<br />Entry tasks are extremely basic and base completable, so have <marker name=''>no rewards</marker>, as they are intended to build rapport.",
    "<br />In addition to experience points, some tasks may also <marker name=''>reward an item</marker> relevant to the task that was completed.",
    "<br />The most time intensive tasks will <marker name=''>track passively</marker> across multiple sessions, but cannot be completed until accepted.",
    "<br />Completion of tasks (XP gaining) works towards climbing rank, though this has <marker name=''>no gameplay impact</marker> and is purely cosmetic."
    // "<br />Reaching max rank (by completing all tasks) earns <marker name=''>veterancy status</marker>, in the form of a Discord role as token of achievement."
]] call FUNC(diary,create);