/*
DZE Piggd Banking System
Email: dayzpiggd@gmail.com
Website: http://dayzpiggd.enjin.com
Dontaions Accepted via paypal to danpigg@yahoo.com

Menu code from Epoch Admin Tools V1.8.2 by NoxSicarius
http://epochmod.com/forum/index.php?/topic/7501-release-epoch-admin-tools-v182/
*/
Sleep 5;
private["_veh", "_idx"];
_idx = -1;

while {alive player} do
{
	if(toolsAreActive) then
	{
		if (_idx == -1) then
		{
			_idx = (vehicle player) addaction [("<t color=""#585858"">" + ("DZE Piggd Bank System Menu") +"</t>"),"custom\dze_piggd_banking_system\dze_piggd_banking_system_menu.sqf","",1,false,true,"",""];
			_veh = vehicle player;
		};
		if (_veh != vehicle player) then
		{
			_veh removeAction _idx;
			_idx = -1;      
		};
	}else{
		if(_idx != -1) then {
			_veh removeAction _idx;
			_idx = -1;
		};
	};
	Sleep 2;
};
_veh removeAction _idx;
_idx = -1;
