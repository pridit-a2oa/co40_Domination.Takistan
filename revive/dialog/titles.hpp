class d_revive_dirt {
	idd = -1;
	movingEnable = 0;
	duration = 1e+011;
	fadein = 2;
	fadeout = 0;
	name = "d_revive_dirt";
	class controls {
		class ScreenDirt_BG {
			idc=-1;
			type = 0;
			style = 48;
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {0.9, 0.9, 0.9, 0.8};
			font = "Bitstream";
			sizeEx = 0.023;
			x = "SafeZoneXAbs";
			y = "SafeZoneY";
			w = "SafeZoneWAbs + 0.05";
			h = "SafeZoneH + 0.05";
			text = "revive\textures\screen_dirt_ca.paa";
		};
	};
};