/*
Epoch Player Tools by piggd
Email: dayzpiggd@gmail.com
Website: http://dayzpiggd.enjin.com
Dontaions Accepted via paypal to danpigg@yahoo.com

Menu code and some functions from Epoch Admin Tools V1.8.2 by NoxSicarius
http://epochmod.com/forum/index.php?/topic/7501-release-epoch-admin-tools-v182/
*/
_pathtobank = "custom\dze_piggd_banking_system\";
_pathtochameleon ="custom\chameleon\";
_EXECscript1 = 'player execVM "%1"';
_EXECscript2 = '[%2,"%3"] execVM "%1"';

// To Disable a menu function place a // in front of it or remove it to enable.
playermenustart = [
	["",true],
//	["Chameleon Male Skins Menu",[],"", -5,[["expression",format[_EXECscript1,_pathtochameleon + "male_dialog.sqf"]]],"1","1"],
//	["Chameleon Female Skins Menu",[],"", -5,[["expression",format[_EXECscript1,_pathtochameleon + "female_dialog.sqf"]]],"1","1"],
	["DZE Piggd Banking System >>", [], "#USER:bankmenu", -5, [["expression", ""]], "1", "1"],			
//	["Weather/Time Menu (Local Only) >>", [], "#USER:WTMenu", -5, [["expression", ""]], "1", "1"],			
	["", [], "", -5, [["expression", ""]], "1", "0"],
	["Main Menu", [20], "#USER:playermenustart", -5, [["expression", ""]], "1", "1"]		
];

// Menu for changing time and weather
WTMenu=[
	["",true],
	["Set Time:", [], "", -5, [["expression", ""]], "1", "0"],		
	["Midnight (no moon)",[],"",-5,[["expression",'setDate [2012, 1, 15, 0, 0]']],"1","1"],
	["Midnight (full moon)",[],"",-5,[["expression",'setDate [2012, 6, 6, 0, 0]']],"1","1"],
	["Noon",[],"",-5,[["expression",'setDate [2012, 6, 0, 12, 0]']],"1","1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
	["Set Weather:", [], "", -5, [["expression", ""]], "1", "0"],		
	["Clear",[],"",-5,[["expression",'3 setovercast 0']],"1","1"],
	["Cloudy",[],"",-5,[["expression",'3 setovercast 0.5']],"1","1"],
	["Storm",[],"",-5,[["expression",'3 setovercast 1']],"1","1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
	["Set Fog:", [], "", -5, [["expression", ""]], "1", "0"],		
	["Off",[],"",-5,[["expression",'3 setfog 0']],"1","1"],		
	["Medium",[],"",-5,[["expression",'3 setfog 0.5']],"1","1"],		
	["Maximum",[],"",-5,[["expression",'3 setfog 1']],"1","1"],		
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:playermenustart", -5, [["expression", ""]], "1", "1"]
];

bankmenu = [
["",true],
	["Display Balance",[],"", -5,[["expression",format[_EXECscript1,_pathtobank + "display_balance.sqf"]]],"1","1"],
	["Deposit to Bank",[],"", -5,[["expression",format[_EXECscript1,_pathtobank + "deposit_to_bank.sqf"]]],"1","1"],
	["Withdrawl from Bank Menu >>",[],"#USER:WithdrawBankMenu", -5, [["expression", ""]], "1", "1"],
	["Main Menu", [20], "#USER:playermenustart", -5, [["expression", ""]], "1", "1"]		
];
WithdrawBankMenu = [
["",true],
	["Withdraw 1  Silver Bar", [],"", -5, [["expression", format[_EXECscript2,_pathtobank + "withdraw_from_bank.sqf",1,"ItemSilverBar"]]], "1", "1"],
	["Withdraw 10  Silver Bars", [],"", -5, [["expression", format[_EXECscript2,_pathtobank + "withdraw_from_bank.sqf",10,"ItemSilverBar"]]], "1", "1"],
	["Withdraw 1  10oz Silver Bar", [],"", -5, [["expression", format[_EXECscript2,_pathtobank + "withdraw_from_bank.sqf",1,"ItemSilverBar10oz"]]], "1", "1"],
	["Withdraw 10  10oz Silver Bars", [],"", -5, [["expression", format[_EXECscript2,_pathtobank + "withdraw_from_bank.sqf",10,"ItemSilverBar10oz"]]], "1", "1"],
	["Withdraw 1  Gold Bar", [],"", -5, [["expression", format[_EXECscript2,_pathtobank + "withdraw_from_bank.sqf",1,"ItemGoldBar"]]], "1", "1"],
	["Withdraw 10 Gold Bars", [],"", -5, [["expression", format[_EXECscript2,_pathtobank + "withdraw_from_bank.sqf",10,"ItemGoldBar"]]], "1", "1"],
	["Withdraw 1  10oz Gold Bar", [],"", -5, [["expression", format[_EXECscript2,_pathtobank + "withdraw_from_bank.sqf",1,"ItemGoldBar10oz"]]], "1", "1"],
	["Withdraw 10 10oz Gold Bars", [],"", -5, [["expression", format[_EXECscript2,_pathtobank + "withdraw_from_bank.sqf",10,"ItemGoldBar10oz"]]], "1", "1"],
	["Withdraw 1  Breifcase", [],"", -5, [["expression", format[_EXECscript2,_pathtobank + "withdraw_from_bank.sqf",1,"ItemBriefcase100oz"]]], "1", "1"],
	["Withdraw 10 Breifcases", [],"", -5, [["expression", format[_EXECscript2,_pathtobank + "withdraw_from_bank.sqf",10,"ItemBriefcase100oz"]]], "1", "1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:playermenustart", -5, [["expression", ""]], "1", "1"]
];

showCommandingMenu "#USER:playermenustart";