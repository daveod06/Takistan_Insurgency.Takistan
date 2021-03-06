civTraffic_SilentDebugMode=false;
civTraffic_DebugTextEventArgs=[];
civTraffic_DebugMarkerEventArgs=[];//[name, position, size, direction, shape ("RECTANGLE" or "ELLIPSE"), markerColor, markerText (optional)] or alternatively [name, position, type, markerColor (optional), markerText (optional)]
civTraffic_DeleteDebugMarkerEventArgs=[];//[name]

"civTraffic_DebugTextEventArgs" addPublicVariableEventHandler{civTraffic_DebugTextEventArgs call civTraffic_ShowDebugTextLocal;};
"civTraffic_DebugMarkerEventArgs" addPublicVariableEventHandler{civTraffic_DebugMarkerEventArgs call civTraffic_SetDebugMarkerLocal;};
"civTraffic_DeleteDebugMarkerEventArgs" addPublicVariableEventHandler{civTraffic_DeleteDebugMarkerEventArgs call civTraffic_DeleteDebugMarkerLocal;};

civTraffic_ShowDebugTextAllClients={
	civTraffic_DebugTextEventArgs=_this;
	publicVariable "civTraffic_DebugTextEventArgs";
	civTraffic_DebugTextEventArgs call civTraffic_ShowDebugTextLocal;};

civTraffic_ShowDebugTextLocal={
private["_minutes", "_seconds"];
if(!isNull player)then{
	if(!civTraffic_SilentDebugMode)then{
	player sideChat(_this select 0);};};
_minutes=floor(time/60);
_seconds=floor(time-(_minutes*60));
diag_log((str _minutes+":"+str _seconds)+" Debug: "+(_this select 0));};

civTraffic_SetDebugMarkerLocal={
private["_markerName","_position","_size","_direction","_type","_shape","_markerColor","_markerText"];
private["_marker"];

if(!isNull player)then{
if(!civTraffic_SilentDebugMode)then{
_markerName=_this select 0;
_position=_this select 1;
_markerColor="Default";
_markerText="";

if(count _this==6)then{_size=_this select 2;_direction=_this select 3;_shape=_this select 4;_markerColor=_this select 5;};
if(count _this==7)then{_size=_this select 2;_direction=_this select 3;_shape=_this select 4;_markerColor=_this select 5;_markerText=_this select 6;};
if(count _this==3)then{_type=_this select 2;_shape="ICON";};
if(count _this==4)then{_type=_this select 2;_shape="ICON";_markerColor=_this select 3;};
if(count _this==5)then{_type=_this select 2;_shape="ICON";_markerColor=_this select 3;_markerText=_this select 4;};

//Delete old marker
if([_markerName]call civTraffic_MarkerExists)then{deleteMarkerLocal _markerName;};

//Set new marker
_marker=createMarkerLocal[_markerName,_position];
_marker setMarkerShapeLocal _shape;
_marker setMarkerColorLocal _markerColor;
_marker setMarkerTextLocal _markerText;

if(count _this==6 || count _this==7)then{_marker setMarkerSizeLocal _size;_marker setMarkerDirLocal _direction;};
if(count _this==3 || count _this==4 || count _this==5)then{_marker setMarkerTypeLocal _type;};};};};

civTraffic_SetDebugMarkerAllClients={
	civTraffic_DebugMarkerEventArgs=_this;
	publicVariable "civTraffic_DebugMarkerEventArgs";
	civTraffic_DebugMarkerEventArgs call civTraffic_SetDebugMarkerLocal;};


civTraffic_DeleteDebugMarkerLocal={
private["_markerName"];
_markerName=_this select 0;deleteMarkerLocal _markerName;};

civTraffic_DeleteDebugMarkerAllClients={
	civTraffic_DeleteDebugMarkerEventArgs=_this;
	publicVariable "civTraffic_DeleteDebugMarkerEventArgs";
	civTraffic_DeleteDebugMarkerEventArgs call civTraffic_DeleteDebugMarkerLocal;};