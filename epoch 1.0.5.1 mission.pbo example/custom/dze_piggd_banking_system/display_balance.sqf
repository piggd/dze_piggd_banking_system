/*
DZE Piggd Banking System
Email: dayzpiggd@gmail.com
Website: http://dayzpiggd.enjin.com
Dontaions Accepted via paypal to danpigg@yahoo.com
*/
private ["_balance","_briefcase_100oz","_gold_1oz","_silver_1oz"];
_balance = player getVariable["humanity", 0];
if (_balance > 0) then {
	_briefcase_100oz = floor(_balance / 10000);
	_balance = _balance - (_briefcase_100oz * 10000);
	_gold_1oz = floor(_balance / 100);
	_balance = _balance - (_gold_1oz * 100);
	_silver_1oz = floor(_balance);
} else {
	// Money should never really be negative and prevent diviison by zero errors.
	player setVariable["humanity",0,true];
	_briefcase_100oz = 0;
	_gold_1oz = 0;;
	_silver_1oz = 0;;
};
systemChat("===============================================");
systemChat(format["%1 Current Bank Balance",dayz_playerName]);
systemChat("===============================================");
systemChat(format["Breifcases: %1",_briefcase_100oz]);
systemChat(format["Gold Bars : %1",_gold_1oz]);
systemChat(format["Silver Bars: %1", _silver_1oz]);
systemChat("+++++++++++++++++++++++++++++++++++++++++++++++");
systemChat(format["Total: %1 bc %2 gb %3 sb", _briefcase_100oz, _gold_1oz,_silver_1oz]);
