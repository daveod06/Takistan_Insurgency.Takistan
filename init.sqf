enableSaving false;
if(isClass(configFile>>"CfgPatches">>"TPW_MODS"))then{endMission"END2";};
if(isClass(configFile>>"CfgPatches">>"task_force_radio"))then{isTFAR=true;}else{isTFAR=false;};
if(isClass(configFile>>"CfgPatches">>"acre_main"))then{isACRE=true;}else{isACRE=false;};
if(isClass(configFile>>"cfgPatches">>"ace_common"))then{isACE=true;}else{isACE=false;};
if(isClass(configFile>>"cfgPatches">>"Taliban_fighters"))then{isTalib=true;}else{isTalib=false;};
if(isClass(configFile>>"cfgPatches">>"CUP_Weapons_WeaponsCore"))then{isCUPW=true;}else{isCUPW=false;};
if(isClass(configFile>>"cfgPatches">>"CUP_Creatures_People_Core"))then{isCUPU=true;}else{isCUPU=false;};
if((isClass(configFile>>"cfgPatches">>"CUP_WheeledVehicles_Core"))&&{(isClass(configFile>>"cfgPatches">>"CUP_BaseConfigs"))})then{isCUPV=true;}else{isCUPV=false;};
if(isClass(configFile>>"cfgPatches">>"SFG_Tac_Beard"))then{isBeard=true;}else{isBeard=false;};
if(isClass(configFile>>"cfgPatches">>"rhs_t72"))then{isRHSRF=true;}else{isRHSRF=false;};
if(isClass(configFile>>"cfgPatches">>"rhsusf_vehicles"))then{isRHSUS=true;}else{isRHSUS=false;};
#include"core\modules\cacheScript\fn\fn.sqf";
#include"core\modules\cacheScript\fn\cacheFn.sqf";
#include"core\modules\cacheScript\fn\KRON_Str.sqf";
#include"eos\fn\fn.sqf";
#include"common\server\civ\civActions.sqf";
call compile preprocessFileLineNumbers"common\server\civ\traffic.sqf";
call compile preprocessFileLineNumbers"common\server\civ\dbugT.sqf";
call compile preprocessFileLineNumbers"common\server\civ\dbugC.sqf";
civs_SIDE=civilian;
civs_MINSKILL=0;
civs_MAXSKILL=0;
civs_MAXWAITINGTIME=300;
civs_RUNNINGCHANCE=0.05;
civs_BEHAVIOURS=[["CITIZEN",100]];
civs_INSTANCE_NO=0;
civTraffic_instanceIndex=-1;
civTraffic_areaMarkerNames=[];
civTraffic_roadSegments=[];
civTraffic_edgeTopLeftRoads=[];
civTraffic_edgeTopRightRoads=[];
civTraffic_edgeBottomRightRoads=[];
civTraffic_edgeBottomLeftRoads=[];
civTraffic_edgeRoadsUseful=[];
#ifndef execNow
#define execNow call compile preprocessFileLineNumbers
#endif
execNow"core\init.sqf";
ia_say=compileFinal"_this select 0 say3D(_this select 1);";
if(isServer)then{
null=[]execVM"eos\openMe.sqf";
call compile preprocessFileLineNumbers"common\server\civ\serverFN.sqf";call compile preprocessFileLineNumbers"common\server\civ\cCFG.sqf";
call compile preprocessFileLineNumbers"common\server\civ\fn.sqf";call compile preprocessFileLineNumbers"common\server\civ\tCFG.sqf";};
null=[]execVM"common\server\ied.sqf";
vIED1=[(getMarkerPos"NW"),2000,15,true,false,SIDE_OCCUPIERS]execVM"common\server\vIED.sqf";
vIED2=[(getMarkerPos"NE"),2000,15,true,false,SIDE_OCCUPIERS]execVM"common\server\vIED.sqf";
vIED3=[(getMarkerPos"SW"),2000,15,true,false,SIDE_OCCUPIERS]execVM"common\server\vIED.sqf";
vIED4=[(getMarkerPos"SE"),2000,15,true,false,SIDE_OCCUPIERS]execVM"common\server\vIED.sqf";
if(paramsArray select 3==1)then{0=[12,1000,300]execVM"common\server\civ\tpw_animals.sqf";};
null=[]execVM"common\server\veh.sqf";
execVM"common\server\safeZ.sqf";
execVM"common\server\ctp\ctp.sqf";
null=[[AIRBASE],SIDE_OCCUPIERS,true,75,false]execVM"common\client\BRS\BRS_launch.sqf";
player addMPEventHandler["MPKilled",{_me=_this select 0;_tk=_this select 1;
if((isPlayer _tk)&&{(_me!=_tk)})then{
diag_log format["%1 was teamkilled by %2... Killer's UID is: %3",name _me,name _killer,getPlayerUID _killer];};}];
null=[]execVM"common\server\gc.sqf";
[SIDE_OCCUPIERS,["vaTsk","blTsk"],["Gear up next to the mess hall to take the fight to the Mujahideen and fulfill your socialist Soldier-Internationalist duty!","Gear Up!","GearMkr"],SovietGearBox,false,4,false,"Rifle",true]call BIS_fnc_taskCreate;
[SIDE_OCCUPIERS,["wvTsk","blTsk"],["Wheeled Vehicles located in the motor pool","Motorized Vehicles","MRAPmkr"],[8217.231,2099.559,0],false,4,false,"Truck",true]call BIS_fnc_taskCreate;
[SIDE_OCCUPIERS,["hTsk","blTsk"],["Transport helicopters located on the far side of the base, at the base of the mountain.","Rotory Wing Vehicles","helMkr"],[8215.742,1788.51,0],false,4,false,"Heli",true]call BIS_fnc_taskCreate;
[SIDE_OCCUPIERS,["jTsk","blTsk"],["Close-Air-Support fixed wing aircraft located under green hangar tents along runway.","Close-Air-Support","fxwMkr"],[8195.889,1961.423,0],false,4,false,"Plane",true]call BIS_fnc_taskCreate;
[SIDE_OCCUPIERS,["armTsk","blTsk"],["Light and heavy armored vehicles located South-West of tan hangars in base.","Armored Vehicles","armMkr"],[8098.501,2026.358,0],false,4,false,"Armor",true]call BIS_fnc_taskCreate;
[SIDE_OCCUPIERS,["rTsk","blTsk"],["Maintenance Area: Refuel, rearm, and repair vehicle on the medical helipad on the runway.","Vehicle Maintenance","rearmMkr"],[8211.026,2031.173,0],false,4,false,"Repair",true]call BIS_fnc_taskCreate;
[SIDE_OCCUPIERS,["blTsk"],["Points of interest in base, marked on your map.","Base Layout",""],objNull,false,4,false,"",true]call BIS_fnc_taskCreate;
null=[]execVM"common\server\Obj\init.sqf";
execVM"common\client\AFAR\init.sqf";
if(!isACE)then{
inCap=compile preprocessFileLineNumbers"common\server\ai\inCap.sqf";_null=[true,true,true,70,0]execVM"common\server\ai\wound.sqf";
null=[]execVM"common\client\strobe\strobe.sqf";null=[]execVM"common\client\CRS\init.sqf";
if(!isServer&&isNull player)then{isJIP=true;}else{isJIP=false;};};


// --------------------------------------  COMPILE ARTILLERY
//[] execVM "ai-artillery\ArtilleryInit.sqf";
// --------------------------------------  START UP ARTILLERY
RydFFE_NoControl = []; // each arty group (battery) held inside this array will be excluded from FAW control
RydFFE_ArtyShells = 10; // positive integer. Multiplier of default magazines loadout per kind per each artillery piece
RydFFE_Interval = 20; // time gap (in seconds) between each “seek for targets cycle (each cycle each idle battery on map looks for new fire mission opportunity)
RydFFE_Debug = true; // if set as true, will be shown map markers that allows user to watch, what is going on. See DEBUG MARKERS chapter for details;
RydFFE_ShellView = true;
RydFFE_FOClass = [
"OKSVA_Spotter_MSV",
"OKSVA_Senior_Technician_MSV",
"OKSVA_Senior_Officer_MSV",
"OKSVA_Officer_MSV",
"OKSVA_Junior_Officer_MSV",
"OKSVA_Officer_VDV",
"OKSVA_Officer_SPETSNAZ"
]; // if this array is set as not empty (even with objNull), limited spotting modebecomes active, so only members of groups, which names are inside this array or whichleaders are of proper class (see below), will have ability of spotting targets for batteries.
RydFFE_Amount = 5; // this holds number of shells, that in summary should be fired in each fire mission. CLUSTER and GUIDED salvo amount is always divided by 3 (rounded up);
RydFFE_Acc = 3; // multiplier of whole salvo drift radius. The bigger value, the bigger radius;
RydFFE_Safe = 50; // salvo will be not planned for coordinates located within this radius (in meters) around any allied group leader;
RydFFE_Monogamy = false; // by default each enemy group can be a target for only one battery at the time. If set to false, there is no such limitation, so one target can be shelled by any number of batteries at the time;
RydFFE_Add_SPMortar = []; // here you can list classnames of custom SP mortar units, that should be controlled by ;
RydFFE_Add_Mortar = ["OKSVA_2B14"]; // here you can list classnames of custom mortar units, that should be controlled by ;
RydFFE_Add_Rocket = ["OKSVA_BM21"]; // here you can list classnames of custom rocket artillery units, that should be controlled by ;
RydFFE_Add_Other = []; // here you can list classnames of other custom artillery units (lowercase only!), that should be controlled by , if are using custom magazines (classes added here shouldn't be added to any other array). Format:
//RydFFE_Add_Other =
//[
//[["gun_classname_1","gun_classname_2"],["ammo_classname_1","ammo_classname_2"]],
//[["gun_classname_3"],["ammo_classname_3","ammo_classname_4"]]
//];
[] spawn DJOAiArtillery_fnc_FFE_ArtilleryMaster;

Param_Grass = 2;
Param_ViewDistance = 10000;
Param_ObjectViewDistance = 5000;
Param_DetailBlend = 12;

setTerrainGrid (Param_Grass*3.125);
setViewDistance (Param_ViewDistance);
setObjectViewDistance [Param_ObjectViewDistance,Param_ObjectViewDistance*0.05];
setDetailMapBlendPars [Param_DetailBlend,Param_DetailBlend*2.5];

if(!isDedicated)then{waitUntil{!isNull player && isPlayer player};};
