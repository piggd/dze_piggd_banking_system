/*
DZE Piggd Banking System
Email: dayzpiggd@gmail.com
Website: http://dayzpiggd.enjin.com
Dontaions Accepted via paypal to danpigg@yahoo.com
*/

private ["_arg","_itemOut","_canAfford","_total_currency","_return_change","_arg","_arg","_arg","_balance","_briefcase_100oz","_gold_1oz","_silver_1oz","_qty","_trade_total","_item"];
_qty = _this select 0;
_itemOut = _this select 1;
_balance = player getVariable["humanity", 0];
// Bank Balances shoul never be below zero and to prevent division by zero errors.
if ( _balance < 1 ) exitwith {
 	 player setVariable["humanity",0,true];
	_briefcase_100oz = 0;
	_gold_1oz = 0;;
	_silver_1oz = 0;;
	systemChat("===============================================");
	systemChat(format["%1 you have insufficient funds! for this transaction", dayz_playerName]);
	systemChat("+++++++++++++++++++++++++++++++++++++++++++++++");
	systemChat(format["%1 Current Bank Balance",dayz_playerName]);
	systemChat(format["Total: %1 bc %2 gb %3 sb", _briefcase_100oz, _gold_1oz,_silver_1oz]);
	systemChat("+++++++++++++++++++++++++++++++++++++++++++++++");
};

_briefcase_100oz = floor(_balance / 10000);
_balance = _balance - (_briefcase_100oz * 10000);
_gold_1oz = floor(_balance / 100);
_balance = _balance - (_gold_1oz * 100);
_silver_1oz = floor(_balance);
_canAfford = false;
_trade_total = [[_itemOut,_qty]] call epoch_itemCost;
_total_currency = call epoch_totalCurrency;
_return_change = _total_currency - _trade_total; 

if (_return_change >= 0) then {
	_canAfford = true;
};
if (!_canAfford) then {
		systemChat(format["%1 you have insufficient funds! for this transaction", dayz_playerName]);
} else {
		systemChat("===============================================");
		systemChat(format["%1 Previous Bank Balance",dayz_playerName]);
		systemChat(format["Total: %1 bc %2 gb %3 sb", _briefcase_100oz, _gold_1oz,_silver_1oz]);
		systemChat("===============================================");
		systemChat(format["Withdrawing: %1 %2",_qty,_itemOut]);
		_canAfford = [[[_itemOut,_qty]],0] call epoch_returnChange;
		_item = createVehicle ["WeaponHolder",(getPosATL player), [], 1, "CAN_COLLIDE"];
		_item addMagazineCargoGlobal [_itemOut,_qty];
		_item setposATL (getPosATL player);
		player reveal _item;
		player action ["Gear", _item];
};

_balance = player getVariable["humanity", 0];
_briefcase_100oz = floor(_balance / 10000);
_balance = _balance - (_briefcase_100oz * 10000);
_gold_1oz = floor(_balance / 100);
_balance = _balance - (_gold_1oz * 100);
_silver_1oz = floor(_balance);
systemChat("+++++++++++++++++++++++++++++++++++++++++++++++");
systemChat(format["%1 Current Bank Balance",dayz_playerName]);
systemChat(format["Total: %1 bc %2 gb %3 sb", _briefcase_100oz, _gold_1oz,_silver_1oz]);
systemChat("+++++++++++++++++++++++++++++++++++++++++++++++");
