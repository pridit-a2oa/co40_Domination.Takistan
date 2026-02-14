class AccoladeDisciplineAreaBackgroundStructuredText: BBRscStructuredText
{
    idc = 1000;
    x = 0.506313;
    y = 0.416884;
    w = 0.218687;
    h = 0.30433;
    colorBackground[] = {0.247,0.2,0.137,1};
};
class AccoladeDisciplineTaskListbox: RscListBox
{
    idc = 1100;
    x = 0.276199;
    y = 0.418074;
    w = 0.230839;
    h = 0.304329;
    sizeEx = 0.027;
    rowHeight = 0.0609;
    borderSize = 1;
    onLBSelChanged = "";
};
class AccoladeDisciplineSectionRewardFrame: RscFrame
{
    idc = 1101;
    text = "Reward";
    x = 0.51;
    y = 0.549805;
    w = 0.213637;
    h = 0.112122;
    colorText[] = {0.639,0.576,0.427,1};
};
class AccoladeDisciplineObjectiveStructuredText: BBRscStructuredText
{
    idc = 1200;
    text = "Destroy a main target objective using an artillery salvo";
    x = 0.51;
    y = 0.455;
    w = 0.211111;
    h = 0.0896116;
    size = 0.025;
    colorBackground[] = {0.247,0.2,0.137,1};
    class Attributes {
        font = "Zeppelin32";
        color = "#ded7a9";
        align = "left";
        valign = "middle";
        shadow = 1;
    };
};
class AccoladeDisciplineSectionObjectiveFrame: RscFrame
{
    idc = 1102;
    text = "Objective";
    x = 0.51;
    y = 0.415;
    w = 0.213637;
    h = 0.247187;
    colorText[] = {0.639,0.576,0.427,1};
};
class AccoladeDisciplineReward1OutlinePicture: XD_RscPicture
{
    idc = 1300;
	text = "ca\ui\data\cmdbar_player_ca";
	x = 0.52;
	y = 0.58;
	w = 0.09;
	h = 0.115;
};
class AccoladeDisciplineReward2OutlinePicture: XD_RscPicture
{
    idc = 1301;
	text = "ca\ui\data\cmdbar_player_ca";
	x = 0.59;
	y = 0.58;
	w = 0.09;
	h = 0.115;
};
class AccoladeDisciplineReward3OutlinePicture: XD_RscPicture
{
    idc = 1302;
	text = "ca\ui\data\cmdbar_player_ca";
	x = 0.66;
	y = 0.58;
	w = 0.09;
	h = 0.115;
};
class AccoladeDisciplineReward1ItemPicture: XD_RscPicture
{
    idc = 1400;
	text = "accolade\textures\experience.paa";
	x = 0.525;
	y = 0.585;
	w = 0.0425756;
	h = 0.0571213;
    style = ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
};
class AccoladeDisciplineReward2ItemPicture: XD_RscPicture
{
    idc = 1401;
	text = "\CA\misc\data\icons\picture_money_CA";
	x = 0.595;
	y = 0.585;
	w = 0.0425756;
	h = 0.0571213;
    style = ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
};
class AccoladeDisciplineReward3ItemPicture: XD_RscPicture
{
    idc = 1402;
	text = "\CA\misc\data\icons\picture_money_CA";
	x = 0.665;
	y = 0.585;
	w = 0.0425756;
	h = 0.0571213;
    style = ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
};
class AccoladeDisciplineReward1BackgroundPicture: XD_RscPicture
{
    idc = 1500;
	text = "ca\ui\data\cmdbar_background_ca";
	x = 0.535;
	y = 0.615;
	w = 0.058788;
	h = 0.0515367;
};
class AccoladeDisciplineReward2BackgroundPicture: XD_RscPicture
{
    idc = 1501;
	text = "ca\ui\data\cmdbar_background_ca";
	x = 0.605;
	y = 0.615;
	w = 0.058788;
	h = 0.0515367;
};
class AccoladeDisciplineReward3BackgroundPicture: XD_RscPicture
{
    idc = 1502;
	text = "ca\ui\data\cmdbar_background_ca";
	x = 0.675;
	y = 0.615;
	w = 0.058788;
	h = 0.0515367;
};
class AccoladeDisciplineReward1AmountText: X3_RscText
{
    idc = 1600;
	x = 0.53;
	y = 0.615;
	w = 0.0412626;
	h = 0.0315368;
    colorText[] = {0.871,0.843,0.663,1};
    sizeEx = 0.027;
    style = ST_CENTER;
};
class AccoladeDisciplineReward2AmountText: X3_RscText
{
    idc = 1601;
	x = 0.6;
	y = 0.615;
	w = 0.0412626;
	h = 0.0315368;
    colorText[] = {0.871,0.843,0.663,1};
    sizeEx = 0.027;
    style = ST_CENTER;
};
class AccoladeDisciplineReward3AmountText: X3_RscText
{
    idc = 1602;
	x = 0.67;
	y = 0.615;
	w = 0.0412626;
	h = 0.0315368;
    colorText[] = {0.871,0.843,0.663,1};
    sizeEx = 0.027;
    style = ST_CENTER;
};
class AccoladeDisciplineActionButton: XD_ButtonBase
{
    idc = 1700;
    text = "Accept";
    x = 0.51;
    y = 0.64;
    w = 0.21616;
    h = 0.113468;
};