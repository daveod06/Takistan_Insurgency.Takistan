_t3=["t3"]call BIS_fnc_taskCompleted;
if(_t3)exitWith{sleep 1;
switch(floor(random 4))do{
case 0:{[]execVM"common\server\Obj\killTow.sqf";};
case 1:{[]execVM"common\server\Obj\killMan.sqf";};
case 2:{[]execVM"common\server\Obj\killAAA.sqf";};
case 3:{[]execVM"common\server\Obj\killVehs.sqf";};
case 4:{[]execVM"common\server\Obj\killVeh.sqf";};
};};
objMen=[];objState=true;publicVariable "objState";
sleep 3;
_objvPos=[5086.3,6869.3,1];
_sObjGrp=createGroup SIDE_INS;
objTar=_sObjGrp createUnit["O_Survivor_F",_objPos,[],0,"CAN_COLLIDE"];publicVariable "objTar";[objTar]call InsH;[objTar]call InsU;[objTar]call InsG;objTar setVariable["NOAI",1,false];objTar disableAI "path";
_nObjPos=[_objvPos,random 50,100,1,0,60*(pi/180),0,[]]call BIS_fnc_findSafePos;
objMen=objMen+[objTar];
objTar setDir random 360;doStop objTar;objTar addWeapon "hgun_Pistol_heavy_02_F";objTar addMagazines["6Rnd_45ACP_Cylinder",4];
_random=(round(random 1)+1);
for "_i" from 0 to _random do{
_nObjPos=[getPos objTar,random 50,100,1,0,60*(pi/180),0,[]]call BIS_fnc_findSafePos;
_objGrp=[_nObjPos,SIDE_INS,(configfile>>"CfgGroups">>"West">>"BLU_F">>"Infantry">>"BUS_InfTeam")]call BIS_fnc_spawnGroup;
[_objGrp,getPos objTar,100+random 400]call BIS_fnc_taskPatrol;
[_objGrp]call objSkill;
objMen=objMen+(units _objGrp);
sleep 1;};
[round(random 1)+1]call objST;
_nObjPos=[_objvPos,random random 10,50,1,0,60*(pi/180),0,[]]call BIS_fnc_findSafePos;
_objGrp=[_nObjPos,SIDE_INS,(configfile>>"CfgGroups">>"West">>"BLU_F">>"Infantry">>"BUS_InfTeam")]call BIS_fnc_spawnGroup;
[_objGrp,getPos objTar]call BIS_fnc_taskDefend;
[_objGrp]call objSkill;
objMen=objMen+(units _objGrp);
{_x enableSimulationGlobal false;_x hideObjectGlobal true;_x disableAI "ALL";_x setSpeaker "NoVoice";_x unlinkItem "NVGoggles_OPFOR";removeUniform _x;removeHeadgear _x;removeVest _x;removeBackpack _x;removeAllWeapons _x;_x disableConversation true;_x enableMimics false;_x setBehaviour "CARELESS";_x addEventHandler["HandleDamage",{_damage=(_this select 2)*1.7;_damage}];}forEach objMen-[objTar];
sleep 1;
{[_x]execVM "eos\fn\randOP4.sqf";}forEach objMen-[objTar];
"objMkr"setMarkerPos(getPos objTar);
"objMkr"setMarkerText"";
"objMkr"setMarkerAlpha 0;
"objMkr"setMarkerType"mil_objective";
[SIDE_OCCUPIERS,["t3"],["Intel reports that the Taliban are hiding an IED maker in a factory just to the north of Feruz Abad.  Kill him.","Kill IED Maker","objMkr"],getMarkerPos "objMkr",true,1,true,"Kill",true]call BIS_fnc_taskCreate;
["t3","Kill"]call BIS_fnc_taskSetType;

waitUntil{!alive objTar};
"objMkr"setMarkerPos[0,0,0];
"objMkr"setMarkerText"";
"objMkr"setMarkerAlpha 0;
["t3","SUCCEEDED",true]spawn BIS_fnc_taskSetState;
{if(mineActive _x)then{deleteVehicle _x;};}forEach allMines;

//_rw=selectRandom rw1;
//_newRW=createVehicle[_rw,getMarkerPos "rwMkr",[],8,"CAN_COLLIDE"];_newRW setDir 331;
sleep 300;
//["t3",SIDE_OCCUPIERS]call BIS_fnc_deleteTask;
{deleteVehicle _x}forEach objMen;
sleep 1;
objMen=[];
sleep 4;
objState=false;publicVariable "objState";
switch(floor(random 4))do{
case 0:{execVM "common\server\Obj\killTow.sqf";};
case 1:{execVM "common\server\Obj\killVeh.sqf";};
case 2:{execVM "common\server\Obj\killMan.sqf";};
case 3:{execVM "common\server\Obj\killVehs.sqf";};
case 4:{execVM "common\server\Obj\killAAA.sqf";};
};