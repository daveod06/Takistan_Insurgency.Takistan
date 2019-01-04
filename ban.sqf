private _banList=["[Pvt] T.Machado","player","Jadarr","Andrew Halverson"];
if(!local player)exitWith{};if(name player in _banList)then{endMission"End3"};
private _steamProfileUrl="http://steamcommunity.com/profiles/"+(getPlayerUID player);
diag_log format["%1 connected to server.  Steam page/GUID: %2",name player,_steamProfileUrl];