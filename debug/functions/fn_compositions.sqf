/**
 * Original Author: rok
 */

private["_posX", "_posY", "_i", "_cfg", "_count", "_cfgiName", "_markerName", "_cfgiTags"];

sleep 1;

_posX = (getPos player) select 0;
_posY = ((getPos player) select 1) + 50;

// Read Config File
_cfg =(configFile >> "CfgObjectCompositions");
_count = count _cfg;

hintSilent "Starting Composition Generation...";

for [{_i = 0}, {_i < _count}, {_i = _i + 1}] do
{
_cfgiName = configName (_cfg select _i);
_cfgiTags = getArray ((_cfg select _i) >> "tags");

// Create Marker
_markerName = createMarker["mrk" + _cfgiName, [_posX + (_i%8)*400, _posY + floor(_i/8)*90 + (_i%2)*45]];
_markerName setMarkerShape "ICON";
_markerName setMarkerType "FOB";
_markerName setMarkerText _cfgiName;

// Marker Color
if ("west" in _cfgiTags) then { _markerName setMarkerColor "ColorBlue"; };
if ("east" in _cfgiTags) then { _markerName setMarkerColor "ColorRed"; };
if ("resistance" in _cfgiTags) then { _markerName setMarkerColor "ColorYellow"; };

// Create Composition
_newComp = [(getMarkerPos _markerName), (markerDir _markerName), _cfgiName] call (compile (preprocessFileLineNumbers "ca\modules\dyno\data\scripts\objectMapper.sqf"));

};

hintSilent "..done!";

// Teleport with ALT + LMB
onMapSingleClick "
if ((local player) and _alt) then
{
(vehicle player) setPos _pos;
}";