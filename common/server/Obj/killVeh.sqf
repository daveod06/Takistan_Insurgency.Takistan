_t1=["t1"]call BIS_fnc_taskCompleted;
if(_t1)exitWith{sleep 1;
switch(floor(random 4))do{
case 0:{[]execVM "common\server\Obj\killTow.sqf";};
case 1:{[]execVM "common\server\Obj\killMan.sqf";};
case 2:{[]execVM "common\server\Obj\killAAA.sqf";};
case 3:{[]execVM "common\server\Obj\killVehs.sqf";};
case 4:{[]execVM "common\server\Obj\capIED.sqf";};
};};
objMen=[];
objState=true;publicVariable "objState";
sleep 3;

_objvPos=[[6218,6282,1],random 100,random 3500,1,0,60*(pi/180),0,[]]call BIS_fnc_findSafePos;
objTar=createVehicle["O_Truck_03_repair_F",_objvPos,[],0,"CAN_COLLIDE"];publicVariable "objTar";
clearItemCargoGlobal objTar;objTar lock 3;objTar setFuel 0;
objMen=objMen+[objTar];
objTar setDir random 360;
_random=(round(random 1)+1);
for "_i" from 0 to _random do{
_nObjPos=[_objvPos,random 50,1000,1,0,60*(pi/180),0,[]]call BIS_fnc_findSafePos;
_spawnGroup=[_nObjPos,SIDE_INS,(configfile>>"CfgGroups">>"West">>"BLU_F">>"Infantry">>"BUS_InfTeam")]call BIS_fnc_spawnGroup;
[_spawnGroup,getPos objTar,500+random 1000]call BIS_fnc_taskPatrol;
objMen=objMen+(units _spawnGroup);
[_spawnGroup]call objSkill;
sleep 1;};

[round(random 2)+1]call objST;
_nObjPos=[_objvPos,random 10,50,1,0,60*(pi/180),0,[]]call BIS_fnc_findSafePos;
_spawnGroup=[_nObjPos,SIDE_INS,(configfile>>"CfgGroups">>"West">>"BLU_F">>"Infantry">>"BUS_InfTeam")]call BIS_fnc_spawnGroup;
[_spawnGroup,getPos objTar]call BIS_fnc_taskDefend;
[_spawnGroup]call objSkill;
objMen=objMen+(units _spawnGroup);
{_x enableSimulationGlobal false;_x hideObjectGlobal true;_x disableAI "ALL";_x setSpeaker "NoVoice";_x setBehaviour "CARELESS";_x unlinkItem "NVGoggles_OPFOR";removeUniform _x;removeHeadgear _x;removeVest _x;removeBackpack _x;removeAllWeapons _x;_x disableConversation true;_x enableMimics false;}forEach objMen-[objTar];
sleep 1;
{[_x]execVM "eos\fn\randOP4.sqf";}forEach objMen;
"objMkr"setMarkerPos(getPos objTar);
"objMkr"setMarkerText "";
"objMkr"setMarkerAlpha 0;
"objMkr"setMarkerType "mil_dot";
[SIDE_OCCUPIERS,["t1"],["Insurgents own an armored vehicle full of weapons and explosives.  Destroy it.","Destroy Vehicle","objMkr"],getMarkerPos "objMkr",true,9,true,"Destroy",true]call BIS_fnc_taskCreate;
["t1","Destroy"]call BIS_fnc_taskSetType;

waitUntil{!alive objTar};
"objMkr"setMarkerPos[0,0,0];
["t1","SUCCEEDED",true]spawn BIS_fnc_taskSetState;
//_rw=selectRandom rw1;
//_newRW=createVehicle[_rw,getMarkerPos "rwMkr",[],8,"CAN_COLLIDE"];_newRW setDir 331;
sleep 300;
//["t1",SIDE_OCCUPIERS]call BIS_fnc_deleteTask;
{deleteVehicle _x}forEach objMen;
sleep 1;
objMen=[];
sleep 4;
objState=false;publicVariable "objState";
sleep 4;
switch(floor(random 4))do{
case 0:{[]execVM "common\server\Obj\killTow.sqf";};
case 1:{[]execVM "common\server\Obj\killMan.sqf";};
case 2:{[]execVM "common\server\Obj\killVehs.sqf";};
case 3:{[]execVM "common\server\Obj\killAAA.sqf";};
case 4:{[]execVM "common\server\Obj\capIED.sqf";};
};