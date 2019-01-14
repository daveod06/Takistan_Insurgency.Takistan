while{(true)}do{
{if((_x isKindOf SIDE_INS_SOLDIER_CLASS)||(_x isKindOf SIDE_IND_SOLDIER_CLASS))then{
_x removeAllEventHandlers "Fired";
_x addEventHandler["Fired",{if(_this select 1!="PUT")then{_this execVM "common\server\ai\yell.sqf"};}];};
}forEach allUnits-allPlayers;sleep 10;};