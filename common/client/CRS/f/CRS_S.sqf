//SERVER FUNCTIONS
//"a3\Props_F_Orange\Humanitarian\Garbage\BloodPool_01_Large_F"
CRS_BloodList=["BloodSplatter_01_Large_New_F","BloodPool_01_Medium_New_F","BloodPool_01_Large_New_F","BloodSplatter_01_Medium_New_F","BloodSplatter_01_Small_New_F","BloodSpray_01_New_F"];

CRS_Blood=addMissionEventHandler["EntityKilled",{
private _killed=_this select 0;
_blood=selectRandom CRS_BloodList;
if(_killed isKindOf"Man")then{
private _killedPos=getPosATL _killed;
private _bloodObj=createVehicle[_blood,_killedPos,[],0,"CAN_COLLIDE"];
[_bloodObj]call BIS_fnc_replaceWithSimpleObject;};
}];

//private _blood=createSimpleObject[_bloodList,_killedPos];
CRS_BloodCleanUp={
	while{true}do{
	sleep 300;
	{deleteVehicle _x}forEach allSimpleObjects["BloodSplatter_01_Large_New_F","BloodPool_01_Medium_New_F","BloodPool_01_Large_New_F","BloodSplatter_01_Medium_New_F","BloodSplatter_01_Small_New_F","BloodSpray_01_New_F"];
	};
};
server spawn CRS_BloodCleanUp;