_plane=_this select 0;
_markerName=format["track%1",random 99999];
_marker=createMarker[_markerName,[0,0,0]];
_markerName setMarkerType Tooth_marker_type_plane_OPFOR;_markerName setMarkerColor Tooth_marker_color_OPFOR;
while{!isNull _plane}do{_markerName setMarkerPos(getPos _plane);sleep 0.5;};
deleteMarker _marker;
