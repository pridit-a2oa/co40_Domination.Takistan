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
         
         _vehicle setVariable [QGVAR(cleanup), []];
         
         [
            [west, _vehicle],
            _vehicle modelToWorld [-7.2, 2, 0],
            (direction _vehicle) - 90,
            "SmallBase_EP1",
            0,
            [
                ["Paleta2", "FlagCarrierUSA_EP1"],
                ["USBasicWeapons_EP1", "US_WarfareBVehicleServicePoint_Base_EP1"]
            ]
        ] spawn FUNC(server,objectMapper);
     };
     
     case false: {
         _vehicle spawn {
             {
                 if (_x isKindOf "CAManBase") then {
                     _x setDamage 1;
                 };
                 
                 deleteVehicle _x;
                 
                 sleep 0.2;
             } forEach (_this getVariable QGVAR(cleanup));
         };
         
         _vehicle animate ["ramp_top", 0];
         _vehicle animate ["ramp_bottom", 0];
     };
 };