/**
 * Vote Module - Diary Submodule
 */

#include "x_macros.sqf"

["Events", [
    "<img image='ca\missions_e\scenarios\SPE1_Littlebird.Takistan\overview_littlebird_ca' width='175'/>",
    "<br />The resistance you come across during the mission won't be isolated to towns, but across the entire map.",
    "<br />A small number of events can be <marker name=''>discovered</marker>, these areas are randomly generated and will be occupied.",
    "<br />Simply clearing this resistance will <marker name=''>complete</marker> the event and schedule a new one for creation.",
    if !(isNil QMODULE(item)) then {"<br />Additionally, these areas can also provide an opportunity to discover items."} else {""}
]] call FUNC(diary,create);