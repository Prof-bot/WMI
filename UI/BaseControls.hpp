#ifndef HG_CustomControlClassesh
#define HG_CustomControlClassesh 1

// text sizes
#define STANDARD_GUI_TEXT_SIZE	(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)
#define BIGGER_GUI_TEXT_SIZE	1.4 * STANDARD_GUI_TEXT_SIZE
#define SMALLER_GUI_TEXT_SIZE	0.8 * STANDARD_GUI_TEXT_SIZE

// colours

#define BLACK_NO_COLOUR					{ 0, 0, 0, 0 }

#define BLUE_FOREGROUND_ENABLED			0.9, 0.9, 0
#define BLUE_FOREGROUND_ENABLED_6		{ BLUE_FOREGROUND_ENABLED, 0.6 }
#define BLUE_FOREGROUND_ENABLED_8		{ BLUE_FOREGROUND_ENABLED, 0.8 }
#define BLUE_FOREGROUND_ENABLED_10		{ BLUE_FOREGROUND_ENABLED, 1 }

#define BLUE_FOREGROUND_DISABLED		0.5, 0.5, 0
#define BLUE_FOREGROUND_DISABLED_6		{ BLUE_FOREGROUND_DISABLED, 0.6 }

#define BLUE_BACKGROUND_ENABLED			0, 0, 0.8
#define BLUE_BACKGROUND_ENABLED_1		{ BLUE_BACKGROUND_ENABLED, 0.1 }
#define BLUE_BACKGROUND_ENABLED_2		{ BLUE_BACKGROUND_ENABLED, 0.2 }
#define BLUE_BACKGROUND_ENABLED_3		{ BLUE_BACKGROUND_ENABLED, 0.3 }

#define BLUE_BACKGROUND_DISABLED		0, 0, 0.5
#define BLUE_BACKGROUND_DISABLED_1		{ BLUE_BACKGROUND_DISABLED, 0.1 }
#define BLUE_BACKGROUND_DISABLED_2		{ BLUE_BACKGROUND_DISABLED, 0.2 }

#define BLUE_FOREGROUND_ENABLED_HTML	"#E6E600"
#define BLUE_BACKGROUND_DISABLED_HTML	"#000080"


#define RED_FOREGROUND_ENABLED			0, 1, 0.9
#define RED_FOREGROUND_ENABLED_6		{ RED_FOREGROUND_ENABLED, 0.6 }
#define RED_FOREGROUND_ENABLED_8		{ RED_FOREGROUND_ENABLED, 0.8 }
#define RED_FOREGROUND_ENABLED_10		{ RED_FOREGROUND_ENABLED, 1 }

#define RED_FOREGROUND_DISABLED			0, 0.5, 0.5
#define RED_FOREGROUND_DISABLED_6		{ RED_FOREGROUND_DISABLED, 0.6 }

#define RED_BACKGROUND_ENABLED			0.8, 0, 0.2
#define RED_BACKGROUND_ENABLED_1		{ RED_BACKGROUND_ENABLED, 0.1 }
#define RED_BACKGROUND_ENABLED_2		{ RED_BACKGROUND_ENABLED, 0.2 }
#define RED_BACKGROUND_ENABLED_3		{ RED_BACKGROUND_ENABLED, 0.3 }

#define RED_BACKGROUND_DISABLED			0.5, 0, 0
#define RED_BACKGROUND_DISABLED_1		{ RED_BACKGROUND_DISABLED, 0.1 }
#define RED_BACKGROUND_DISABLED_2		{ RED_BACKGROUND_DISABLED, 0.2 }

#define RED_FOREGROUND_ENABLED_HTML		"#00FFE6"
#define RED_BACKGROUND_DISABLED_HTML	"#800000"

#define GREEN_FOREGROUND_ENABLED		1, 0.3, 0.7
#define GREEN_FOREGROUND_ENABLED_6		{ GREEN_FOREGROUND_ENABLED, 0.6 }
#define GREEN_FOREGROUND_ENABLED_8		{ GREEN_FOREGROUND_ENABLED, 0.8 }
#define GREEN_FOREGROUND_ENABLED_10		{ GREEN_FOREGROUND_ENABLED, 1 }

#define GREEN_FOREGROUND_DISABLED		0.3, 0, 0.3
#define GREEN_FOREGROUND_DISABLED_6		{ GREEN_FOREGROUND_DISABLED, 0.6 }

#define GREEN_BACKGROUND_ENABLED		0, 0.6, 0
#define GREEN_BACKGROUND_ENABLED_1		{ GREEN_BACKGROUND_ENABLED, 0.1 }
#define GREEN_BACKGROUND_ENABLED_2		{ GREEN_BACKGROUND_ENABLED, 0.2 }
#define GREEN_BACKGROUND_ENABLED_3		{ GREEN_BACKGROUND_ENABLED, 0.3 }

#define GREEN_BACKGROUND_DISABLED		0, 0.3, 0
#define GREEN_BACKGROUND_DISABLED_1		{ GREEN_BACKGROUND_DISABLED, 0.1 }
#define GREEN_BACKGROUND_DISABLED_2		{ GREEN_BACKGROUND_DISABLED, 0.2 }

#define GREEN_FOREGROUND_ENABLED_HTML	"#FF4DB3"
#define GREEN_BACKGROUND_DISABLED_HTML	"#004D00"

// control types
#define CT_STATIC				  0
#define CT_BUTTON				  1
#define CT_EDIT					  2
#define CT_SLIDER				  3
#define CT_COMBO				  4
#define CT_LISTBOX				  5
#define CT_TOOLBOX				  6
#define CT_CHECKBOXES			  7
#define CT_PROGRESS				  8
#define CT_HTML					  9
#define CT_STATIC_SKEW			 10
#define CT_ACTIVETEXT			 11
#define CT_TREE					 12
#define CT_STRUCTURED_TEXT		 13
#define CT_CONTEXT_MENU			 14
#define CT_CONTROLS_GROUP		 15
#define CT_SHORTCUTBUTTON		 16
#define CT_HITZONES				 17
#define CT_VEHICLETOGGLES		 18
#define CT_CONTROLS_TABLE		 19
#define CT_XKEYDESC				 40
#define CT_XBUTTON				 41
#define CT_XLISTBOX				 42
#define CT_XSLIDER				 43
#define CT_XCOMBO				 44
#define CT_ANIMATED_TEXTURE		 45
#define CT_MENU					 46
#define CT_MENU_STRIP			 47
#define CT_CHECKBOX				 77
#define CT_OBJECT				 80
#define CT_OBJECT_ZOOM			 81
#define CT_OBJECT_CONTAINER		 82
#define CT_OBJECT_CONT_ANIM		 83
#define CT_LINEBREAK			 98
#define CT_USER					 99
#define CT_MAP					100
#define CT_MAP_MAIN				101
#define CT_LISTNBOX				102
#define CT_ITEMSLOT				103
#define CT_LISTNBOX_CHECKABLE	104
#define CT_VEHICLE_DIRECTION	105

// control styles
#define ST_LEFT					0
#define ST_RIGHT				1
#define ST_CENTER				2
#define ST_DOWN					4
#define ST_UP					8
#define ST_VCENTER				12
#define ST_SINGLE				0
#define ST_MULTI				16
#define ST_TITLE_BAR			32
#define ST_PICTURE				48
#define ST_FRAME				64
#define ST_BACKGROUND			80
#define ST_GROUP_BOX			96
#define ST_GROUP_BOX2			112
#define ST_HUD_BACKGROUND		128
#define ST_TILE_PICTURE			144
#define ST_WITH_RECT			160
#define ST_LINE					176
#define ST_UPPERCASE			192
#define ST_LOWERCASE			208
#define ST_ADDITIONAL_INFO		3840
#define ST_SHADOW				256
#define ST_NO_RECT				512
#define ST_KEEP_ASPECT_RATIO	2048
#define ST_TITLE				ST_TITLE_BAR + ST_CENTER
#define SL_VERT					0
#define SL_HORZ					1024
#define SL_TEXTURES				16
#define ST_VERTICAL				1
#define ST_HORIZONTAL			0
#define LB_TEXTURES				16
#define LB_MULTI				32
#define TR_SHOWROOT				1
#define TR_AUTOCOLLAPSE			2

// import parent classes
import RscObject;
import RscText;
import RscFrame;
import RscLine;
import RscProgress;
import RscPicture;
import RscPictureKeepAspect;
import RscVideo;
import RscHTML;
import RscButton;
import RscShortcutButton;
import RscEdit;
import RscCombo;
import RscListBox;
import RscListNBox;
import RscXListBox;
import RscTree;
import RscSlider;
import RscXSliderH;
import RscActiveText;
import RscActivePicture;
import RscActivePictureKeepAspect;
import RscStructuredText;
import RscToolbox;
import RscControlsGroup;
import RscControlsGroupNoScrollbars;
import RscControlsGroupNoHScrollbars;
import RscControlsGroupNoVScrollbars;
import RscButtonTextOnly;
import RscButtonMenu;
import RscButtonMenuOK;
import RscButtonMenuCancel;
import RscButtonMenuSteam;
import RscMapControl;
import RscMapControlEmpty;
import RscCheckBox;

#endif