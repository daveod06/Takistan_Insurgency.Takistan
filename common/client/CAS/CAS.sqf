private["_velocityZ"];
waitCAS=true;
_object=_this select 0;
_distance=_this select 1;
_doLock=_this select 2;
_num=_this select 3;
_casType=_this select 4;
_loc=getMarkerPos(_this select 5);
_id=_this select 6;
player removeAction _id;
_str=format["<t color='#FF1000'>Abort CAS</t>"];
_cancel=player addAction[_str,"common\client\CAS\cancelCAS.sqf",nil,-1,false,true,""];
_lockobj=createAgent["Logic",[(_loc select 0),(_loc select 1),0],[],0,"CAN_COLLIDE"];
_lockobj setPos _loc;
_lck=getPosASL _lockobj select 2;
_loc=visiblePosition _lockobj;
_dir=random 360;
_dis=8000;
_ranPos=[(_loc select 0)+_dis*sin _dir,(_loc select 1)+_dis*cos _dir,700];
_jetType="B_Plane_CAS_01_F";
//if(isCUPV)then{_jetType="CUP_B_A10_CAS_USA"}else{_jetType="B_Plane_CAS_01_F";};
if(isOSKVA)then{_jetType="RHS_Su25SM_vvs"}else{_jetType="B_Plane_CAS_01_F";};

casGrp=createGroup SIDE_OCCUPIERS;
if(_casType!="GUNS")then{
_buzz=createVehicle[_jetType,_ranPos,[],0,"FLY"];clearItemCargoGlobal _buzz;
_buzz setVectorDir[(_loc select 0)-(getPos _buzz select 0),(_loc select 1)-(getPos _buzz select 1),0];
[_buzz]execVM"common\client\CAS\track.sqf";
sleep 0.2;
_dir=getDir _buzz;
_buzz setVelocity[sin(_dir)*200,cos(_dir)*200,0];
_pilot=casGrp createUnit["B_Pilot_F",_ranPos,[],0,"FORM"];
_pilot moveInDriver _buzz;
_buzz setCaptive true;_buzz allowDamage false;
_pilot enableMimics false;_pilot disableAI"SUPPRESSION";_pilot disableAI"AIMINGERROR";_pilot disableAI"TEAMSWITCH";_pilot moveInDriver _buzz;
_pilot flyInheight 700;_buzz flyInheight 700;

(leader casGrp)sideChat"HOG 1 copies. Coming in hot.  ETA 30 seconds.";
casGrp setBehaviour"STEALTH";
casGrp setSpeedMode"FULL";
casGrp setCombatMode"BLUE";
(driver _buzz)doMove[_loc select 0,_loc select 1,700];

doCounterMeasure={
_plane=_this select 0;
for "_i" from 1 to 4 do{
_bool=_plane fireAtTarget[_plane,"CMFlareLauncher"];
sleep 0.3;};
sleep 3;
_plane=_this select 0;
for "_i" from 1 to 4 do{
_bool=_plane fireAtTarget[_plane,"CMFlareLauncher"];
sleep 0.3;};};

while{true}do{
if(_buzz distance _lockobj<=980)exitwith{};
if(!alive _buzz)exitwith{};
if(abortCAS)exitWith{};
sleep 0.01;};

if(!alive _buzz)exitwith{casRequest=false;deleteMarker "CAS_TARGET";};
waitCAS=false;
if(abortCAS)exitWith{
_buzz move _ranPos;
(leader casGrp)sideChat"HOG 1 copies.  Waving off.";
abortCAS=false;
waitUntil{_buzz distance _object>=2000 || !alive _buzz};
{deleteVehicle objectParent _x;deleteVehicle _x;}forEach units casGrp;};

_vehName=vehicleVarName player;
_variables=varHolder getVariable _vehName;
_maxDist=_variables select 0;
_lock=_variables select 1;
_num=_variables select 2;
_num=_num-1;

player removeAction _cancel;
[_buzz]spawn doCounterMeasure;
(leader casGrp)sideChat"Pickle.  Bombing run complete.  HOG 1 is waving off.";
if((alive _buzz)&&(_casType=="JDAM"))then{
_drop=createAgent["Logic",[getPos _buzz select 0,getPos _buzz select 1,0],[],0,"CAN_COLLIDE"];
_height=225+_lck;
_ASL=getPosASL _drop select 2;
_height=_height-_ASL;
_bomb=createVehicle["Bo_GBU12_LGB",[(getPos _drop select 0),(getPos _drop select 1),_height],[],0,"can_collide"];
_bomb setDir((_loc select 0)-(getPos _bomb select 0))atan2((_loc select 1)-(getPos _bomb select 1));
_dist=_bomb distance _loc;
if(_dist>=536)then{
_diff=_dist-536;
_diff=_diff*0.150;
_velocityZ=85-_diff;};
if(_dist<536)then{
_diff=536-_dist;
_diff=_diff*0.150;
_velocityZ=85+_diff;};
_bDrop=sqrt(((getPosASL _bomb select 2)-_lck)/4.9);
_bVelX=((_loc select 0)-(getPos _bomb select 0))/_bDrop;
_bVelY=((_loc select 1)-(getPos _bomb select 1))/_bDrop;
_bomb setVelocity[_bVelX,_bVelY,(velocity _bomb select 2)-_velocityZ];
deleteVehicle _drop;};
if((alive _buzz)&&(_casType=="CBU"))then{
_drop=createAgent["Logic",[getPos _buzz select 0,getPos _buzz select 1,0],[],0,"CAN_COLLIDE"];
_height=225+_lck;
_ASL=getPosASL _drop select 2;
_height=_height-_ASL;
_height=_height+40;
_cbu=createVehicle["Bo_GBU12_LGB",[(getPos _drop select 0),(getPos _drop select 1),_height],[],0,"can_collide"];
_cbu setDir((_loc select 0)-(getPos _cbu select 0))atan2((_loc select 1)-(getPos _cbu select 1));
_dist=_cbu distance _loc;
if(_dist>536)then{
_diff=_dist-536;
_diff=_diff*0.150;
_velocityZ=85-_diff;
};
if(_dist<536)then{
_diff=536-_dist;
_diff=_diff*0.150;
_velocityZ=85+_diff;};
_bDrop=sqrt(((getPosASL _cbu select 2)-_lck)/4.9);
_bVelX=((_loc select 0)-(getPos _cbu select 0))/_bDrop;
_bVelY=((_loc select 1)-(getPos _cbu select 1))/_bDrop;
_cbu setVelocity[_bVelX,_bVelY,(velocity _cbu select 2)-_velocityZ];
waitUntil{getPos _cbu select 2<=40};
_pos=getPos _cbu;
_effect=createVehicle["SmallSecondary",_pos,[],0,"can_collide"];
deleteVehicle _cbu;
for "_i" from 1 to 35 do{
_explo=createVehicle["G_40mm_HEDP",_pos,[],0,"can_collide"];
_explo setVelocity[-35+(random 70),-35+(random 70),-50];
sleep 0.025;};
deleteVehicle _drop;};

casGrp=group _buzz;
deleteVehicle _lockobj;
deleteMarker "CAS_TARGET";
waitUntil{_buzz distance _object>=2000 || !alive _buzz};
(leader casGrp)sideChat"HOG 1 is RTB for rearm and refuel.  Will be back on station in about 10 mikes.";
deleteVehicle _pilot;deleteVehicle _buzz;deleteGroup casGrp;
sleep 600;
casRequest=false;
if(alive _object)then{[MaxD,Alock,num]execVM"common\client\CAS\addAction.sqf";};
};

if(_casType=="GUNS")then{
_fakePilot=casGrp createUnit["B_Pilot_F",[0,0,0],[],0,"can_collide"];_fakePilot allowDamage false;
(leader casGrp)sideChat"HOG 1 copies.  Gun-run ETA 30 seconds...";
tempLase=createVehicle["LaserTargetCBase",_loc,[],0,"can_collide"];publicVariable"tempLase";
tempLase enableSimulation false;tempLase hideObjectGlobal true;
tempLase setVariable["vehicle","B_Plane_CAS_01_F",true];
tempLase setVariable["type",0,true];
sleep 20;
if(abortCas)exitWith{deleteVehicle tempLase;sleep 2;deleteVehicle _fakePilot;deleteGroup casGrp;};
player removeAction _cancel;
_ingress=round random 359;tempLase setDir _ingress;
(leader casGrp)sideChat format["My ingress heading is %1. Coming in hot, guns guns guns!",_ingress];
[tempLase,nil,true]remoteExec["BIS_fnc_moduleCAS",0,false];
sleep 25;
deleteMarker "CAS_TARGET";
(leader casGrp)sideChat"Gun run complete.  HOG 1 is waving off.";
sleep 30;
deleteVehicle tempLase;
casGrp=group _fakePilot;
(leader casGrp)sideChat "HOG 1 is RTB for rearm and refuel.  Will be back on station in about 5 mikes.";
sleep 1;
deleteVehicle _lockobj;deleteVehicle _fakePilot;deleteGroup casGrp;
sleep 300;
casRequest=false;
if(alive _object)then{[MaxD,Alock,num]execVM"common\client\CAS\addAction.sqf";};
};
