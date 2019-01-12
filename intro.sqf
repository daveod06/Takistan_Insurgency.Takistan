if(isDedicated)exitWith{};
if(hasInterface)then{
private["_cam","_camX","_camY","_camZ","_object"];
titleText["<t size='4' shadow='2'>T A K I S T A N   I N S U R G E N C Y</t>","BLACK IN",9999,true,true];
waitUntil{!(isNull player)};
sleep .2;
playSound"intro";
_object=camObj;
_camX=getPosATL _object select 0;
_camY=getPosATL _object select 1;
_camZ=getPosATL _object select 2;
_cam="camera" camCreate[_camx-1,_camy+0,_camz+0];
_cam camSetTarget _object;
_cam cameraEffect["Internal","Back"];
_cam camCommit 0;
sleep 3.5;
titleText["<t size='1.5' shadow='2'>Eliminate Mujahideen rebels and find intel to destroy caches in <t color='#ff0000'>RED</t> grid squares.</t>","BLACK IN",10,true,true];
sleep 10;
_cam cameraEffect["Terminate","Back"];
camDestroy _cam;};
if((!isACE)&&(!isTFAR)&&(!isACRE))then{
hintSilent parseText format[
"<t color='#f4c542' size='2' shadow='2'>WELCOME!</t><br/>
Head to the weapon racks under the camo net by the mess hall for your loadout...<br/><br/>
______________<br/>
• 'H' key to holster weapon<br/>
• Set an in-game PUSH TO TALK key<br/>
• Raise your VON / Microphone volumes"];}else{
hintSilent parseText format["<t color='#f4c542' size='2' shadow='2'>WELCOME!</t><br/>
Head to the weapon racks under the camo net by the mess hall for your loadout..."];};
