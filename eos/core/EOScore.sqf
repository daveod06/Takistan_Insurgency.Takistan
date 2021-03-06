if(!isServer)exitWith{};
private["_newPos","_cargoType","_vehType","_dGrp","_mkrAGL","_side","_bGroup","_civZone","_fGrp","_fSize","_fGrps","_eGrp","_eGrps","_dGrps","_aMin","_aSize","_aGrps","_aGrp","_bMin","_units","_bSize","_bGrps","_bGrp","_trig","_cache","_grp","_crew","_vehicle","_actCond","_mAN","_mAH","_distance","_mA","_setup","_cGrp","_cSize","_cGrps","_taken","_clear","_enemySide","_faction","_dbug","_n","_eosAct","_eosActv","_mkr","_mPos","_mkrX","_mkrY"];
_mkr=(_this select 0);_mPos=markerPos(_this select 0);
_mkrX=getMarkerSize _mkr select 0;
_mkrY=getMarkerSize _mkr select 1;
_mkrAGL=markerDir _mkr;
_a=(_this select 1);_aGrps=_a select 0;_aSize=_a select 1;_aMin=_aSize select 0;
_b=(_this select 2);_bGrps=_b select 0;_bSize=_b select 1;_bMin=_bSize select 0;
_c=(_this select 3);_cGrps=_c select 0;_cSize=_c select 1;
_d=(_this select 4);_dGrps=_d select 0;_eGrps=_d select 1;_fGrps=_d select 2;_fSize=_d select 3;
_setup=(_this select 5);_faction=_setup select 0;_mA=_setup select 1;_distance=_setup select 2;_side=_setup select 3;
_maxHeight=if(count _setup>4)then{_setup select 4}else{false};
_dbug=if(count _setup>5)then{_setup select 5}else{false};
_cache=if(count _this>6)then{_this select 6}else{false};

if(_side==SIDE_INS)then{_enemySide="EAST";_civZone=false;};
if(_side==SIDE_OCCUPIERS)then{_enemySide="GUER";_civZone=false;};
if(_side==SIDE_IND)then{_enemySide="EAST";_civZone=false;};
if(_side==SIDE_CIV)then{_enemySide="civ";_civZone=true;};
if(_mA==0)then{_mAH=1;_mAN=0.5;};
if(_mA==1)then{_mAH=0;_mAN=0;};
if(_mA==2)then{_mAH=0.5;_mAN=0.5;};

//INITIATE ZONE
_trig=format["EOSTr%1",_mkr];
if(!_cache)then{
	if(_maxHeight)then{
	_actCond="{vehicle _x in thisList && isPlayer _x && (!(objectParent _x isKindOf""Plane""))&&((getPosATL _x)select 2)<100}count playableUnits>0";}else{
	_actCond="{vehicle _x in thisList && isPlayer _x}count playableUnits>0";};
_eosActv=createTrigger["EmptyDetector",_mPos];
_eosActv setTriggerArea[(_distance+_mkrX),(_distance+_mkrY),_mkrAGL,FALSE];
_eosActv setTriggerActivation["ANY","PRESENT",true];
_eosActv setTriggerTimeout[2,2,2,true];
_eosActv setTriggerStatements[_actCond,"",""];
server setVariable[_trig,_eosActv];}else{_eosActv=server getVariable _trig;};

_mkr setMarkerAlpha _mAN;
if(!(getMarkerColor _mkr==winColor))then{_mkr setMarkerColor badColor;};

waitUntil{sleep .2;triggerActivated _eosActv};
if(!(getMarkerColor _mkr=="colorBlack"))then{
	if(!(getMarkerColor _mkr==winColor))then{_mkr setMarkerAlpha _mAH;};

//SPAWN HOUSE PATROLS
for "_counter" from 1 to _aGrps do{
if(isNil "_aGrp")then{_aGrp=[];};
	if(_cache)then{
	_cacheGrp=format["HP%1",_counter];
	_units=_eosActv getVariable[_cacheGrp,0];
	_aSize=[_units,_units];
	_aMin=_aSize select 0;};
		if(_aMin>0)then{
		_aGroup=[_mPos,_aSize,_faction,_side]call EOSspawnGrp;
			if(!surfaceIsWater _mPos)then{0=[_mPos,units _aGroup,_mkrX,0,[0,20],true,true]call SHKfillHouse;}else{0=[_aGroup,_mkr]call EOSpat;};
			_aGrp pushBack _aGroup;
			0=[_aGroup,"INFskill"]call EOSgrpHandlers;};};

//SPAWN PATROLS
for "_counter" from 1 to _bGrps do{
if(isNil "_bGrp")then{_bGrp=[];};
if(_cache)then{
_cacheGrp=format["PA%1",_counter];
_units=_eosActv getVariable[_cacheGrp,0];
_bSize=[_units,_units];
_bMin=_bSize select 0;};
		if(_bMin>0)then{
		_pos=[_mkr,true]call SHKpos;
		_bGroup=[_pos,_bSize,_faction,_side]call EOSspawnGrp;
		0=[_bGroup,_mkr]call EOSpat;
		_bGrp pushBack _bGroup;
		0=[_bGroup,"INFskill"]call EOSgrpHandlers;};};

//SPAWN LIGHT VEHICLES
for "_counter" from 1 to _cGrps do{
if(isNil "_cGrp")then{_cGrp=[];};

_newPos=[_mkr,50]call EOSfindSafePos;
if(surfaceIsWater _newPos)then{_vehType=8;_cargoType=10;}else{_vehType=7;_cargoType=9;};

_cGroup=[_newPos,_side,_faction,_vehType]call EOSspawnV;
if((_cSize select 0)>0)then{
0=[(_cGroup select 0),_cSize,(_cGroup select 2),_faction,_cargoType]call EOSsetCargo;};
0=[(_cGroup select 2),"LIGskill"]call EOSgrpHandlers;
0=[(_cGroup select 2),_mkr]call EOSpat;
_cGrp pushBack _cGroup;};

//SPAWN ARMOURED VEHICLES
for "_counter" from 1 to _dGrps do{
if(isNil "_dGrp")then{_dGrp=[];};
_newPos=[_mkr,50]call EOSfindSafePos;
if(surfaceIsWater _newPos)then{_vehType=8;}else{_vehType=2;};
_dGroup=[_newPos,_side,_faction,_vehType]call EOSspawnV;
0=[(_dGroup select 2),"ARMskill"]call EOSgrpHandlers;
0=[(_dGroup select 2),_mkr]call EOSpat;
_dGrp pushBack _dGroup;};

//SPAWN STATIC PLACEMENTS
for "_counter" from 1 to _eGrps do{
if(surfaceIsWater _mPos)exitWith{};
	if(isNil "_eGrp")then{_eGrp=[];};

_newPos=[_mkr,50]call EOSfindSafePos;
_eGroup=[_newPos,_side,_faction,5]call EOSspawnV;
0=[(_eGroup select 2),"STskill"]call EOSgrpHandlers;
_eGrp pushBack _eGroup;};

//SPAWN CHOPPER
for "_counter" from 1 to _fGrps do{
if(isNil "_fGrp")then{_fGrp=[];};
	if((_fSize select 0)>0)then{_vehType=4}else{_vehType=3};
	_newPos=[(markerPos _mkr),2000,random 360]call BIS_fnc_relPos;
	_fGroup=[_newPos,_side,_faction,_vehType,"fly"]call EOSspawnV;
	_fGrp pushBack _fGroup;

if((_fSize select 0)>0)then{
_cargoGrp=createGroup _side;
0=[(_fGroup select 0),_fSize,_cargoGrp,_faction,9]call EOSsetCargo;
0=[_cargoGrp,"INFskill"]call EOSgrpHandlers;
_fGroup pushBack _cargoGrp;
null=[_mkr,_fGroup,_counter]execVM "eos\fn\Transport.sqf";}else{
_wp1=(_fGroup select 2)addWaypoint[(markerPos _mkr),0];
_wp1 setWaypointSpeed "FULL";_wp1 setWaypointType "SAD";};
0=[(_fGroup select 2),"AirSkill"]call EOSgrpHandlers;};

//SPAWN ALT TRIGGERS
_clear=createTrigger["EmptyDetector",_mPos];
_clear setTriggerArea[_mkrX,_mkrY,_mkrAGL,FALSE];
_clear setTriggerActivation[_enemySide,"NOT PRESENT",true];
_clear setTriggerStatements["this","",""];
_taken=createTrigger["EmptyDetector",_mPos];
_taken setTriggerArea[_mkrX,_mkrY,_mkrAGL,FALSE];
_taken setTriggerActivation["ANY","PRESENT",true];
_taken setTriggerTimeout[1,1,1,true];
_taken setTriggerStatements["{vehicle _x in thisList && isPlayer _x &&((getPosATL _x)select 2)<5}count allUnits>0","",""];
_eosAct=true;
while{_eosAct}do{//IF PLAYER LEAVES THE AREA OR ZONE DEACTIVATED
if(!triggerActivated _eosActv || getMarkerColor _mkr=="colorBlack")exitWith{
sleep 2+random 8;//EXPERIMENT
//CACHE LIGHT VEHICLES
if(!isNil "_cGrp")then{
{_vehicle=_x select 0;_crew=_x select 1;_grp=_x select 2;
	if(!alive _vehicle || {!alive _x}forEach _crew)then{_cGrps=_cGrps-1;};
	{deleteVehicle _x}forEach(_crew);
		if(!(vehicle player==_vehicle))then{{deleteVehicle _x}forEach[_vehicle];};
		{deleteVehicle _x}forEach units _grp;deleteGroup _grp;}forEach _cGrp;};

//CACHE ARMOURED VEHICLES
if(!isNil "_dGrp")then{
{_vehicle=_x select 0;_crew=_x select 1;_grp=_x select 2;
	if(!alive _vehicle || {!alive _x}forEach _crew)then{_dGrps=_dGrps-1;};
	{deleteVehicle _x}forEach(_crew);
		if(!(vehicle player==_vehicle))then{{deleteVehicle _x}forEach[_vehicle];};
		{deleteVehicle _x}forEach units _grp;deleteGroup _grp;}forEach _dGrp;};

//CACHE PATROL INFANTRY
if(!isNil "_bGrp")then{
_n=0;
{_n=_n+1;_units={alive _x}count units _x;_cacheGrp=format["PA%1",_n];
_eosActv setVariable[_cacheGrp,_units];
{deleteVehicle _x}forEach units _x;deleteGroup _x;}forEach _bGrp;};

//CACHE HOUSE INFANTRY
if(!isNil "_aGrp")then{
_n=0;
{_n=_n+1;_units={alive _x}count units _x;_cacheGrp=format["HP%1",_n];
_eosActv setVariable[_cacheGrp,_units];
{deleteVehicle _x}forEach units _x;deleteGroup _x;}forEach _aGrp;};

//CACHE MORTARS			
if(!isNil "_eGrp")then{
{_vehicle=_x select 0;_crew=_x select 1;_grp=_x select 2;
	if(!alive _vehicle || {!alive _x}forEach _crew)then{_eGrps=_eGrps-1;};
	{deleteVehicle _x}forEach(_crew);
		if(!(vehicle player==_vehicle))then{{deleteVehicle _x}forEach[_vehicle];};
		{deleteVehicle _x}forEach units _grp;deleteGroup _grp;}forEach _eGrp;};

//CACHE HELICOPTER TRANSPORT
if(!isNil "_fGrp")then{
{_vehicle=_x select 0;_crew=_x select 1;_grp=_x select 2;_cargoGrp=_x select 3;
	if(!alive _vehicle || {!alive _x}forEach _crew)then{_fGrps=_fGrps-1;};
	{deleteVehicle _x}forEach(_crew);
		if(!(vehicle player==_vehicle))then{{deleteVehicle _x}forEach[_vehicle];};
		{deleteVehicle _x}forEach units _grp;deleteGroup _grp;
			if(!isNil "_cargoGrp")then{
			{deleteVehicle _x}forEach units _cargoGrp;deleteGroup _cargoGrp;};}forEach _fGrp;};
_EOSact=false;};
	if(triggerActivated _clear and triggerActivated _taken and !_civZone)exitWith{//IF ZONE CAPTURED, CHECK FOR ENEMIES
	_cGrps=0;_aGrps=0;_bGrps=0;_dGrps=0;_eGrps=0;_fGrps=0;
	while{triggerActivated _EOSactv && !(getMarkerColor _mkr=="colorBlack")}do{
		if(!triggerActivated _clear)then{_mkr setMarkerColor badColor;_mkr setMarkerAlpha _mAH;}else{
		_mkr setMarkerColor winColor;_mkr setMarkerAlpha _mAN;};//Zone Captured
sleep 1;};
//PLAYER LEFT ZONE
_EOSact=false;};
uiSleep 2;};
deleteVehicle _clear;deleteVehicle _taken;

if(!(getMarkerColor _mkr=="colorBlack"))then{null=[_mkr,[_aGrps,_aSize],[_bGrps,_bSize],[_cGrps,_cSize],[_dGrps,_eGrps,_fGrps,_fSize],_setup,true]execVM "eos\core\EOScore.sqf";}else{_mkr setMarkerAlpha 0;};};