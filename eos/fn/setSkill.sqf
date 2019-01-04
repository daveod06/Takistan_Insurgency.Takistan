_grp=(_this select 0);_skillArray=(_this select 1);_skillSet=server getVariable _skillArray;
{_unit=_x;{_skillValue=(_skillSet select _forEachIndex)+(random .2)-(random .2);
_unit setSkill[_x,_skillValue];} 
forEach['aimingAccuracy','aimingShake','aimingSpeed','spotDistance','spotTime','courage','reloadSpeed','commanding','general'];
if(EOSdmg>1)then{_unit removeAllEventHandlers"HandleDamage";_unit addEventHandler["HandleDamage",{_damage=(_this select 2)*EOSdmg;_damage}];};
[_unit]execVM"eos\fn\randOP4.sqf";
switch(side _unit)do{
case east:{if(random 1<.05)then{_unit addEventHandler["killed","null=[_this]execVM ""core\modules\cacheScript\iDrop.sqf"""];};};
case civilian:{if(random 1<.03)then{null=[_unit]execVM"eos\fn\jihad.sqf";}else{if(random 1<.1)then{null=[_unit]execVM"eos\fn\civGun.sqf";}else{
[_unit,["Get down!",{call civ_getDown}]]remoteExec["addAction",0];
[_unit,["Get up!",{call civ_getUp}]]remoteExec["addAction",0];
[_unit,["Halt!",{call civ_halt}]]remoteExec["addAction",0];
[_unit,["Get out of here!",{call civ_goAway}]]remoteExec["addAction",0];
null=[_unit]execVM"common\server\civ\ask.sqf";};};};};
}forEach(units _grp);