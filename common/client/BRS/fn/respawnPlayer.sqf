private["_spawnSide","_limitEnemy"];
_addaction=player getVariable "BRSAddAction";
if(!isNil("BRS_currentSpawn"))then{
	if(_addaction)then{
	_spawnSide=player getVariable "AASpawnSide";
	_limitEnemy=player getVariable "AAlimitEnemy";}else{
	_spawnSide=player getVariable "EVSpawnSide";
	_limitEnemy=player getVariable "EVlimitEnemy";};
if({(_x distance BRS_currentSpawn<_limitEnemy)and(if(side _x!=SIDE_CIV)THEN{
side _x!=_spawnSide;})}count allUnits>0)then{
_display=uiNamespace getVariable "BRS_RespawnDialog";
(_display displayCtrl 51500)ctrlSetText"  ENEMIES NEARBY!";}else{
//IF SPAWN IS NOT IN VEHICLE
if(vehicle BRS_currentSpawn==BRS_currentSpawn)THEN{
exitBRS=TRUE;
player cameraEffect["terminate","back"];
closeDialog 0;

_display=uiNamespace getVariable "BRS_RespawnDialog";
(_display)displayRemoveAllEventHandlers "KeyDown";
BRS_selectSpawn=nil;
BRS_mapClose=TRUE;				
player setCaptive false;player allowDamage true;player hideObjectGlobal false;

cutText["","BLACK IN",3];
player setPosATL[getPos BRS_cam select 0,getPos BRS_cam select 1,0];
player setDir(((getPos BRS_currentSpawn select 0)-(getPos player select 0))atan2((getPos BRS_currentSpawn select 1)-(getPos player select 1)));
if(stance BRS_currentSpawn=="stand")then{player switchMove "amovpknlmstpsraswrfldnon";};
if(stance BRS_currentSpawn=="crouch")then{player switchMove "amovpknlmstpsraswrfldnon";};
if(stance BRS_currentSpawn=="prone")then{player switchMove "amovpknlmstpsraswrfldnon";};}else{
if((vehicle BRS_currentSpawn)emptyPositions "cargo">0)THEN{
exitBRS=TRUE;
player cameraEffect["terminate","back"];
closeDialog 0;

_display=uiNamespace getVariable "BRS_RespawnDialog";
(_display)displayRemoveAllEventHandlers "KeyDown";
BRS_selectSpawn=nil;
BRS_mapClose=TRUE;				
player setCaptive false;player allowDamage true;player hideObjectGlobal false;

cutText["","BLACK IN",3];
player moveInCargo vehicle BRS_currentSpawn;}else{
_display=uiNamespace getVariable"BRS_RespawnDialog";
(_display displayCtrl 51500)ctrlSetText"  VEHICLE FULL";};};};};