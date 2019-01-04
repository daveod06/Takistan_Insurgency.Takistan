MaxD=700;//Max distance allowed between JTAC and target
Alock=true;
num=99;
disableBomb=[""];//"NONE"
restrictedZones=[noCAS];
CASarray=["P4"];
if !(vehicleVarName player=="P4")exitWith{};
waitUntil{!isNull player};waitUntil{player==player};
abortCAS=false;
waitCAS=false;
doSnap=false;
firstRun=true;
onKeyPress=compile preprocessFile "common\client\CAS\snap.sqf";
[MaxD,Alock,num]execVM "common\client\CAS\addAction.sqf";