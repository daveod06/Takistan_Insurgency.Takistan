//FUNCTION: Civilian begins to pray
pray={private _civ=_this select 0;
	sleep 5;
	private _mat=createVehicle["Land_Carpet_EP1",getPosATL _civ,[],0,"can_collide"];_mat enableSimulation false;
	_mat setPos(_civ getPos[1,getDir _civ]);_mat setDir(getDir _civ);
	sleep 2;
	for "_x" from 1 to 10 do {
	_civ playMove"AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon";
	sleep 5;
	_civ setUnitPos"UP";
	sleep 5;
	_civ playMove"AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon";
	sleep 5;};
	_civ playMove"";
};


//FUNCTION: Play the Call to Prayer audio file and delete object playing it, for synchronized end of sound
ctpAudio={
private _ctpSFX=createVehicle["Land_ClutterCutter_small_F",[getPosATL(_this select 0)select 0,getPosATL(_this select 0)select 1,(getPosATL(_this select 0)select 2)+5],[],0,""];
[_ctpSFX,["adhan",1000,1]]remoteExec["say3D",0,true];
private _prayers=_ctpSFX nearEntities[SIDE_CIV_SOLDIER_CLASS,200];
{
	if(_x isKindOf"C_Man_1")then{
	if(isPlayer _x || side _x!=SIDE_CIV)exitWith{};
	private _civ=_x;
	if(count waypoints _civ>0)then{{deleteWaypoint((waypoints _civ)select 0);}forEach waypoints _civ;};doStop _civ;
	sleep .5;
	_x reveal _ctpSFX;_x lookAt _ctpSFX;_x doWatch _ctpSFX;
	[_x]spawn pray;
	};
}forEach _prayers;
sleep 205;
private _rugs=nearestObjects[_ctpSFX,["Land_Carpet_EP1"],300];
deleteVehicle _ctpSFX;sleep 5;{deleteVehicle _x}forEach _rugs;
sleep 3;
//{_x doMove (somewhere)}forEach _prayers;
};

ctp={
//ARRAYS: Lists of all minaret / mosque classnames
_minarets=nearestObjects[server,["Land_A_Minaret_EP1","Land_A_Minaret_Porto_EP1","Land_R_Minaret","Land_A_Mosque_big_minaret_1_EP1","Land_A_Mosque_big_minaret_2_EP1"],8000];
_mosque=nearestObjects[server,["Land_A_Mosque_big_hq_EP1"],8000];_mosque=_mosque select 0;

//Play on all undestroyed minarets
{if(alive _x)then{[_x]spawn ctpAudio;};}forEach _minarets+[_mosque];

//Delete sound from destroyed minaret
{if(alive _x)then{
	_x addMPEventHandler["MPKilled",{
	_ctpSnd=nearestObjects[getPosATL(_this select 0),["Land_ClutterCutter_small_F"],6];
	if(count _ctpSnd>0)then{
		_ctpSnd=_ctpSnd select 0;
		deleteVehicle _ctpSnd;};
		(_this select 0)removeAllMPEventHandlers"MPKilled";}];};
}forEach _minarets+[_mosque];
};
sleep 1;


//Prayer times taken from Kandahar, Afghanistan
if(isServer)then{
if(dayTime!=5.4)then{waitUntil{(dayTime>=5.4&&{dayTime<=5.5})};[]spawn ctp;};//5:26
if(dayTime!=6.9)then{waitUntil{(dayTime==6.9&&{dayTime<=7})};[]spawn ctp;};//6:52
if(dayTime!=11.9)then{waitUntil{(dayTime==11.9&&{dayTime<=12})};[]spawn ctp;};//11:58
if(dayTime!=14.6)then{waitUntil{(dayTime==14.6&&{dayTime<=14.7})};[]spawn ctp;};//14:45
if(dayTime!=17)then{waitUntil{(dayTime==17&&{dayTime<=17.5})};[]spawn ctp;};//17:03
if(dayTime!=18.5)then{waitUntil{(dayTime==18.5&&{dayTime<=19})};[]spawn ctp;};//18:30
};
