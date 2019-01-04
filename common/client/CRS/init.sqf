#include"CFG.sqf";

CRS_AT=compileFinal preprocessFile"common\client\CRS\f\AT.sqf";
CRS_BB=compileFinal preprocessFile"common\client\CRS\f\BB.sqf";
CRS_BBlasted=compileFinal preprocessFile"common\client\CRS\f\BBlasted.sqf";
CRS_FB=compileFinal preprocessFile"common\client\CRS\f\FB.sqf";
CRS_Flashed=compileFinal preprocessFile"common\client\CRS\f\flashed.sqf";
CRS_Holster=compileFinal preprocessFile"common\client\CRS\f\holster.sqf";
sleep 5;
null=[]execVM"common\client\CRS\f\CRS.sqf";