//WEAPON SAFETY:	To Do: Block reload actionKey when weapon on safe
CRS_wSafe={
if(alive player&&isNull objectParent player)then{
	if(player ammo currentWeapon player>0)then{
	curAmmo=player ammo currentWeapon player;player setAmmo[currentWeapon player,0];
	playSound"dry";titleText["<t size='1.3' color='#0cff00' shadow='2'>Safety On</t>","PLAIN DOWN",1,true,true];titleFadeOut 4;
	(findDisplay 46)displayRemoveEventHandler["KeyDown",safeEH];
	call CRS_noReload;
	}else{
	player setAmmo[currentWeapon player,curAmmo];
	playSound"dry";titleText["<t size='1.3' color='#ff0000' shadow='2'>Safety Off</t>","PLAIN DOWN",1,true,true];titleFadeOut 4;
	waitUntil{!(isNull(findDisplay 46))};
	safeEH=(findDisplay 46)displayAddEventHandler["KeyDown","if(inputAction""User1"">0)then{[player]call CRS_wSafe}"];};};};

CRS_safeInit={waitUntil{!(isNull(findDisplay 46))};
safeEH=(findDisplay 46)displayAddEventHandler["KeyDown","if(inputAction""User1"">0)then{[player]call CRS_wSafe}"];};
[player]call CRS_safeInit;


CRS_noReload={
params["_display","_dik"];
_block=false;
if(_dik in(actionKeys"nextWeapon"))then{_block=true;};
_block
};


/*
CRS_FL2={waitUntil{!(isNull(findDisplay 46))};
(findDisplay 46)displayRemoveEventHandler["KeyUp",kpFL1];
(findDisplay 46)displayRemoveEventHandler["KeyDown",kpFL2];
kpFL1=(findDisplay 46)displayAddEventHandler["KeyUp","if(inputAction""Headlights"">0)then{[player]call CRS_FL1;};"];};

CRS_FL1={
if(isNull objectParent player)then{
if((currentWeapon player==primaryWeapon player)&&{((primaryWeaponItems player)select 1)!=""})then{playSound"dry";};};
waitUntil{!(isNull(findDisplay 46))};
(findDisplay 46)displayRemoveEventHandler["KeyUp",kpFL1];
(findDisplay 46)displayRemoveEventHandler["KeyDown",kpFL2];
kpFL2=(findDisplay 46)displayAddEventHandler["KeyUp","if(inputAction""Headlights""<2)then{[player]call CRS_FL2;};"];};

CRS_initFL={
waitUntil{!(isNull(findDisplay 46))};
kpFL1=(findDisplay 46)displayAddEventHandler["KeyDown","if(inputAction""Headlights"">0)then{[player]call CRS_FL2;};"];
kpFL2=(findDisplay 46)displayAddEventHandler["KeyUp","if(inputAction""Headlights"">2)then{};"];};
//[player]call CRS_initFL;
*/

//COMBAT DEAFNESS - Explosion is local, need use a different EH!
player addEventHandler["Explosion",{
_unit=_this select 0;
_dmg=damage _unit;
_newDmg=_this select 1;
if(_newDmg>.04)then{
playSound"combat_deafness";
1 fadeSound 0;1 fadeRadio 0;8 fadeSound 1;8 fadeRadio 1;
[]spawn{
_blur=ppEffectCreate["DynamicBlur",474];
_blur ppEffectEnable true;
_blur ppEffectAdjust[0];
_blur ppEffectCommit 0;
waitUntil{ppEffectCommitted _blur};
_blur ppEffectAdjust[10];
_blur ppEffectCommit 0;
_blur ppEffectAdjust[0];
_blur ppEffectCommit 5;
waitUntil{ppEffectCommitted _blur};
_blur ppEffectEnable false;
ppEffectDestroy _blur;};};}];