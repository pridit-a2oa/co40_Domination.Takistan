/**
 * Accolade Module - Diary Submodule
 */

#include "x_macros.sqf"

if ([GVAR(accolade_types), []] call BIS_fnc_areEqual) exitWith {};

["Accolades", [
    "<img image='ca\missions_e\bootcamp\TE01_Basic_controls.Zargabad\overview_ca' width='170'/>",
    "<br />Accolades is the name of the proficiency system, designed as a way to introduce and familiarize systems and mechanics.",
    format ["<br />There are a total of %1 distinct <marker name=''>NPC task givers</marker> of different disciplines within the building at base, closest to spawn.", count GVAR(accolade_types)],
    "<br />Entry tasks are extremely basic and completable from within the base, so have <marker name=''>no rewards</marker>, as they act as a tutorial.",
    "<br />Tasks must be <marker name=''>completed in sequence</marker> and cannot be skipped, essentially earning proficiency for each completed task.",
    "<br />In addition to experience points, some tasks may also <marker name=''>reward an item</marker> relevant to the task that was completed.",
    "<br />Most time intensive tasks will <marker name=''>track passively</marker> across multiple sessions, but cannot be completed until accepted.",
    "<br />Completion of tasks (XP gaining) works towards <marker name=''>climbing rank</marker>, though this impact is purely cosmetic."
]] call FUNC(diary,create);