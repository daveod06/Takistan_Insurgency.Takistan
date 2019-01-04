if(!isServer)exitWith{};
private["_cargoPool","_emptySeats","_vehicle","_dbug","_grp","_grpSize"];
_vehicle=(_this select 0);
_grpSize=(_this select 1);
_grp=(_this select 2);
_faction=(_this select 3);
_cargoType=(_this select 4);
_cargoPool=[_faction,_cargoType]call EOSgetUnitPool;
_side=side(leader _grp);
_emptySeats=_vehicle emptyPositions"cargo";
_grpMin=_grpSize select 0;
_grpMax=_grpSize select 1;
_d=_grpMax-_grpMin;		
_r=floor(random _d);
_grpSize=_r+_grpMin;
if(_emptySeats>0)then{
if(_grpSize>_emptySeats)then{_grpSize=_emptySeats};
for "_x" from 1 to _grpSize do{
_unit=selectRandom _cargoPool;
_unit=_grp createUnit[_unit,[0,0,0],[],0,"can_collide"];
_unit enableSimulationGlobal false;_unit allowDamage false;_unit hideObjectGlobal true;_unit disableAI"ALL";_unit setBehaviour"CARELESS";_unit setSpeaker"NoVoice";_unit disableConversation true;_unit enableMimics false;_unit enableStamina false;};
{_x moveInCargo _vehicle}forEach units _grp;};