// $[1.03,[[0,0,1,1],0.01125,0.01],[1200,"",[0,"ca\ui\data\ui_gameoptions_background_ca",[0.213226,0.127922,0.608838,0.870563],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1500,"",[0,"",[0.219696,0.269697,0.278031,0.389178],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[2100,"",[0,"",[0.244375,0.775,0.144192,0.0463203],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1203,"",[0,"ca\ui\data\ui_background_video_buttons_ca",[0.2107,0.660216,0.721212,0.183117],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1000,"",[0,"No Active Vote",[0.232324,0.164069,0.548233,0.0290043],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1703,"",[0,"Vote Yes",[0.234375,0.65,0.246465,0.108658],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1702,"",[0,"Vote No",[0.515625,0.65,0.246465,0.108658],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1701,"",[0,"Start Vote",[0.5625,0.745,0.197223,0.108658],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[2101,"",[0,"",[0.40375,0.775,0.144192,0.0463203],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1201,"",[0,"ca\ui\data\ui_background_video_buttons_ca",[0.210859,0.210823,0.721212,0.119048],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1002,"",[0,"5 Minutes Left",[0.229798,0.226406,0.548233,0.0290043],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1501,"",[0,"",[0.5,0.269697,0.278031,0.389178],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1001,"",[0,"",[0.23625,0.785,0.3,0.0249999],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]]]
class XD_VoteDialog {
    idd = -1;
    movingEnable = 1;
    onLoad = "uiNamespace setVariable ['X_VOTE_DIALOG', _this select 0]";
    onUnLoad = "uiNamespace setVariable ['X_VOTE_DIALOG', nil]";
    objects[] = {};
    class controlsBackground {
        class VoteDialogBackground: XD_RscPicture
		{
			text = "ca\ui\data\ui_gameoptions_background_ca";
			x = 0.213226;
			y = 0.127922;
			w = 0.608838;
			h = 0.870563;
		};
		class VoteDialogSplitterTopBackground: XD_RscPicture
		{
			text = "ca\ui\data\ui_background_video_buttons_ca";
			x = 0.210859;
			y = 0.210823;
			w = 0.721212;
			h = 0.119048;
		};
		class VoteDialogSplitterBottomBackground: XD_RscPicture
		{
			text = "ca\ui\data\ui_background_video_buttons_ca";
			x = 0.2107;
			y = 0.660216;
			w = 0.721212;
			h = 0.183117;
		};
    };
	class controls {
		class TitleText: X3_RscText
		{
			idc = 100;
			text = "No Active Vote";
            x = 0.232324;
            y = 0.164069;
            w = 0.548233;
            h = 0.0290043;
			style = ST_CENTER;
		};
		class RequiredText: X3_RscText
		{
			idc = 101;
			text = "WARNING: Voting is very experimental, and may break!";
            x = 0.229798;
            y = 0.226406;
            w = 0.548233;
            h = 0.0290043;
            sizeEx = 0.028;
			style = ST_CENTER;
		};
		class FeedbackText: X3_RscText
		{
			idc = 102;
			x = 0.23625;
			y = 0.785;
			w = 0.3;
			h = 0.0249999;
			sizeEx = 0.028;
			style = ST_LEFT;
		};
		class VoteYesListbox: RscListbox
		{
			idc = 200;
			x = 0.219696;
			y = 0.269697;
			w = 0.278031;
			h = 0.389178;
			sizeEx = 0.023;
            rowHeight = 0.06;
            style = CT_NO_BORDER + ST_LEFT;
            borderSize = 1;
		};
		class VoteNoListbox: RscListbox
		{
			idc = 201;
			x = 0.5;
			y = 0.269697;
			w = 0.278031;
			h = 0.389178;
			sizeEx = 0.023;
            rowHeight = 0.06;
            style = CT_NO_BORDER + ST_LEFT;
            borderSize = 1;
		};
		class VoteTypeComboBox: XD_UIComboBox
		{
			idc = 300;
			x = 0.244375;
			y = 0.775;
			w = 0.144192;
			h = 0.0463203;
			onLBSelChanged = "[300] call d_fnc_vote_switch";
		};
		class VoteSubTypeComboBox: XD_UIComboBox
		{
			idc = 301;
			x = 0.40375;
			y = 0.775;
			w = 0.144192;
			h = 0.0463203;
			onLBSelChanged = "";
		};
		class VoteYesButton: XD_ButtonBase
		{
			idc = 400;
			text = "Vote Yes";
			x = 0.234375;
			y = 0.65;
			w = 0.246465;
			h = 0.108658;
            color[] = {0.114,0.408,0.059,0.9};
			size = 0.03521;
			action = "[true] call d_fnc_vote_cast";
		};
		class VoteNoButton: XD_ButtonBase
		{
			idc = 401;
			text = "Vote No";
			x = 0.515625;
			y = 0.65;
			w = 0.246465;
			h = 0.108658;
            color[] = {0.592,0.063,0.059,0.9};
			size = 0.03521;
			action = "[false] call d_fnc_vote_cast";
		};
		class VoteStartCloseButton: XD_ButtonBase
		{
			idc = 500;
			x = 0.5625;
			y = 0.745;
			w = 0.197223;
			h = 0.108658;
		};
	};
};