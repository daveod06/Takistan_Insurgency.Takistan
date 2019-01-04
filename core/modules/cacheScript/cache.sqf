/*Script by Mphillips'Hazey' + Sacha Ligthert + Phronk

Special Thanks:
ArmA Tactical Combat Applications Group - Tactical Realism http://www.ATCAG.com
Tangodown - Tactical Gaming Community http://www.tangodown.nl/
Whiskey Company - Tactical Realism http://www.TheWhiskeyCo.com/
*/
if(isServer)then{
private["_mkrs","_x","_randMkr","_dist","_pos","_m","_decrease","_wait","_cacheHouses","_tarHouse","_cachePos","_string"];
INS_bluScore=0;publicVariable"INS_bluScore";
INS_waitforcache=false;//used to force damage eventhandlers to fire INS_fncache only once
INS_fnCache={if(typeName _this=="ARRAY")then{cache=_this select 0;cache spawn{sleep 2;deleteVehicle _this;INS_waitforcache=false;};//[cache]spawn cacheRW;
//_cKiller=_this select 1;
INS_bluScore=INS_bluScore+1;publicVariable"INS_bluScore";
_this call cacheDie;};

_cities=call SL_mkrAreas;
_cacheTown=selectRandom _cities;
_cityPos=markerPos _cacheTown;
_cityRadA=markerSize _cacheTown select 0;
_cityRadB=markerSize _cacheTown select 1;
if(_cityRadB>_cityRadA)then{_cityRadA=_cityRadB;};
_cacheHouses=[_cityPos,_cityRadA]call SL_findHouses;
while{count _cacheHouses==0}do{
sleep 2;
_cities=call SL_mkrAreas;
_cacheTown=selectRandom _cities;
_cityPos=markerPos _cacheTown;
_cityRadA=markerSize _cacheTown select 0;
_cityRadB=markerSize _cacheTown select 1;
if(_cityRadB>_cityRadA)then{_cityRadA=_cityRadB;};
_cacheHouses=[_cityPos,_cityRadA]call SL_findHouses;};
_tarHouse=_cacheHouses select(random((count _cacheHouses)-1));
_cachePos=[_tarHouse]call SL_randHousePos;
sleep 1;
_boxes=["Box_FIA_Wps_F","Box_IED_Exp_F","Box_Syndicate_Wps_F","Box_Syndicate_WpsLaunch_F","Box_Syndicate_Ammo_F"];_box=selectRandom _boxes;
cache=createVehicle[_box,_cachePos,[],0,"NONE"];publicVariable"cache";cache setDamage 0;clearItemCargoGlobal cache;clearBackpackCargoGlobal cache;
cache addEventHandler["handleDamage",{INS_waitforcache=true;if((_this select 4)=="SatchelCharge_Remote_Ammo")then{(_this select 0)setDamage 1;}else{(_this select 0)setDamage 0;};}];
cache addMPEventHandler["MPKilled",{INS_waitforcache=true;_this spawn INS_fnCache}];
cache setPos _cachePos;cache setDamage 0;
/*rw2=["Box_NATO_Ammo_F","Box_NATO_Equip_F","B_Slingload_01_Fuel_F","B_Slingload_01_Repair_F","B_Slingload_01_Medevac_F","B_Slingload_01_Cargo_F","B_Slingload_01_Ammo_F","B_LSV_01_armed_F"];
cacheTask={waitUntil{player distance cache<2.5};
[west,["ct"],["Cache has been discovered!  Destroy it with an EXPLOSIVE SATCHEL!","Destroy Cache"],objNull,true,0,true,"Destroy",true]call BIS_fnc_taskCreate;};
cacheRW={
["ct","SUCCEEDED",true]spawn BIS_fnc_taskSetState;
_rw=selectRandom rw2;_newRW=createVehicle[_rw,getMarkerPos "rwMkr",[],8,"CAN_COLLIDE"];_newRW setDir 331;};
[cache]spawn cacheTask;*/

if(INS_bluScore>=(paramsArray select 1))then{
end_title={titleText["!All caches have been destroyed!","PLAIN"];hint"All caches have been destroyed! Mission ending in 20 seconds...";};
[nil,"end_title",nil,true]spawn BIS_fnc_MP;3 fadeMusic 1;playMusic"";//TO DO: remoteExec is faster!
sleep 20;
endMission"END1";};
//sleep 2;_m=createMarker[format["box%1",random 1000],getPosATL cache];_m setMarkerShape "ICON";_m setMarkerType "mil_dot";_m setMarkerColor "ColorRed";_m setMarkerAlpha 1;
};
true spawn INS_fnCache;};