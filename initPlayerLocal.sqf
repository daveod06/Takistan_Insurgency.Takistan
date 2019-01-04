call compile preprocessFileLineNumbers"map.sqf";
setViewDistance(paramsArray select 6);setObjectViewDistance(paramsArray select 6);setTerrainGrid 50;setShadowDistance(paramsArray select 8);enableEnvironment[false,true];
enableSentences false;player disableConversation true;player setVariable["BIS_noCoreConversations",true];player setSpeaker"NoVoice";player enableMimics false;
execVM"intro.sqf";
if(paramsArray select 9==1)then{
"colorCorrections"ppEffectEnable true;
"colorCorrections"ppEffectAdjust[0.9,1,0,[0.1,0.1,0.1,-0.1],[1,1,0.85,0.4],[1,0.1,0,0]];
"colorCorrections"ppEffectCommit 0;};
execVM"info.sqf";
sleep 3;
if(isTFAR)then{[(call TFAR_fnc_ActiveSWRadio),7]call TFAR_fnc_setSwVolume;};
if(!isACE)then{
TCB_AIS_PATH="common\client\ais_injury\";[player]call compile preProcessFile(TCB_AIS_PATH+"init_ais.sqf");execVM"common\client\ais_injury\func\fn_ppFX.sqf";
sleep 5;
switch(paramsArray select 10)do{
case 0:{[true,[true,true,true,true],[0,true,true],[[1000],true,false]]execVM"common\client\vip_lit\vip_lit_init.sqf";};
case 1:{[true,[true,true,true,true],[0,true,true],[[1000],true,true]]execVM"common\client\vip_lit\vip_lit_init.sqf";};};
[player]execVM"common\client\EP.sqf";};
player addEventHandler["GetInMan",{if((vehicle player!=player)&&(driver vehicle player==player)&&(vehicle player isKindOf"Car")||(vehicle player isKindOf"Air"))then{setViewDistance 4000;};}];
player addEventHandler["GetOutMan",{setViewDistance(paramsArray select 6);}];
sleep 3;
execVM"common\client\CAS\initCAS.sqf";
player addEventHandler["handleRating",{0}];
sleep 1;
if(paramsArray select 11==1)then{player enableStamina false;};
if(paramsArray select 7==48)then{
while{true}do{sleep 1;
if(player distance getMarkerPos"ah1"<300)then{if(getTerrainGrid==50)exitWith{sleep 10;};if(getTerrainGrid<50)then{setTerrainGrid 50;};};
if((getTerrainGrid==50)&&{(player distance getMarkerPos"ah1">300)})then{setTerrainGrid(paramsArray select 7);};sleep 10;};};