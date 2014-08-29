/*
DZE Piggd Banking System
Email: dayzpiggd@gmail.com
Website: http://dayzpiggd.enjin.com
Dontaions Accepted via paypal to danpigg@yahoo.com

Menu code from Epoch Admin Tools V1.8.2 by NoxSicarius
http://epochmod.com/forum/index.php?/topic/7501-release-epoch-admin-tools-v182/
*/
_pathtobank = "custom\dze_piggd_banking_system\";
_EXECscript8 = 'player execVM "'+_pathtobank+'%1"';
_EXECscript9 = '[%2,"%3"] execVM "'+_pathtobank+'%1"';

bankmenustart = [
	["",true],
		["Display Balance",[],"", -5,[["expression",format[_EXECscript8,"display_balance.sqf"]]],"1","1"],
		["Deposit to Bank",[],"", -5,[["expression",format[_EXECscript8,"deposit_to_bank.sqf"]]],"1","1"],
		["Withdrawl from Bank Menu >>",[],"#USER:WithdrawCurrencyMenu", -5, [["expression", ""]], "1", "1"],
		["Main Menu", [20], "#USER:bankmenustart", -5, [["expression", ""]], "1", "1"]		
	];
WithdrawCurrencyMenu =
[
["",true],
	["Withdraw 1  Silver Bar", [],"", -5, [["expression", format[_EXECscript9,"withdraw_from_bank.sqf",1,"ItemSilverBar"]]], "1", "1"],
	["Withdraw 10  Silver Bars", [],"", -5, [["expression", format[_EXECscript9,"withdraw_from_bank.sqf",10,"ItemSilverBar"]]], "1", "1"],
	["Withdraw 1  10oz Silver Bar", [],"", -5, [["expression", format[_EXECscript9,"withdraw_from_bank.sqf",1,"ItemSilverBar10oz"]]], "1", "1"],
	["Withdraw 10  10oz Silver Bars", [],"", -5, [["expression", format[_EXECscript9,"withdraw_from_bank.sqf",10,"ItemSilverBar10oz"]]], "1", "1"],
	["Withdraw 1  Gold Bar", [],"", -5, [["expression", format[_EXECscript9,"withdraw_from_bank.sqf",1,"ItemGoldBar"]]], "1", "1"],
	["Withdraw 10 Gold Bars", [],"", -5, [["expression", format[_EXECscript9,"withdraw_from_bank.sqf",10,"ItemGoldBar"]]], "1", "1"],
	["Withdraw 1  10oz Gold Bar", [],"", -5, [["expression", format[_EXECscript9,"withdraw_from_bank.sqf",1,"ItemGoldBar10oz"]]], "1", "1"],
	["Withdraw 10 10oz Gold Bars", [],"", -5, [["expression", format[_EXECscript9,"withdraw_from_bank.sqf",10,"ItemGoldBar10oz"]]], "1", "1"],
	["Withdraw 1  Breifcase", [],"", -5, [["expression", format[_EXECscript9,"withdraw_from_bank.sqf",1,"ItemBriefcase100oz"]]], "1", "1"],
	["Withdraw 10 Breifcases", [],"", -5, [["expression", format[_EXECscript9,"withdraw_from_bank.sqf",10,"ItemBriefcase100oz"]]], "1", "1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:bankmenustart", -5, [["expression", ""]], "1", "1"]
];

showCommandingMenu "#USER:bankmenustart";