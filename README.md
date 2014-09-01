DZE Piggd Banking System
Email: dayzpiggd@gmail.com
Website: http://dayzpiggd.enjin.com
Dontaions Accepted via paypal to danpigg@yahoo.com
WARNING ** THIS REPLACES THE HUMANITY SYSTEM
 
Mod Features:
Allows the player to have access to their money all the time.
Bank is tied to the player via the humanity system and survives character death.
Auto Deposit bars/brief cases on every sale or purchase
Player can access balance, deposit and withdraw via player tool menu.
If a player goes to a negative balance displaying the balance, withdraw or deposit will restore them to zero balance.

Known Issues:
First time character creation start the player with 2500 humanity which equates to 25gb.
Any event that modifies humanity will effect the bank balance (usally in a minor way silve bars in most cases)
 

1.   Download the addon from my github by clicking on this link.   (Contains a vanilla epoch chernarus mission.pbo example file).

2.  On the lower left corner click on the button "Download Zip"
3   Create a directory called dayz_code and mission_pbo
4.  Take your mission.pbo file and extract it into the mission_pbo directory
5.  Unzip the zip file you download from my github and move the custom directory into your mission_pbo directory.
6.  Copy C:\Program Files (x86)\Steam\SteamApps\common\ARMA 2 Operation Arrowhead\@DayZ_Epoch\addons\dayz_code.pbo into this new direttory (path may vary based on steam installation).
7.  Extract the dayz_code.pbo into the dayz_code directory you created.
8.  if you do not already have a fixes directory create one.
9.  If you do not already have a custom compile then follow these steps other wise you can skip this step.
    copy dayz_code/init/compiles.sqf  mission_pbo/fixes/compules.sqf
10.  Copy dayz_code/compile/epoch_returnChange.sqf mission_pbo/fixes/epoch_returnChange.sqf
11.  Edit your init.sqf file and make the following modifications:

 

from:

//Load in compiled functions

to:

// ------------------------------------------------------------------------DZE Piggd Banking System Start ------------------------------------------------------------------------
PDZE_PiggdBankSystem = true;
// ------------------------------------------------------------------------DZE Piggd Banking System End ------------------------------------------------------------------------

//Load in compiled functions

from:

call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";                //Compile regular functions

to:

// ------------------------------------------------------------------------DZE Piggd Banking System Start ------------------------------------------------------------------------
//call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";                //Compile regular functions
call compile preprocessFileLineNumbers "fixes\compiles.sqf";                //Compile regular functions
// ------------------------------------------------------------------------DZE Piggd Banking System End ------------------------------------------------------------------------

From:

    //Lights
    //[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
   
};

** NOTE - If you are using Chameleon Skin Changer this entry will already exist with a different comment.

to:

    //Lights
    //[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
// ------------------------------------------------------------------------DZE Piggd Banking System Start ------------------------------------------------------------------------
// Activate Player Menu for Tools
    [] execVM "custom\playertools\activate_player_menu.sqf";
// ------------------------------------------------------------------------DZE Piggd Banking System Start ------------------------------------------------------------------------
    
};

12.  Edit your fixes\compiles.sqf file and make the following modifications:

 

From:

epoch_totalCurrency = {
        // total currency
        _total_currency = 0;
        {
            _part =  (configFile >> "CfgMagazines" >> _x);
            _worth =  (_part >> "worth");
            if isNumber (_worth) then {
                _total_currency = _total_currency + getNumber(_worth);
            };
        } count (magazines player);
        _total_currency
    };

    epoch_itemCost = {
        _trade_total = 0;
        {
            _part_in_configClass =  configFile >> "CfgMagazines" >> (_x select 0);
            if (isClass (_part_in_configClass)) then {
                _part_inWorth = (_part_in_configClass >> "worth");
                if isNumber (_part_inWorth) then {
                    _trade_total = _trade_total + (getNumber(_part_inWorth) * (_x select 1));
                };
            };
        } count _this;

        //diag_log format["DEBUG TRADER ITEMCOST: %1", _this];
        _trade_total
    };

    epoch_returnChange =            compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\epoch_returnChange.sqf";
    // usage [["partinclassname",4]] call epoch_returnChange;

to:

epoch_totalCurrency = {
        // total currency
        _total_currency = 0;
        {
            _part =  (configFile >> "CfgMagazines" >> _x);
            _worth =  (_part >> "worth");
            if isNumber (_worth) then {
                _total_currency = _total_currency + getNumber(_worth);
            };
        } count (magazines player);
// ------------------------------------------------------------------------DZE Piggd Banking System Start ------------------------------------------------------------------------
        if(PDZE_PiggdBankSystem) then {
            _humanity = player getVariable["humanity",0];
            _total_currency = _total_currency + _humanity;
        };
// ------------------------------------------------------------------------DZE Piggd Banking System End ------------------------------------------------------------------------
        _total_currency
    };

    epoch_itemCost = {
        _trade_total = 0;
        {
            _part_in_configClass =  configFile >> "CfgMagazines" >> (_x select 0);
            if (isClass (_part_in_configClass)) then {
                _part_inWorth = (_part_in_configClass >> "worth");
                if isNumber (_part_inWorth) then {
                    _trade_total = _trade_total + (getNumber(_part_inWorth) * (_x select 1));
                };
            };
        } count _this;

        //diag_log format["DEBUG TRADER ITEMCOST: %1", _this];
        _trade_total
    };

// ------------------------------------------------------------------------DZE Piggd Banking System Start ------------------------------------------------------------------------
//    epoch_returnChange =            compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\epoch_returnChange.sqf";
    epoch_returnChange =            compile preprocessFileLineNumbers "fixes\epoch_returnChange.sqf";
// ------------------------------------------------------------------------DZE Piggd Banking System End ------------------------------------------------------------------------
    // usage [["partinclassname",4]] call epoch_returnChange;

13. Edit fixes/epoch_returnChange.sqf

 

From:

    //diag_log format["DEBUG TRADER CHANGE: %1", _return_change];


    if (_return_change >= 0) then {

        
        // total currency

to:

// ------------------------------------------------------------------------DZE Piggd Banking System Start ------------------------------------------------------------------------
    if (_return_change >= 0 and !PDZE_PiggdBankSystem) then {
// ------------------------------------------------------------------------DZE Piggd Banking System End ------------------------------------------------------------------------

From:

    if (_silver_1oz > 0) then {
            if (_silver_1oz == 1) then {
                player addMagazine "ItemSilverBar";
                //diag_log format["DEBUG TRADER CHANG MADE: %1 x %2", _silver_1oz, "ItemSilverBar"];
            } else {
                player addMagazine format["ItemSilverBar%1oz",_silver_1oz];
                //diag_log format["DEBUG TRADER CHANG MADE: %1 x %2", _silver_1oz, "ItemSilverBar"];
            };
        };
        _successful = true;
	};
};
_successful

to:

 
    if (_silver_1oz > 0) then {
            if (_silver_1oz == 1) then {
                player addMagazine "ItemSilverBar";
                //diag_log format["DEBUG TRADER CHANG MADE: %1 x %2", _silver_1oz, "ItemSilverBar"];
            } else {
                player addMagazine format["ItemSilverBar%1oz",_silver_1oz];
                //diag_log format["DEBUG TRADER CHANG MADE: %1 x %2", _silver_1oz, "ItemSilverBar"];
            };
        };
        _successful = true;
// ------------------------------------------------------------------------DZE Piggd Banking System Start ------------------------------------------------------------------------
    } else {
        if (PDZE_PiggdBankSystem) then {
            _total_currency_dry = player getVariable["humanity",0];
            _total_currency_dry = _total_currency_dry + _return_change;
            player setVariable["humanity",_total_currency_dry,true];
            _successful = true;
        };
// ------------------------------------------------------------------------DZE Piggd Banking System End ------------------------------------------------------------------------
    };
};
_successful

14. Edit server_traders.sqf

 

From:

menu_RU_Functionary1 = [
    [["Ammunition",478],["Clothes",476],["Helicopter Armed",493],["Military Armed",562],["Trucks Armed",479],["Weapons",477]],
    [],
    "hero"
];

to:

menu_RU_Functionary1 = [
    [["Ammunition",478],["Clothes",476],["Helicopter Armed",493],["Military Armed",562],["Trucks Armed",479],["Weapons",477]],
    [],
// ------------------------------------------------------------------------DZE Piggd Banking System Start ------------------------------------------------------------------------
//    "hero"
    "neutral"
// ------------------------------------------------------------------------DZE Piggd Banking System End ------------------------------------------------------------------------
];

from:

menu_GUE_Soldier_MG = [
    [["Ammunition",577],["Clothing",575],["Helicopter Armed",512],["Military Armed",569],["Trucks Armed",534],["Weapons",627]],
    [],
    "hostile"
];

to:

menu_GUE_Soldier_MG = [
    [["Ammunition",577],["Clothing",575],["Helicopter Armed",512],["Military Armed",569],["Trucks Armed",534],["Weapons",627]],
    [],
// ------------------------------------------------------------------------DZE Piggd Banking System Start ------------------------------------------------------------------------
//    "hostile"
    "neutral"
// ------------------------------------------------------------------------DZE Piggd Banking System End ------------------------------------------------------------------------
];

15.  Repack your mission pbo and upload to your sever.

 

Optional Additional Configuration:

 

**  Chameleon Skin Changer

If you are using Chameleon Skin Changer and have replaced custom/playertools/player_tools_main.sqf you will need to uncomment the following lines.

 

from:

playermenustart = [
    ["",true],
//    ["Chameleon Male Skins Menu",[],"", -5,[["expression",format[_EXECscript1,_pathtochameleon + "male_dialog.sqf"]]],"1","1"],
//    ["Chameleon Female Skins Menu",[],"", -5,[["expression",format[_EXECscript1,_pathtochameleon + "female_dialog.sqf"]]],"1","1"],
    ["DZE Piggd Banking System >>", [], "#USER:bankmenu", -5, [["expression", ""]], "1", "1"],            
//    ["Weather/Time Menu (Local Only) >>", [], "#USER:WTMenu", -5, [["expression", ""]], "1", "1"],            
    ["", [], "", -5, [["expression", ""]], "1", "0"],
    ["Main Menu", [20], "#USER:playermenustart", -5, [["expression", ""]], "1", "1"]        
];

to:

playermenustart = [
    ["",true],
    ["Chameleon Male Skins Menu",[],"", -5,[["expression",format[_EXECscript1,_pathtochameleon + "male_dialog.sqf"]]],"1","1"],
    ["Chameleon Female Skins Menu",[],"", -5,[["expression",format[_EXECscript1,_pathtochameleon + "female_dialog.sqf"]]],"1","1"],
    ["DZE Piggd Banking System >>", [], "#USER:bankmenu", -5, [["expression", ""]], "1", "1"],            
//    ["Weather/Time Menu (Local Only) >>", [], "#USER:WTMenu", -5, [["expression", ""]], "1", "1"],            
    ["", [], "", -5, [["expression", ""]], "1", "0"],
    ["Main Menu", [20], "#USER:playermenustart", -5, [["expression", ""]], "1", "1"]        
];

15.  Repack your mission pbo and upload to your sever.
