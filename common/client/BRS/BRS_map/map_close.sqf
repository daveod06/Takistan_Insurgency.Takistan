private["_display"];
disableSerialization;
_close=(_this select 0);
_display=uiNamespace getVariable "BRS_RespawnDialog";
if(_close)then{BRS_mapClose=TRUE;
	if(!isNil("_display"))then{
	(_display displayCtrl 42500)ctrlShow FALSE;
	(_display displayCtrl 41000)ctrlShow FALSE;
	(_display displayCtrl 41100)ctrlShow FALSE;
	(_display displayCtrl 41200)ctrlShow FALSE;
	(_display displayCtrl 39650)ctrlShow FALSE;
	(_display displayCtrl 30055)ctrlShow FALSE;
	(_display displayCtrl 30054)ctrlShow TRUE;
	BRS_cam_offset=0;
	BRS_cam attachTo[(vehicle BRS_currentSpawn),[BRS_cam_offset,-5.5,-0],"neck"];};}else{
	(_display displayCtrl 39650)ctrlShow TRUE;
	(_display displayCtrl 30055)ctrlShow TRUE;
	(_display displayCtrl 30054)ctrlShow FALSE;
	BRS_mapClose=FALSE;
	null=[]execVM "common\client\BRS\BRS_map\map_init.sqf";};