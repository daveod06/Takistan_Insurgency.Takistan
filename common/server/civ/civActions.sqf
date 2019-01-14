civ_Homes=["Land_House_L_1_EP1","Land_House_L_3_EP1","Land_House_L_4_EP1","Land_House_L_6_EP1","Land_House_L_7_EP1","Land_House_L_8_EP1","Land_House_L_9_EP1","Land_House_K_1_EP1","Land_House_K_3_EP1","Land_House_K_5_EP1","Land_House_K_6_EP1","Land_House_K_7_EP1","Land_House_K_8_EP1","Land_House_C_1_EP1","Land_House_C_1_v2_EP1","Land_House_C_2_EP1","Land_House_C_3_EP1","Land_House_C_4_EP1","Land_House_C_5_EP1","Land_House_C_5_V1_EP1","Land_House_C_5_V2_EP1","Land_House_C_5_V3_EP1","Land_House_C_9_EP1","Land_House_C_10_EP1","Land_House_C_11_EP1","Land_House_C_12_EP1","Land_A_Villa_EP1","Land_A_Mosque_small_1_EP1","Land_A_Mosque_small_2_EP1","Land_A_Mosque_big_addon_EP1","Land_A_Mosque_big_hq_EP1","Land_Ind_FuelStation_Build_EP1","Land_Ind_Garage01_EP1","Land_Ind_Coltan_Main_EP1","Land_Ind_Oil_Tower_EP1"];
civ_halt={private _civ=_this select 0;if(cursorObject!=_civ)exitWith{};if(player distance _civ>8)exitWith{titleText["He's too far away...","PLAIN DOWN"];titleFadeOut 3;};
if(isNull _civ || !alive _civ)exitWith{_civ remoteExec["removeAllActions",0,true];titleText["He's dead...","PLAIN DOWN"];titleFadeOut 5;};
player playAction"HandSignalFreeze";
private _haltTxt=str selectRandom[
"<t size='2' shadow='2'>Halt!</t>",
"<t size='2' shadow='2'>Stop!</t>",
"<t size='2' shadow='2'>Hold it right there!</t>",
"<t size='2' shadow='2'>Freeze!</t>",
"<t size='2' shadow='2'>Stop moving!</t>"];
titleText[_haltTxt,"PLAIN DOWN",-1,true,true];titleFadeOut 3;
if(!(side _civ isEqualTo SIDE_CIV))exitWith{_civ remoteExec["removeAllActions",0,true];};
[_civ,"PATH"]remoteExec["disableAI",0];};


civ_goAway={private _civ=_this select 0;if(cursorObject!=_civ)exitWith{};if(player distance _civ>5)exitWith{titleText["He's too far away...","PLAIN DOWN"];titleFadeOut 3;};
if(isNull _civ || !alive _civ)exitWith{_civ remoteExec["removeAllActions",0,true];titleText["He's dead...","PLAIN DOWN"];titleFadeOut 5;};
private _goAwayTxt=str selectRandom[
"<t size='2' shadow='2'>Go away!</t>",
"<t size='2' shadow='2'>Get out of here!</t>",
"<t size='2' shadow='2'>Move along!</t>",
"<t size='2' shadow='2'>Get the fuck out of here!</t>",
"<t size='2' shadow='2'>Get out of the way!</t>",
"<t size='2' shadow='2'>Get the fuck out of the way!</t>"];
player playAction"HandSignalPoint";
titleText[_goAwayTxt,"PLAIN DOWN",-1,true,true];titleFadeOut 3;
if(!(side _civ isEqualTo SIDE_CIV))exitWith{_civ remoteExec["removeAllActions",0,true];};
_nH=nearestObjects[_civ,civ_Homes,150];
if(count _nH==0)exitWith{};
private["_H"];
_H=selectRandom _nH;_HP=_H buildingPos -1;_HP=selectRandom _HP;
if(count waypoints _civ>0)then{{deleteWaypoint((waypoints _civ)select 0);}forEach waypoints _civ;};
[_civ,"PATH"]remoteExec["enableAI",0];[_civ,"MOVE"]remoteExec["enableAI",0];[_civ,"UP"]remoteExec["setUnitPos",0];[_civ,"FULL"]remoteExec["setSpeedMode",0];[_civ,_HP]remoteExec["doMove",0];};


civ_getDown={private _civ=_this select 0;if(cursorObject!=_civ)exitWith{};if(player distance _civ>8)exitWith{titleText["He's too far away...","PLAIN DOWN"];titleFadeOut 3;};
if(isNull _civ || !alive _civ)exitWith{_civ remoteExec["removeAllActions",0,true];titleText["He's dead...","PLAIN DOWN"];titleFadeOut 5;};
player playAction"HandSignalGetDown";
private _getDownTxt=str selectRandom[
"<t size='2' shadow='2'>Get down!</t>",
"<t size='2' shadow='2'>Get on the ground!</t>",
"<t size='2' shadow='2'>Get down on the ground!</t>"];
titleText[_getDownTxt,"PLAIN DOWN",-1,true,true];titleFadeOut 3;
if(!(side _civ isEqualTo SIDE_CIV))exitWith{_civ remoteExec["removeAllActions",0,true];};
[_civ,"DOWN"]remoteExec["setUnitPos",0];[_civ,"ApanPpneMstpSnonWnonDnon_G01"]remoteExec["playMoveNow",0];};


civ_getUp={private _civ=_this select 0;if(cursorObject!=_civ)exitWith{};if(player distance _civ>5)exitWith{titleText["He's too far away...","PLAIN DOWN"];titleFadeOut 3;};
player playAction"HandSignalGetUp";
_getUpTxt=str selectRandom[
"<t size='2' shadow='2'>Get up!</t>",
"<t size='2' shadow='2'>Stand up!</t>",
"<t size='2' shadow='2'>On your feet!</t>"];
titleText[_getUpTxt,"PLAIN DOWN",-1,true,true];titleFadeOut 3;
if(!(side _civ isEqualTo SIDE_CIV))exitWith{_civ remoteExec["removeAllActions",0,true];};
if(unitPos _civ!="UP")then{[_civ,"UP"]remoteExec["setUnitPos",0];[_civ,"AmovPpneMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"]remoteExec["switchMove",0];};};


//Questioning for intel
civ_startAsk={
if(!local player)exitWith{};
private _civ=_this select 0;
if(cursorTarget!=_civ)exitWith{};
if(isNull _civ || !alive _civ)exitWith{_civ remoteExec["removeAllActions",0,true];titleText["He's dead...","PLAIN DOWN"];titleFadeOut 5;};
if(player distance _civ>5)exitWith{titleText["He's too far away...","PLAIN DOWN"];titleFadeOut 5;};
if(!(side _civ isEqualTo SIDE_CIV))exitWith{_civ remoteExec["removeAllActions",0,true];};

private _myTrait=player getUnitTrait"UavHacker";
private _hello=str selectRandom["<t size='2' shadow='2'>Hello!</t>",
"<t size='2' shadow='2'>Greetings!</t>",
"<t size='2' shadow='2'>Hello there!</t>",
"<t size='2' shadow='2'>Hey there!</t>",
"<t size='2' shadow='2'>Hi!</t>",
"<t size='2' shadow='2'>Hey! Excuse me, sir!</t>",
"<t size='2' shadow='2'>Excuse me!</t>"];
private _noEnglish=selectRandom["(He shakes his head)","(He looks clueless)","(He seems confused)"];
private _askIntel=str selectRandom[
	"<t size='2' shadow='2'>Could you give us some intel?  We're here to help!</t>",
	"<t size='2' shadow='2'>Do you have any intel we can use?  We're here to help!</t>",
	"<t size='2' shadow='2'>Have you seen insurgents or heard any rumors?  We're here to restore Altis.</t>",
	"<t size='2' shadow='2'>Can you help us?  We want to defeat the insurgents ruining your country.</t>",
	"<t size='2' shadow='2'>If you give me some valuable information, I promise we'll protect you.</t>"];
private _iHaveNoIntel=str selectRandom[
	"<t size='2' shadow='2'>I haven't seen or heard anything.</t>",
	"<t size='2' shadow='2'>Sorry, I don't know anything.</t>",
	"<t size='2' shadow='2'>If there were rebels here, they're gone now.</t>",
	"<t size='2' shadow='2'>Search elsewhere.</t>"];
private _noGiveIntel=str selectRandom[
	"<t size='2' shadow='2'>I... I can't, please leave me alone.</t>",
	"<t size='2' shadow='2'>They'll kill me if I talk; I can't help you.</t>",
	"<t size='2' shadow='2'>They'll hurt my family if I help you!  I'm sorry!</t>",
	"<t size='2' shadow='2'>I don't want to get in the middle of things.</t>",
	"<t size='2' shadow='2'>I don't want to take sides, please just leave me be!</t>",
	"<t size='2' shadow='2'>You?  Need MY help?!  I think I'll just wait this war out...</t>",
	"<t size='2' shadow='2'>Please!  If they see me talking to you, they'll kill me AND my family!</t>"];

_civ remoteExec["removeAllActions",0,true];titleText[_hello,"PLAIN DOWN",-1,true,true];player setRandomLip true;_civ allowDamage false;
sleep 1;
if(!weaponLowered player)then{player playMove"AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon";};
_civ doWatch player;_civ lookAt player;
sleep .5;
player playAction"gestureHi";_civ doWatch player;player setRandomLip false;
sleep 1;
switch(floor(random 2))do{
case 0:{player switchMove"HubStanding_idle1"};
case 1:{player switchMove"HubStanding_idle2"};
case 2:{player switchMove"HubStanding_idle3"};
};
private _pDir=(_civ getRelDir player);
sleep 1;
_civ playAction"Stop";[_civ,"PATH"]remoteExec["disableAI",0];[_civ,"MOVE"]remoteExec["disableAI",0];
[_civ,_pDir]remoteExec["setDir",0];sleep .5;_civ playAction"gestureHi";
sleep 1.5;
if(_myTrait)then{
titleText[_askIntel,"PLAIN DOWN",-1,true,true];player setRandomLip true;
sleep 5;
player setRandomLip false;
sleep 1;
_civ setRandomLip true;
	//Random intel given
	if(round(random 4)==1)then{
		private _nearBads1=_civ nearEntities[SIDE_INS_SOLDIER_CLASS,350];
		private _nearBads2=_civ nearEntities[SIDE_IND_SOLDIER_CLASS,350];
		if(count _nearBads1>0)then{
		titleText["<t size='5' shadow='2'>(Acquiring Intel)</t>","PLAIN DOWN",-1,true,true];
		[_civ,"Acts_PointingLeftUnarmed"]remoteExec["switchMove",0];
		private _nearBaddie=selectRandom _nearBads1;
		//private _nearBaddieGrp=count units group _nearBaddie;//He was / wasn't alone
		private _primW=currentWeapon _nearBaddie;
		private _gunName=getText(configFile>>"CfgWeapons">>_primW>>"displayName");
		private _giveIntel=parseText format["<t color='#f4c542' size='2' shadow='2'>INTEL!</t><br/>___________________<br/>""I saw a man with a %1 at grid:<br/>%2.<br/><br/>I think it was about bearing %3 from here.<br/><br/>He's %4m away from here.""",_gunName,mapGridPosition _nearBaddie,round(player getRelDir _nearBaddie),round(player distance _nearBaddie)];
		hint _giveIntel;
		[[_nearBaddie,4],{group player reveal _this}]remoteExec["call",0];}else{
				if(count _nearBads2>0)then{
				[_civ,"Acts_PointingLeftUnarmed"]remoteExec["switchMove",0];
				titleText["<t size='5' shadow='2'>(Acquiring Intel)</t>","PLAIN DOWN",-1,true,true];
				private _nearBaddie=selectRandom _nearBads2;
				private _primW=currentWeapon _nearBaddie;
				private _gunName=getText(configFile>>"CfgWeapons">>_primW>>"displayName");
				private _giveIntel=parseText format["<t color='#f4c542' size='2' shadow='2'>INTEL!<br/>___________________<br/>""I saw a Russian soldier with a %1 at grid:<br/><t size='1.3'>%2</t>.<br/><br/>I think it was about bearing <t size='1.3'>%3</t> from here.<br/><br/>He's <t size='1.3'>%4m</t> away from here.""",_gunName,mapGridPosition _nearBaddie,round(player getRelDir _nearBaddie),round(player distance _nearBaddie)];
				hint _giveIntel;
				[[_nearBaddie,4],{group player reveal _this}]remoteExec["call",0];}else{call newIntel;call iHint;_civ setRandomLip true;};
			titleText[_iHaveNoIntel,"PLAIN DOWN",-1,true,true];_civ setRandomLip true;};
			sleep 5;
			[_civ,""]remoteExec["switchMove",0];_civ setRandomLip false;
			sleep 1;
			_civ doWatch objNull;_civ lookAt objNull;[_civ,"PATH"]remoteExec["enableAI",0];[_civ,"MOVE"]remoteExec["enableAI",0];
			sleep 1;
			player playMove"AmovPercMstpSlowWrflDnon";
			}else{
			//He doesn't want to give intel
			[_civ,"Acts_StandingSpeakingUnarmed"]remoteExec["switchMove",0];
			titleText[_noGiveIntel,"PLAIN DOWN",-1,true,true];
			sleep 4;
			[_civ,""]remoteExec["switchMove",0];_civ setRandomLip false;
			sleep 1;
			_civ doWatch objNull;_civ lookAt objNull;[_civ,"PATH"]remoteExec["enableAI",0];[_civ,"MOVE"]remoteExec["enableAI",0];
			sleep 1;
			player playMove"AmovPercMstpSlowWrflDnon";
			};
}else{
titleText["<t size='2' shadow='2'>""Do you speak English?""</t>","PLAIN DOWN",-1,true,true];player setRandomLip true;
sleep 2;
player setRandomLip false;
sleep 1;
_civ playAction"GestureNo";
sleep 1;
_civ doWatch objNull;[_civ,"PATH"]remoteExec["enableAI",0];[_civ,"MOVE"]remoteExec["enableAI",0];_civ setRandomLip false;_civ lookAt objNull;
sleep 1;
player playMove"AmovPercMstpSlowWrflDnon";titleText[_noEnglish,"PLAIN DOWN",-1,true,true];};

_civ allowDamage true;
if((isNull _civ)||(!alive _civ))exitWith{};
[_civ,["Get down!",{call civ_getDown}]]remoteExec["addAction",0];
[_civ,["Get up!",{call civ_getUp}]]remoteExec["addAction",0];
[_civ,["Halt!",{call civ_halt}]]remoteExec["addAction",0];
[_civ,["Go away!",{call civ_goAway}]]remoteExec["addAction",0];
};

/*
civ_detain={private _civ=_this select 0;};
civ_release={private _civ=_this select 0;};
civ_search={};
civ_followMe={};

HandSignalGetDown
HandSignalGetUp
HandSignalHold
HandSignalMoveForward
HandSignalMoveOut
HandSignalPoint
"\a3\dubbing_f_epa\a_in\90_Stop\a_in_90_stop_CH0_0.ogg"
*/

askAct={
private["_screenMsg","_scriptToCall"];
_unit=_this select 0;
_screenMsg=_this select 1;
_scriptToCall=_this select 2;	
if(isNull _unit)exitWith{};
_unit addAction[_screenMsg,_scriptToCall];};