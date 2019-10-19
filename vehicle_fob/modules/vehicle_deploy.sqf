/**
 * Vehicle FOB Module - Vehicle Deploy Submodule
 */

 #include "x_macros.sqf"
 private ["_vehicle", "_state"];

 PARAMS_2(_vehicle, _state);

 switch (_state) do {
     case true: {
         _vehicle animate ["ramp_top", 1];
         _vehicle animate ["ramp_bottom", 1];
     };
     
     case false: {
         _vehicle animate ["ramp_top", 0];
         _vehicle animate ["ramp_bottom", 0];
     };
 };