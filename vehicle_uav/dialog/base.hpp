class XD_VehicleUavDialog {
    idd = -1;
    movingEnable = false;
    objects[] = {};
    onLoad="uiNamespace setVariable ['X_VEHICLE_UAV_DIALOG', _this select 0]";
    onUnLoad="uiNamespace setVariable ['X_VEHICLE_UAV_DIALOG', nil]";
    class controlsBackground {
        class RscVehicleUavBackground: RscMapWithListBackground {
			text = "ca\ui\data\ui_armory_background_ca";
		};
    };
    class controls {
        class RscVehicleUavTextTitle: RscMapWithListTextTitle
        {
            text = "UAV Terminal";
        };
        class RscVehicleUavMapControl: RscMapWithListMapControl
        {
			idc = 100;
            onMouseButtonDown = "if !([lbCurSel 200, -1] call BIS_fnc_areEqual) then {call d_fnc_vehicle_uav_populate}";
            onMouseZChanged = "if !([lbCurSel 200, -1] call BIS_fnc_areEqual) then {call d_fnc_vehicle_uav_populate}";
        };
        class RscVehicleUavListbox: RscMapWithListListbox
        {
			idc = 200;
            onLBSelChanged = "[_this select 1] call d_fnc_vehicle_uav_switch";
            onLBDblClick = "call d_fnc_vehicle_uav_action";
        };
        class RscVehicleUavButtonAction: RscMapWithListButtonAction
        {
			idc = 300;
            action = "call d_fnc_vehicle_uav_action";
        };
        class RscVehicleUavButtonClose: RscMapWithListButtonClose {};
    };
};