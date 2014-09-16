/*
DZE Piggd Banking System
Email: dayzpiggd@gmail.com
Website: http://dayzpiggd.enjin.com
Donations Accepted via paypal to danpigg@yahoo.com
*/
private ["_balance","_briefcase_100oz","_gold_1oz","_silver_1oz","_dep_briefcase_100oz","_dep_gold_1oz","_dep_silver_1oz","_prev_balance","_prev_briefcase_100oz","_prev_gold_1oz","_prev_silver_1oz"];
_prev_balance = player getVariable["humanity", 0];
if ( _prev_balance < 1 ) then {
	player setVariable["humanity",1,true];
	_prev_balance = 0;
};
_prev_briefcase_100oz = floor(_prev_balance / 10000);
_prev_balance = _prev_balance - (_prev_briefcase_100oz * 10000);
_prev_gold_1oz = floor(_prev_balance / 100);
_prev_balance = _prev_balance - (_prev_gold_1oz * 100);
_prev_silver_1oz = floor(_prev_balance);
systemChat("===============================================");
systemChat(format["%1 Previous Bank Balance",dayz_playerName]);
systemChat(format["Total: %1 bc %2 gb %3 sb", _prev_briefcase_100oz, _prev_gold_1oz,_prev_silver_1oz]);
systemChat("===============================================");
_canAfford = [[["ItemSilverBar",1]],0] call epoch_returnChange;
sleep 2;
if ( _prev_balance > 0 ) then {	_canAfford = [[["ItemSilverBar",1]],1] call epoch_returnChange;};
sleep 2;
_balance = player getVariable["humanity", 0];
_briefcase_100oz = floor(_balance / 10000);
_balance = _balance - (_briefcase_100oz * 10000);
_gold_1oz = floor(_balance / 100);
_balance = _balance - (_gold_1oz * 100);
_silver_1oz = floor(_balance);
_dep_briefcase_100oz = _briefcase_100oz - _prev_briefcase_100oz;
_dep_gold_1oz = _gold_1oz - _prev_gold_1oz;
_dep_silver_1oz = _silver_1oz - _prev_silver_1oz;

systemChat(format["%4 Deposited: %1 bc %2 gb %3 sb", _dep_briefcase_100oz, _dep_gold_1oz,_dep_silver_1oz,dayz_playerName]);
systemChat("+++++++++++++++++++++++++++++++++++++++++++++++");
systemChat(format["%1 Current Bank Balance",dayz_playerName]);
systemChat(format["Total: %1 bc %2 gb %3 sb", _briefcase_100oz, _gold_1oz,_silver_1oz]);
systemChat("+++++++++++++++++++++++++++++++++++++++++++++++");
