#include "x_macros.sqf"
#define CT_STATIC			0
#define CT_BUTTON			1
#define CT_EDIT				2
#define CT_SLIDER			3
#define CT_COMBO			4
#define CT_LISTBOX			5
#define CT_TOOLBOX			6
#define CT_CHECKBOXES		7
#define CT_PROGRESS			8
#define CT_HTML				9
#define CT_STATIC_SKEW		10
#define CT_ACTIVETEXT		11
#define CT_TREE				12
#define CT_STRUCTURED_TEXT	13
#define CT_NO_BORDER        16
#define CT_3DSTATIC			20
#define CT_3DACTIVETEXT		21
#define CT_3DLISTBOX		22
#define CT_3DHTML			23
#define CT_3DSLIDER			24
#define CT_3DEDIT			25
#define CT_OBJECT			80
#define CT_OBJECT_ZOOM		81
#define CT_OBJECT_CONTAINER	82
#define CT_OBJECT_CONT_ANIM	83
#define CT_USER				99
#define ST_HPOS				0x0F
#define ST_LEFT				0
#define ST_RIGHT			1
#define ST_CENTER			2
#define ST_UP				3
#define ST_DOWN				4
#define ST_VCENTER			5
#define ST_TYPE				0xF0
#define ST_SINGLE			0
#define ST_MULTI			16 + 512
#define ST_TITLE_BAR		32
#define ST_PICTURE			48
#define ST_FRAME			64
#define ST_BACKGROUND		80
#define ST_GROUP_BOX		96
#define ST_GROUP_BOX2		112
#define ST_HUD_BACKGROUND	128
#define ST_TILE_PICTURE		144
#define ST_WITH_RECT		160
#define ST_LINE				176
#define ST_SHADOW			256
#define ST_NO_RECT			512
#define ST_KEEP_ASPECT_RATIO  0x800
#define ST_TITLE			ST_TITLE_BAR + ST_CENTER
#define FontHTML			"Zeppelin32"
#define FontM				"Zeppelin32"
#define Dlg_ROWS			36
#define Dlg_COLS			90
#define Dlg_CONTROLHGT		((100/Dlg_ROWS)/100)
#define Dlg_COLWIDTH		((100/Dlg_COLS)/100)
#define Dlg_TEXTHGT_MOD		0.9
#define Dlg_ROWSPACING_MOD	1.3
#define Dlg_ROWHGT			(Dlg_CONTROLHGT*Dlg_ROWSPACING_MOD)
#define Dlg_TEXTHGT			(Dlg_CONTROLHGT*Dlg_TEXTHGT_MOD)
#define UILEFT				0
#define UICOMBO				4
#define DEFAULTFONT			"Bitstream"

#define XCTextBlack			colorText[] = {1, 1, 1, 1}
#define XCTextBI			colorText[] = {0.543, 0.5742, 0.4102, 1}
#define XCTextHud			colorText[] = {0.543, 0.5742, 0.4102, 0.9}
#define XCMainCapt			colorText[] = {0.543, 0.5742, 0.4102, 1.0}

class BBRscStructuredText {
    type = CT_STRUCTURED_TEXT;
    idc = -1;
    style = 0;
    colorText[] = {0.8784,0.8471,0.651,1};
    class Attributes {
        font = "Zeppelin32";
        color = "#a3936d";
        align = "center";
        valign = "middle";
        shadow = 1;
    };
    x = 0;
    y = 0;
    h = 0.035;
    w = 0.1;
    text = "";
    size = 0.03921;
    shadow = 2;
};
class SXRscText {
    type = CT_STATIC;
    idc = -1;
    style = ST_LEFT;
    colorBackground[] = {0, 0, 0, 0};
    XCTextBlack;
    font = FontM;
    sizeEx = 0.015;
    shadow = 2;
};
class RscBG: SXRscText {
    type = CT_STATIC;
    idc = -1;
    style = ST_LEFT;
    colorBackground[] = {0.02, 0.11, 0.27, 0.7};
    colorText[] = {1, 1, 1, 0};
    font = FontM;
    sizeEx = 0.015;
    text="";
};
class RscButton {
    type = CT_BUTTON;
    idc = -1;
    style = ST_CENTER;
    XCTextBlack;
    colorDisabled[] = {1, 1, 1, 0.7};
    colorBackground[] = {0.04, 0.22, 054, 0.7};
    colorBackgroundActive[] = {0.04, 0.22, 0.54, 0.9};
    colorBackgroundDisabled[] = {0.04, 0.22, 0.54, 0.4};
    colorFocused[] = {1, 1, 1, 0.4};
    colorShadow[] = {0, 1, 0, 0};
    colorBorder[] = {0, 1, 0, 0};
    font = FontM;
    soundEnter[] = {"\ca\ui\data\sound\mouse2", 0.2, 1};
    soundPush[] = {"\ca\ui\data\sound\new1", 0.2, 1};
    soundClick[] = {"\ca\ui\data\sound\mouse3", 0.2, 1};
    soundEscape[] = {"\ca\ui\data\sound\mouse1", 0.2, 1};
    sizeEx = 0.02;
    offsetX=0;
    offsetY=0;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize=0;
    default = false;
    shadow = 2;
};
class RscNavButton:RscButton {
    w = 0.1; h = 0.04;
    x = 0.90;
};
class RscListBox
{
 type = 5;
 style = 16;
 w = 0.4;
 h = 0.4;
 font = FontM;
 sizeEx = 0.04;
 rowHeight = 0;
 colorText[] = {0.639,0.576,0.427,1};
 colorScrollbar[] = {0.6,0.5,0.3,1};
 colorSelect[] = {0.247,0.2,0.137,1};
 colorSelectBackground[] = {0.639,0.576,0.427,1};
 colorBackground[] = {0.6,0.5,0.3,1};
 colorPicture[] = {0.639,0.576,0.427,1};
 maxHistoryDelay = 0;
 soundSelect[] = {"",0.1,1};
 period = 0;
 autoScrollSpeed = -1;
 autoScrollDelay = 5;
 autoScrollRewind = 0;
 arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
 arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
 shadow = 0;
 class ScrollBar
 {
  color[] = {1,1,1,0.6};
  colorActive[] = {1,1,1,1};
  colorDisabled[] = {1,1,1,0.3};
  thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
  arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
  arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
  border = "\ca\ui\data\ui_border_scroll_ca.paa";
  shadow = 0;
 };
};
class SXRscListBox {
    type = 5;
    style = 0;
    idc = -1;
    colorBackground[] = {0.2,0.35,0.2,1};
    colorSelect[] = {0.2,0.4,0.2,1};
    colorSelectBackground[] = {0.3,0.6,0.3,1};
    colorText[] = {0.5,0.75,0.5,1};
    font = "Bitstream";
    sizeEx = 0.029;
    rowHeight = 0.03;
    soundSelect[] = {"",0.1,1};
    soundExpand[] = {"",0.1,1};
    soundCollapse[] = {"",0.1,1};
    maxHistoryDelay = 10;
    w = 0.275;
    h = 0.04;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
    colorScrollbar[] = {0.95,0.95,0.95,1};
    shadow = 2;
    period = 1;
    default = false;
    arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
    arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
    class ScrollBar {
        color[] = {1,1,1,0.6};
        colorActive[] = {1,1,1,1};
        colorDisabled[] = {1,1,1,0.3};
        thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
        arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
        arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
        border = "\ca\ui\data\ui_border_scroll_ca.paa";
    };
};
class XD_RscPicture {
    type = CT_STATIC;
    idc = -1;
    style = ST_PICTURE;
    x = 0.1; y = 0.1;
    w = 0.4; h = 0.2;
    sizeEx = Dlg_TEXTHGT;
    colorBackground[] = {0, 0, 0, 0};
    XCTextBlack;
    font = FontM;
    text = "";
};
class XD_RscPicturePerkIcon {
    type = CT_STATIC;
    idc = -1;
    style = ST_PICTURE;
    x = 0.1; y = 0.1;
    w = 0.4; h = 0.2;
    sizeEx = Dlg_TEXTHGT;
    colorBackground[] = {135, 135, 135, 1};
    colorText[] = {135, 135, 135, 1};
    font = FontM;
    text = "";
    shadow = 1;
};
class XD_RscMapControl {
    idc = -1;
    type=101;
    style=48;
    x = 0; y = 0;
    w = 1; h = 1;
    colorBackground[] = {1, 1, 1, 1};
    colorText[] = {0, 0, 0, 1};
    colorSea[] = {0.56, 0.8, 0.98, 0.5};
    colorForest[] = {0.6, 0.8, 0.2, 0.5};
    colorRocks[] = {0.5, 0.5, 0.5, 0.5};
    colorCountlines[] = {0.65, 0.45, 0.27, 0.5};
    colorMainCountlines[] = {0.65, 0.45, 0.27, 1};
    colorCountlinesWater[] = {0, 0.53, 1, 0.5};
    colorMainCountlinesWater[] = {0, 0.53, 1, 1};
    colorForestBorder[] = {0.4, 0.8, 0, 1};
    colorRocksBorder[] = {0.5, 0.5, 0.5, 1};
    colorPowerLines[] = {0, 0, 0, 1};
    colorNames[] = {0, 0, 0, 1};
    colorInactive[] = {1, 1, 1, 0.5};
    colorLevels[] = {0, 0, 0, 1};
    colorRailWay[] = {0, 0, 0, 1};
    colorOutside[] = {0, 0, 0, 1};
    font = "TahomaB";
    sizeEx = 0.04;
    stickX[] = {0.2, {"Gamma", 1, 1.5}};
    stickY[] = {0.2, {"Gamma", 1, 1.5}};
    ptsPerSquareSea = 6;
    ptsPerSquareTxt = 8;
    ptsPerSquareCLn = 8;
    ptsPerSquareExp = 8;
    ptsPerSquareCost = 8;
    ptsPerSquareFor = "4.0f";
    ptsPerSquareForEdge = "10.0f";
    ptsPerSquareRoad = 2;
    ptsPerSquareObj = 10;
    fontLabel = "Zeppelin32";
    sizeExLabel = 0.034;
    fontGrid = "Zeppelin32";
    sizeExGrid = 0.034;
    fontUnits = "Zeppelin32";
    sizeExUnits = 0.034;
    fontNames = "Zeppelin32";
    sizeExNames = 0.056;
    fontInfo = "Zeppelin32";
    sizeExInfo = 0.034;
    fontLevel = "Zeppelin32";
    sizeExLevel = 0.034;
    maxSatelliteAlpha = 0;
    alphaFadeStartScale = 1.0;
    alphaFadeEndScale = 1.1;
    showCountourInterval=2;
    scaleDefault = 0.1;
    onMouseButtonClick = "";
    onMouseButtonDblClick = "";
    text = "#(argb,8,8,3)color(1,1,1,1)";
    default = false;
    class CustomMark {
        icon = "\ca\ui\data\map_waypoint_ca.paa";
        color[] = {0, 0, 1, 1};
        size = 18;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class Legend {
        x = -1;
        y = -1;
        w = 0.340;
        h = 0.152;
        font = "Zeppelin32";
        sizeEx = 0.03921;
        colorBackground[] = {0.906, 0.901, 0.88, 0.8};
        color[] = {0, 0, 0, 1};
    };
    class Bunker {
        icon = "\ca\ui\data\map_bunker_ca.paa";
        color[] = {0, 0.9, 0, 1};
        size = 14;
        importance = "1.5 * 14 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Bush {
        icon = "\ca\ui\data\map_bush_ca.paa";
        color[] = {0.55, 0.64, 0.43, 1};
        size = 14;
        importance = "0.2 * 14 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class BusStop {
        icon = "\ca\ui\data\map_busstop_ca.paa";
        color[] = {0, 0, 1, 1};
        size = 10;
        importance = "1 * 10 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Command {
        icon = "\ca\ui\data\map_waypoint_ca.paa";
        color[] = {0, 0.9, 0, 1};
        size = 18;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class Cross {
        icon = "\ca\ui\data\map_cross_ca.paa";
        color[] = {0, 0.9, 0, 1};
        size = 16;
        importance = "0.7 * 16 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Fortress {
        icon = "\ca\ui\data\map_bunker_ca.paa";
        color[] = {0, 0.9, 0, 1};
        size = 16;
        importance = "2 * 16 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Fuelstation {
        icon = "\ca\ui\data\map_fuelstation_ca.paa";
        color[] = {0, 0.9, 0, 1};
        size = 16;
        importance = "2 * 16 * 0.05";
        coefMin = 0.75;
        coefMax = 4;
    };
    class Fountain {
        icon = "\ca\ui\data\map_fountain_ca.paa";
        color[] = {0, 0.35, 0.7, 1};
        size = 12;
        importance = "1 * 12 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Hospital {
        icon = "\ca\ui\data\map_hospital_ca.paa";
        color[] = {0.78, 0, 0.05, 1};
        size = 16;
        importance = "2 * 16 * 0.05";
        coefMin = 0.5;
        coefMax = 4;
    };
    class Chapel {
        icon = "\ca\ui\data\map_chapel_ca.paa";
        color[] = {0, 0.9, 0, 1};
        size = 16;
        importance = "1 * 16 * 0.05";
        coefMin = 0.9;
        coefMax = 4;
    };
    class Church {
        icon = "\ca\ui\data\map_church_ca.paa";
        color[] = {0, 0.9, 0, 1};
        size = 16;
        importance = "2 * 16 * 0.05";
        coefMin = 0.900000;
        coefMax = 4;
    };
    class Lighthouse {
        icon = "\ca\ui\data\map_lighthouse_ca.paa";
        color[] = {0.78, 0, 0.05, 1};
        size = 20;
        importance = "3 * 16 * 0.05";
        coefMin = 0.9;
        coefMax = 4;
    };
    class Quay {
        icon = "\ca\ui\data\map_quay_ca.paa";
        color[] = {0, 0.9, 0, 1};
        size = 16;
        importance = "2 * 16 * 0.05";
        coefMin = 0.5;
        coefMax = 4;
    };
    class Rock {
        icon = "\ca\ui\data\map_rock_ca.paa";
        color[] = {0, 0.9, 0, 1};
        size = 12;
        importance = "0.5 * 12 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Ruin {
        icon = "\ca\ui\data\map_ruin_ca.paa";
        color[] = {0.78, 0, 0.05, 1};
        size = 16;
        importance = "1.2 * 16 * 0.05";
        coefMin = 1;
        coefMax = 4;
    };
    class SmallTree {
        icon = "\ca\ui\data\map_smalltree_ca.paa";
        color[] = {0.55, 0.64, 0.43, 1};
        size = 12;
        importance = "0.6 * 12 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Stack {
        icon = "\ca\ui\data\map_stack_ca.paa";
        color[] = {0, 0.9, 0, 1};
        size = 20;
        importance = "2 * 16 * 0.05";
        coefMin = 0.9;
        coefMax = 4;
    };
    class Tree {
        icon = "\ca\ui\data\map_tree_ca.paa";
        color[] = {0.55, 0.64, 0.43, 1};
        size = 12;
        importance = "0.9 * 16 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Tourism {
        icon = "\ca\ui\data\map_tourism_ca.paa";
        color[] = {0.78, 0, 0.05, 1};
        size = 16;
        importance = "1 * 16 * 0.05";
        coefMin = 0.700000;
        coefMax = 4;
    };
    class Transmitter {
        icon = "\ca\ui\data\map_transmitter_ca.paa";
        color[] = {0, 0.9, 0, 1};
        size = 20;
        importance = "2 * 16 * 0.05";
        coefMin = 0.9;
        coefMax = 4;
    };
    class ViewTower {
        icon = "\ca\ui\data\map_viewtower_ca.paa";
        color[] = {0, 0.9, 0, 1};
        size = 16;
        importance = "2.5 * 16 * 0.05";
        coefMin = 0.5;
        coefMax = 4;
    };
    class Watertower {
        icon = "\ca\ui\data\map_watertower_ca.paa";
        color[] = {0, 0.35, 0.7, 1};
        size = 32;
        importance = "1.2 * 16 * 0.05";
        coefMin = 0.9;
        coefMax = 4;
    };
    class Waypoint {
        icon = "\ca\ui\data\map_waypoint_ca.paa";
        size = 20;
        color[] = {0, 0.9, 0, 1};
        importance = "1.2 * 16 * 0.05";
        coefMin = 0.9;
        coefMax = 4;
    };
    class Task {
        icon = "\ca\ui\data\ui_taskstate_current_CA.paa";
        iconCreated = "\ca\ui\data\ui_taskstate_new_CA.paa";
        iconCanceled = "#(argb,8,8,3)color(0,0,0,0)";
        iconDone = "\ca\ui\data\ui_taskstate_done_CA.paa";
        iconFailed = "\ca\ui\data\ui_taskstate_failed_CA.paa";
        color[] = {0.863,0.584,0,1};
        colorCreated[] = {0.95,0.95,0.95,1};
        colorCanceled[] = {0.606,0.606,0.606,1};
        colorDone[] = {0.424,0.651,0.247,1};
        colorFailed[] = {0.706,0.0745,0.0196,1};
        size = 27;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class WaypointCompleted {
        icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
        size = 20;
        color[] = {0, 0.9, 0, 1};
        importance = "1.2 * 16 * 0.05";
        coefMin = 0.9;
        coefMax = 4;
    };
    class ActiveMarker {
        icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
        size = 20;
        color[] = {0, 0.9, 0, 1};
        importance = "1.2 * 16 * 0.05";
        coefMin = 0.9;
        coefMax = 4;
    };
};
class GVAR(Dummy_Map) {
    idc = -1;
    type=100;
    style=48;
    x = 0;y = 0;w = 1;h = 1;
    colorBackground[] = {0,0,0,0};
    colorText[] = {0,0,0,0};
    colorSea[] = {0,0,0,0};
    colorForest[] = {0,0,0,0};
    colorRocks[] = {0,0,0,0};
    colorCountlines[] = {0,0,0,0};
    colorMainCountlines[] = {0,0,0,0};
    colorCountlinesWater[] = {0,0,0,0};
    colorMainCountlinesWater[] = {0,0,0,0};
    colorForestBorder[] = {0,0,0,0};
    colorRocksBorder[] = {0,0,0,0};
    colorPowerLines[] = {0,0,0,0};
    colorNames[] = {0,0,0,0};
    colorInactive[] = {0,0,0,0};
    colorLevels[] = {0,0,0,0};
    colorRailWay[] = {0,0,0,0};
    colorOutside[] = {0,0,0,0};
    font = "TahomaB";
    sizeEx = 0.00;
    stickX[] = {0.0,{"Gamma", 1, 1}};
    stickY[] = {0.0,{"Gamma", 1, 1}};
    ptsPerSquareSea = 0;
    ptsPerSquareTxt = 0;
    ptsPerSquareCLn = 0;
    ptsPerSquareExp = 0;
    ptsPerSquareCost = 0;
    ptsPerSquareFor = "0f";
    ptsPerSquareForEdge = "0f";
    ptsPerSquareRoad = 0;
    ptsPerSquareObj = 0;
    fontLabel = "Zeppelin32";
    sizeExLabel = 0.0;
    fontGrid = "Zeppelin32";
    sizeExGrid = 0.0;
    fontUnits = "Zeppelin32";
    sizeExUnits = 0.0;
    fontNames = "Zeppelin32";
    sizeExNames = 0.0;
    fontInfo = "Zeppelin32";
    sizeExInfo = 0.0;
    fontLevel = "Zeppelin32";
    sizeExLevel = 0.0;
    scaleMax = 1;
    scaleMin = 0.125;
    text = "";
    maxSatelliteAlpha = 0;
    alphaFadeStartScale = 1;
    alphaFadeEndScale = 1.0;
    showCountourInterval=1;
    scaleDefault = 2;
    class Task {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 1;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
        iconCreated = "";
        iconCanceled = "";
        iconDone = "";
        iconFailed = "";
        colorCreated[] = {0,0,0,0};
        colorCanceled[] = {0,0,0,0};
        colorDone[] = {0,0,0,0};
        colorFailed[] = {0,0,0,0};
    };
    class CustomMark {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 1;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class Legend {
        x = "SafeZoneX";
        y = "SafeZoneY";
        w = 0.340000;
        h = 0.152000;
        font = "Zeppelin32";
        sizeEx = 0.039210;
        colorBackground[] = {0,0,0,0};
        color[] = {0,0,0,0};
    };
    class Bunker {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 14;
        importance = "1.5 * 14 * 0.05";
        coefMin = 0.250000;
        coefMax = 4;
    };
    class Bush {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 14;
        importance = "0.2 * 14 * 0.05";
        coefMin = 0.250000;
        coefMax = 4;
    };
    class BusStop {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 12;
        importance = "1 * 10 * 0.05";
        coefMin = 0.250000;
        coefMax = 4;
    };
    class Command {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 18;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class Cross {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        size = 16;
        color[] = {0,0,0,0};
        importance = "0.7 * 16 * 0.05";
        coefMin = 0.250000;
        coefMax = 4;
    };
    class Fortress {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        size = 16;
        color[] = {0,0,0,0};
        importance = "2 * 16 * 0.05";
        coefMin = 0.250000;
        coefMax = 4;
    };
    class Fuelstation {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        size = 16;
        color[] = {0,0,0,0};
        importance = "2 * 16 * 0.05";
        coefMin = 0.750000;
        coefMax = 4;
    };
    class Fountain {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 11;
        importance = "1 * 12 * 0.05";
        coefMin = 0.250000;
        coefMax = 4;
    };
    class Hospital {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 16;
        importance = "2 * 16 * 0.05";
        coefMin = 0.500000;
        coefMax = 4;
    };
    class Chapel {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 16;
        importance = "1 * 16 * 0.05";
        coefMin = 0.900000;
        coefMax = 4;
    };
    class Church {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        size = 16;
        color[] = {0,0,0,0};
        importance = "2 * 16 * 0.05";
        coefMin = 0.900000;
        coefMax = 4;
    };
    class Lighthouse {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        size = 14;
        color[] = {0,0,0,0};
        importance = "3 * 16 * 0.05";
        coefMin = 0.900000;
        coefMax = 4;
    };
    class Quay {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        size = 16;
        color[] = {0,0,0,0};
        importance = "2 * 16 * 0.05";
        coefMin = 0.500000;
        coefMax = 4;
    };
    class Rock {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 12;
        importance = "0.5 * 12 * 0.05";
        coefMin = 0.250000;
        coefMax = 4;
    };
    class Ruin {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        size = 16;
        color[] = {0,0,0,0};
        importance = "1.2 * 16 * 0.05";
        coefMin = 1;
        coefMax = 4;
    };
    class SmallTree {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 12;
        importance = "0.6 * 12 * 0.05";
        coefMin = 0.250000;
        coefMax = 4;
    };
    class Stack {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        size = 20;
        color[] = {0,0,0,0};
        importance = "2 * 16 * 0.05";
        coefMin = 0.900000;
        coefMax = 4;
    };
    class Tree {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 12;
        importance = "0.9 * 16 * 0.05";
        coefMin = 0.250000;
        coefMax = 4;
    };
    class Tourism {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 16;
        importance = "1 * 16 * 0.05";
        coefMin = 0.700000;
        coefMax = 4;
    };
    class Transmitter {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 20;
        importance = "2 * 16 * 0.05";
        coefMin = 0.900000;
        coefMax = 4;
    };
    class ViewTower {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 16;
        importance = "2.5 * 16 * 0.05";
        coefMin = 0.500000;
        coefMax = 4;
    };
    class Watertower {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 20;
        importance = "1.2 * 16 * 0.05";
        coefMin = 0.900000;
        coefMax = 4;
    };
    class Waypoint {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 16;
        importance = "2.5 * 16 * 0.05";
        coefMin = 0.500000;
        coefMax = 4;
    };
    class WaypointCompleted {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 16;
        importance = "2.5 * 16 * 0.05";
        coefMin = 0.500000;
        coefMax = 4;
    };
    class ActiveMarker {
        color[] = {0,0,0,0};
        size = 1;
    };
};
class XD_ButtonBase {
    type = 16;
    x = 0;
    y = 0;
    class HitZone {
        left = 0.004;
        top = 0.029;
        right = 0.004;
        bottom = 0.029;
    };
    class ShortcutPos {
        left = 0.0145;
        top = 0.026;
        w = 0.0392157;
        h = 0.0522876;
    };
    class TextPos {
        left = 0.05;
        top = 0.034;
        right = 0.005;
        bottom = 0.005;
    };
    shortcuts[] = {};
    textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
    color[] = {0.8784,0.8471,0.651,1};
    color2[] = {0.95,0.95,0.95,1};
    colorDisabled[] = {1,1,1,0.25};
    colorBackground[] = {1,1,1,1};
    colorBackground2[] = {1,1,1,0.4};
    class Attributes {
        font = "Zeppelin32";
        color = "#E5E5E5";
        align = "left";
        shadow = "true";
    };
    idc = -1;
    style = 0;
    default = 0;
    shadow = 2;
    w = 0.23;
    h = 0.104575;
    periodFocus = 1.2;
    periodOver = 0.8;
    animTextureNormal = "\ca\ui\data\ui_button_normal_ca.paa";
    animTextureDisabled = "\ca\ui\data\ui_button_disabled_ca.paa";
    animTextureOver = "\ca\ui\data\ui_button_over_ca.paa";
    animTextureFocused = "\ca\ui\data\ui_button_focus_ca.paa";
    animTexturePressed = "\ca\ui\data\ui_button_down_ca.paa";
    animTextureDefault = "\ca\ui\data\ui_button_default_ca.paa";
    period = 0.4;
    font = "Zeppelin32";
    size = 0.03921;
    sizeEx = 0.03921;
    text = "";
    soundEnter[] = {"\ca\ui\data\sound\mouse2", 0.2, 1};
    soundPush[] = {"\ca\ui\data\sound\new1", 0.2, 1};
    soundClick[] = {"\ca\ui\data\sound\mouse3", 0.2, 1};
    soundEscape[] = {"\ca\ui\data\sound\mouse1", 0.2, 1};
    action = "";
    class AttributesImage {
        font = "Zeppelin32";
        color = "#E5E5E5";
        align = "left";
    };
};

class XD_LinkButtonBase {
    idc = -1;
    type = CT_BUTTON;
    style = ST_CENTER;
    default = false;
    font = "Zeppelin32";
    sizeEx = 0.029;
    XCTextBlack;
    colorFocused[] = {1, 1, 1, 0};
    colorDisabled[] = {0, 0, 1, 0.7};
    colorBackground[] = {1, 1, 1, 0};
    colorBackgroundDisabled[] = {1, 1, 1, 0.5};
    colorBackgroundActive[] = {1, 1, 1, 0};
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    colorShadow[] = {1, 1, 1, 0};
    colorBorder[] = {1, 1, 1, 0};
    borderSize = 0;
    soundEnter[] = {"\ca\ui\data\sound\mouse2", 0.2, 1};
    soundPush[] = {"\ca\ui\data\sound\new1", 0.2, 1};
    soundClick[] = {"\ca\ui\data\sound\mouse3", 0.2, 1};
    soundEscape[] = {"\ca\ui\data\sound\mouse1", 0.2, 1};
    x = 0.06; y = 0.11;
    w = 0.15; h = 0.1;
    text = "";
    action = "";
    shadow = 2;
};

class XD_LinkButtonUpgradeBase {
    idc = -1;
    type = CT_BUTTON;
    style = ST_CENTER;
    default = false;
    font = "Zeppelin32";
    sizeEx = 0.029;
    XCTextBlack;
    colorFocused[] = {1, 1, 1, 0};
    colorDisabled[] = {0, 0, 1, 0.7};
    colorBackground[] = {192, 192, 192, 0};
    colorBackgroundDisabled[] = {1, 1, 1, 0};
    colorBackgroundActive[] = {192, 192, 192, 0};
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.000;
    offsetPressedY = 0.000;
    colorShadow[] = {1, 1, 1, 0};
    colorBorder[] = {1, 1, 1, 0};
    borderSize = 0;
    soundEnter[] = {"\ca\ui\data\sound\mouse2", 0.2, 1};
    soundPush[] = {"\ca\ui\data\sound\new1", 0.2, 1};
    soundClick[] = {"\ca\ui\data\sound\mouse3", 0.2, 1};
    soundEscape[] = {"\ca\ui\data\sound\mouse1", 0.2, 1};
    x = 0.06; y = 0.11;
    w = 0.15; h = 0.1;
    text = "";
    action = "";
    shadow = 2;
};

class XD_UIList {
    w = 0.275;
    h = 0.04;
    colorSelect[] = {0.023529,0,0.0313725,1};
    colorText[] = {0.023529,0,0.0313725,1};
    colorBackground[] = {0.95,0.95,0.95,1};
    colorSelectBackground[] = {0.543,0.5742,0.4102,1};
    colorScrollbar[] = {0.023529,0,0.0313725,1};
    arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
    arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa";
    wholeHeight = 0.45;
    color[] = {0,0,0,0.6};
    colorActive[] = {0,0,0,1};
    colorDisabled[] = {0,0,0,0.3};
    font = "Zeppelin32";
    sizeEx = 0.029;
    soundSelect[] = {"",0.1,1};
    soundExpand[] = {"",0.1,1};
    soundCollapse[] = {"",0.1,1};
    maxHistoryDelay = 1;
    default = false;
    class ScrollBar {
        color[] = {1, 1, 1, 0.6};
        colorActive[] = {1, 1, 1, 1};
        colorDisabled[] = {1, 1, 1, 0.3};
        thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
        arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
        arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
        border = "\ca\ui\data\ui_border_scroll_ca.paa";
    };
};
class XD_UIComboBox:XD_UIList {
    type = UICOMBO;
    style = 0;
    idc = -1;
    sizeEx = 0.025;
    wholeHeight = 0.3;
};
class X3_RscText {
    type = CT_STATIC;
    idc = -1;
    style = ST_CENTER;
    w = 0.05; h = 0.05;
    font = "Zeppelin32";
    sizeEx = 0.032;
    colorBackground[] = {0, 0, 0, 0};
    colorText[] = {0.643, 0.5742, 0.4102, 1};
    text = "";
    shadow = 2;
};
class XC_RscText {
    type = CT_STATIC;
    idc = -1;
    style = ST_LEFT;
    x = 0; y = 0;
    w = 0.3; h = 0.03;
    sizeEx = 0.023;
    colorBackground[] = {0.5, 0.5, 0.5, 0.75};
    colorText[] = {0, 0, 0, 1};
    font = "Zeppelin32";
    text = "";
    shadow = 2;
};
class X3_RscStructText {
    idc = -1;
    type = CT_STRUCTURED_TEXT;
    style = ST_LEFT;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
    x = 0.1;
    y = 0.1;
    w = 0.3;
    h = 0.1;
    size = 0.023;
    text = "";
    sizeEx = 0.023;
    class Attributes {
        //font = "TahomaB";
        font = "Zeppelin32";
        color = "#000000";
        align = "left";
        valign = "middle";

        shadow = true;
        shadowColor = "#ff0000";
        size = "1";
    };
};
class XC_SliderH {
    idc = -1;
    type = 43;
    style = "0x400 + 0x10";
    x = 0; y = 0;
    h = 0.029412; w = 0.4;
    color[] = {1, 1, 1, 0.4};
    colorActive[] = {1, 1, 1, 0.4};
    colorDisabled[] = {1, 1, 1, 0.2};
    arrowEmpty = "\ca\ui\data\ui_arrow_left_ca.paa";
    arrowFull = "\ca\ui\data\ui_arrow_left_active_ca.paa";
    border = "\ca\ui\data\ui_border_frame_ca.paa";
    thumb = "\ca\ui\data\ui_slider_bar_ca.paa";
    shadow = 0;
};
class RscFrame
{
    type = CT_STATIC;
    idc = -1;
    deletable = 0;
    style = ST_FRAME;
    shadow = 2;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    font = "Zeppelin32";
    sizeEx = 0.02;
    text = "";
    x = 0;
    y = 0;
    w = 0.3;
    h = 0.3;
};