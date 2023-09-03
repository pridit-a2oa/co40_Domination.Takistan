// $[1.03,[[0,0,1,1],0.02125,0.02],[1200,"",[0,"",[0.3,0.4,0.42,0.4],[-1,-1,-1,-1],[0,0.3,0,0.2],[-1,-1,-1,-1],""],[]],[1201,"",[0,"",[0.626875,0.69,0.074375,0.09],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1000,"",[0,"Stryker MEV",[0.31875,0.75,0.19596,0.0324677],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1001,"",[0,"200m",[0.31875,0.42,0.157122,0.0307361],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1202,"",[0,"\ca\ui\data\ui_tankdir_forward_ca.paa",[0.44625,0.48,0.116875,0.15],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1203,"",[0,"\ca\ui\data\ui_tankdir_back_ca.paa",[0.44625,0.55,0.116875,0.15],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1204,"",[0,"\ca\ui\data\ui_tankdir_left_ca.paa",[0.414375,0.52,0.116875,0.15],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1205,"",[0,"\ca\ui\data\ui_tankdir_right_ca.paa",[0.478125,0.52,0.116875,0.15],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1206,"",[0,"\ca\ui\data\ui_tankdir_stop_ca.paa",[0.44625,0.52,0.116875,0.15],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]]]
class XD_VehicleLiftDialog {
    idd = -1;
    movingEnable = 0;
    duration = 0.1;
    fadein = 0;
    fadeout = 0;
    onLoad = "uiNamespace setVariable ['X_VEHICLE_LIFT_DIALOG', _this select 0];";
    onUnload = "uiNamespace setVariable ['X_VEHICLE_LIFT_DIALOG', displayNull];";
    class controlsBackground {
        class RscVehicleLiftBackground: XD_RscPicture
        {
            style = 128;
            colorBackground[] = {0, 0.3, 0, 0.2};
            sizeEx = 0.015;
            x = 0.3;
			y = 0.4;
			w = 0.42;
			h = 0.4;
        };
    };
	class controls {
		class RscVehicleLiftType: XC_RscText
		{
			idc = 100;
			font = "Zeppelin32";
			colorText[] = {0.543, 0.5742, 0.4102, 0.9};
			colorBackground[] = {0, 0, 0, 0};
			x = 0.31875;
			y = 0.75;
			w = 0.19596;
			h = 0.0324677;
		};
		class RscVehicleLiftDistance: XC_RscText
		{
			idc = 101;
			font = "Zeppelin32";
			colorText[] = {0.543, 0.5742, 0.4102, 0.9};
			colorBackground[] = {0, 0, 0, 0};
			x = 0.31875;
			y = 0.42;
			w = 0.157122;
			h = 0.0307361;
		};
		class RscVehicleLiftVehicle: XD_RscPicture
		{
			idc = 200;
			style = ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
            colorText[] = {0.543, 0.5742, 0.4102, 0.9};
			x = 0.626875;
            y = 0.69;
            w = 0.074375;
            h = 0.09;
		};
		class RscVehicleLiftArrowUp: XD_RscPicture
		{
			idc = 300;
			colorText[] = {1, 1, 1, 0.25};
			text = "\ca\ui\data\ui_tankdir_forward_ca.paa";
			x = 0.44625;
			y = 0.48;
			w = 0.116875;
			h = 0.15;
		};
		class RscVehicleLiftArrowDown: XD_RscPicture
		{
			idc = 301;
			colorText[] = {1, 1, 1, 0.25};
			text = "\ca\ui\data\ui_tankdir_back_ca.paa";
			x = 0.44625;
			y = 0.55;
			w = 0.116875;
			h = 0.15;
		};
		class RscVehicleLiftArrowLeft: XD_RscPicture
		{
			idc = 302;
			colorText[] = {1, 1, 1, 0.25};
			text = "\ca\ui\data\ui_tankdir_left_ca.paa";
			x = 0.414375;
			y = 0.52;
			w = 0.116875;
			h = 0.15;
		};
		class RscVehicleLiftArrowRight: XD_RscPicture
		{
			idc = 303;
			colorText[] = {1, 1, 1, 0.25};
			text = "\ca\ui\data\ui_tankdir_right_ca.paa";
			x = 0.478125;
			y = 0.52;
			w = 0.116875;
			h = 0.15;
		};
		class RscVehicleLiftReady: XD_RscPicture
		{
			idc = 304;
			colorText[] = {1, 1, 1, 0.25};
			text = "\ca\ui\data\ui_tankdir_stop_ca.paa";
			x = 0.44625;
			y = 0.52;
			w = 0.116875;
			h = 0.15;
		};
	};
};
