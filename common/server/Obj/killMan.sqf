_t2=["t2"]call BIS_fnc_taskCompleted;
if(_t2)exitWith{sleep 1;
switch(floor(random 4))do{
case 0:{[]execVM "common\server\Obj\killTow.sqf";};
case 1:{[]execVM "common\server\Obj\killAAA.sqf";};
case 2:{[]execVM "common\server\Obj\killVeh.sqf";};
case 3:{[]execVM "common\server\Obj\killVehs.sqf";};
case 4:{[]execVM "common\server\Obj\capIED.sqf";};
};};
objMen=[];
objState=true;publicVariable "objState";
sleep 3;
_objvPos=selectRandom[[5656,8894,0.25],[1797,11941,0.25],[1405,3544,0.6],[10301,2353,0.2],[11494,8259,0.6],[9807,11464,0.2],[5734,9962,0.3]];
_sobjGrp=createGroup SIDE_INS;
objTar=_sobjGrp createUnit["O_Survivor_F",_objvPos,[],0,"CAN_COLLIDE"];publicVariable "objTar";[objTar]call InsH;[objTar]call InsU;[objTar]call InsG;objTar setVariable["NOAI",1,false];objTar disableAI "path";
_nObjPos=[_objvPos,random 50,100,1,0,60*(pi/180),0,[]]call BIS_fnc_findSafePos;
objMen=objMen+[objTar];
objTar setDir random 360;objTar addWeapon "arifle_Katiba_C_F";objTar addMagazines["30Rnd_65x39_caseless_green_mag_Tracer",3];
_random=(round(random 1)+2);
for "_i" from 0 to _random do{
_nObjPos=[getPos objTar,random 50,100,1,0,60*(pi/180),0,[]]call BIS_fnc_findSafePos;
_spawnGroup=[_nObjPos,SIDE_INS,(configfile>>"CfgGroups">>"West">>"BLU_F">>"Infantry">>"BUS_InfTeam")]call BIS_fnc_spawnGroup;
[_spawnGroup,getPos objTar,100+random 400]call BIS_fnc_taskPatrol;
[_spawnGroup]call objSkill;
objMen=objMen+(units _spawnGroup);
sleep 1;};
[round(random 1)+1]call objST;
_nObjPos=[_objvPos,random random 10,50,1,0,60*(pi/180),0,[]]call BIS_fnc_findSafePos;
_spawnGroup=[_nObjPos,SIDE_INS,(configfile>>"CfgGroups">>"West">>"BLU_F">>"Infantry">>"BUS_InfTeam")]call BIS_fnc_spawnGroup;
[_spawnGroup,getPos objTar]call BIS_fnc_taskDefend;
[_spawnGroup]call objSkill;
objMen=objMen+(units _spawnGroup);
{_x enableSimulationGlobal false;_x hideObjectGlobal true;_x disableAI "ALL";_x setSpeaker "NoVoice";_x unlinkItem "NVGoggles_OPFOR";removeUniform _x;removeHeadgear _x;removeVest _x;removeBackpack _x;removeAllWeapons _x;_x disableConversation true;_x enableMimics false;_x setBehaviour "CARELESS";_x addEventHandler["HandleDamage",{_damage=(_this select 2)*1.7;_damage}];}forEach objMen-[objTar];
sleep 1;
{[_x]execVM "eos\fn\randOP4.sqf";}forEach objMen-[objTar];
"objMkr"setMarkerPos(getPos objTar);
"objMkr"setMarkerText "";
"objMkr"setMarkerAlpha 0;
"objMkr"setMarkerType "mil_objective";
[SIDE_OCCUPIERS,["t2"],["Intel reported a terrorist cell leader operating in a mosque.  Eliminate him.","Eliminate Cell Leader","objMkr"],getMarkerPos "objMkr",true,9,true,"Kill",true]call BIS_fnc_taskCreate;
["t2","Kill"]call BIS_fnc_taskSetType;

waitUntil{!alive objTar};
"objMkr"setMarkerPos[0,0,0];
"objMkr"setMarkerText "";
"objMkr"setMarkerAlpha 0;
["t2","SUCCEEDED",true]spawn BIS_fnc_taskSetState;
//_rw=selectRandom rw1;
//_newRW=createVehicle[_rw,getMarkerPos "rwMkr",[],8,"CAN_COLLIDE"];_newRW setDir 331;

sleep 300;
//["t2",SIDE_OCCUPIERS]call BIS_fnc_deleteTask;
{deleteVehicle _x}forEach objMen;
sleep 1;
objMen=[];
sleep 4;
objState=false;publicVariable "objState";
sleep 4;
switch(floor(random 4))do{
case 0:{[]execVM "common\server\Obj\killTow.sqf";};
case 1:{[]execVM "common\server\Obj\killVeh.sqf";};
case 2:{[]execVM "common\server\Obj\killVehs.sqf";};
case 3:{[]execVM "common\server\Obj\killAAA.sqf";};
case 4:{[]execVM "common\server\Obj\capIED.sqf";};
};
//TO DO: Add civilians praying at mosque (potential collateral damage)