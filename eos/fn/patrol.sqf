if !isServer exitWith{};
private["_grp","_dst","_marker"];
_dst=250;
switch(typeName _this)do{
case(typeName grpNull):{_grp=_this};
case(typeName objNull):{_grp=group _this};
case(typeName[]):{
_grp=_this select 0;
if(typeName _grp==typeName objNull)then{_grp=group _grp};
if(count _this>1)then{_marker=_this select 1};};
};
_grp setBehaviour"SAFE";_grp setSpeedMode"LIMITED";_grp setCombatMode"YELLOW";
_grp setFormation(selectRandom["STAG COLUMN","WEDGE","ECH LEFT","ECH RIGHT","VEE","DIAMOND"]);

private["_cnt","_wps","_slack"];
_cnt=4+(floor random 3)+(floor(_dst/100));
_wps=[];
_slack=_dst/5.5;
if(_slack<20)then{_slack=20};

private["_a","_p"];
while{count _wps<_cnt}do{
if(surfaceIsWater(getPos(leader _grp)))then{
_p=[_mkr,true]call SHKpos;}else{_p=[_mkr,true]call SHKpos;};
_wps pushBack _p;};

private["_cur","_wp"];
for "_i" from 1 to(_cnt-1)do{
_cur=(_wps select _i);
_wp=_grp addWaypoint[_cur,0];
_wp setWaypointType"MOVE";
_wp setWaypointCompletionRadius(5+_slack);
[_grp,_i]setWaypointTimeout[0,2,16];
[_grp,_i]setWaypointStatements["true","if((random 3)>2)then{group this setCurrentWaypoint[(group this),(floor(random(count(waypoints(group this)))))];};"];};

private "_wp1";
_wp1=_grp addWaypoint[(_wps select 1),0];
_wp1 setWaypointType"CYCLE";
_wp1 setWaypointCompletionRadius 50;