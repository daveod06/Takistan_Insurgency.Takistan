passOut=true;private["_random"];
if(isDedicated)exitWith{};
if(!isACE)then{
while{true}do{
if(damage player<0.6)then{
"RadialBlur" ppEffectEnable true;
"RadialBlur" ppEffectAdjust[0,0,0,0];
"RadialBlur" ppEffectCommit 0.3;
sleep 0.4;
"DynamicBlur" ppEffectEnable true;
"DynamicBlur" ppEffectAdjust[0];
"DynamicBlur" ppEffectCommit 0.2;
sleep 0.8;
"RadialBlur" ppEffectEnable false;
"DynamicBlur" ppEffectEnable false;
1 fadeSound 1;1 fadeRadio 1;1 fadeMusic 1;};
if(!alive player)then{
0.2 fadeSound 0;
"RadialBlur" ppEffectEnable true;
"RadialBlur" ppEffectAdjust[0.003,0.03,0,0];
"RadialBlur" ppEffectCommit 0.2;
sleep 0.5;
"DynamicBlur" ppEffectEnable true;
"DynamicBlur" ppEffectAdjust[0.04];
"DynamicBlur" ppEffectCommit 0.2;
sleep 0.6;
1 fadeSound 1;
"RadialBlur" ppEffectEnable false;
"DynamicBlur" ppEffectEnable false;};
waitUntil{damage player>0.6 && alive player};
sleep random 2;
"RadialBlur" ppEffectEnable true;
"RadialBlur" ppEffectAdjust[random 0.05,random 0.5,random 0.5,random 0.03];
"RadialBlur" ppEffectCommit random 2;
sleep random 2+2;
"DynamicBlur" ppEffectEnable true;
"DynamicBlur" ppEffectAdjust[random 4];
"DynamicBlur" ppEffectCommit random 3;
sleep random 3+2;
random 3 fadeSound 0;random 3 fadeRadio 0;random 3 fadeMusic 0;
sleep 2+random 4;
"RadialBlur" ppEffectEnable true;
"RadialBlur" ppEffectAdjust[random 2,random 1,random 3,random 2];
"RadialBlur" ppEffectCommit random 4;
random 5 fadeSound 1;
sleep random 3+2;
if((vehicle player!=player)&&(driver vehicle player==player))then{
"DynamicBlur" ppEffectEnable true;
"DynamicBlur" ppEffectAdjust[random 8];
"DynamicBlur" ppEffectCommit random 6;
sleep random 2;
_random=(round(random 70));
if(_random>35)then{
sleep 2;
random 1 fadeSound 0;
sleep random 5;
"DynamicBlur" ppEffectEnable true;
"DynamicBlur" ppEffectAdjust[random 13];
"DynamicBlur" ppEffectCommit random 3;
random 3 fadeSound 1;};};

if(vehicle player==player)then{
"DynamicBlur" ppEffectEnable true;
"DynamicBlur" ppEffectAdjust[random 15];
"DynamicBlur" ppEffectCommit random 6;
sleep random 4+3;
_random=(round(random 60));
if(_random>15)then{
sleep random 3+1;
random 1 fadeSound 0;
random 1 fadeRadio 0;
random 1 fadeMusic 0;
sleep random 5+3;
"DynamicBlur" ppEffectEnable true;
"DynamicBlur" ppEffectAdjust[random 13];
"DynamicBlur" ppEffectCommit random 3;random 3 fadeSound 1;};};

sleep random 0.3;
"DynamicBlur" ppEffectEnable true;
"DynamicBlur" ppEffectAdjust[random 0.5];
"DynamicBlur" ppEffectCommit random 2.5;
sleep random 2.8+1;
"DynamicBlur" ppEffectEnable true;
"DynamicBlur" ppEffectAdjust[random 8];
"DynamicBlur" ppEffectCommit random 3;

_random=(round(random 100));
if(((_random<5)&&(damage player>0.9)&&(passOut)))then{
if(vehicle player!=player)then{player action["Eject",vehicle player];};
titleText["","BLACK OUT",0.6];
player playMoveNow "Incapacitated";sleep 2;
random 6 fadeSound 0;
random 6 fadeRadio 0;
random 6 fadeMusic 0;
waitUntil{damage player<0.8};
player playMove "IncapacitatedRifle_AmovPpneMstpSrasWrflDnon";
titleText["","BLACK IN",random 8];
random 20 fadeSound 1;};


if(isBleeding player||damage player>0.85)then{
player forceWalk true;
sleep random 3+1;
random 3 fadeSound 0.1;
sleep random 1+1;
player setDamage((damage player)+random 0.03);
"RadialBlur" ppEffectEnable true;
"RadialBlur" ppEffectAdjust[random 0.5,random 0.8,random 0.6,random 0.7];
"RadialBlur" ppEffectCommit random 2;
sleep random 2+1;
random 2 fadeSound 1;
player forceWalk false;};

sleep random 3+1;
"RadialBlur" ppEffectEnable true;
"RadialBlur" ppEffectAdjust[random 0.1,random 0.8,random 0.3,random 0.6];
"RadialBlur" ppEffectCommit random 4;
player setFatigue(getFatigue player+random 0.2); 
sleep random 2+1;
"DynamicBlur" ppEffectEnable true;
"DynamicBlur" ppEffectAdjust[random 6];
"DynamicBlur" ppEffectCommit random 2;
sleep random 2;
random 3 fadeSound 0;
player setFatigue(getFatigue player+random 4*random 8);
"RadialBlur" ppEffectEnable true;
"RadialBlur" ppEffectAdjust[random 0.3,random 0.2,random 1,random 1.7];
"RadialBlur" ppEffectCommit 0.7;
sleep random 2;
random 2 fadeSound 1;
"RadialBlur" ppEffectEnable true;
"RadialBlur" ppEffectAdjust[random 6,random 3,random 5,random 6];
"RadialBlur" ppEffectCommit 0.7;
sleep random 3;
"RadialBlur" ppEffectEnable true;
"RadialBlur" ppEffectAdjust[0,0,0,0];
"RadialBlur" ppEffectCommit 3;

_random=(round(random 30)+1);
if(_random>24)then{
titleText["","BLACK OUT",random 1];
sleep random 2+1;
random 1 fadeSound 0;
player setFatigue(getFatigue player+random 0.4);
"DynamicBlur" ppEffectEnable true;
"DynamicBlur" ppEffectAdjust[random 3];
"DynamicBlur" ppEffectCommit random 2;
sleep random 4;
_fallover=(round(random 30));
if(_fallover>=15)then{
player setUnitPos "down";
sleep random 4;};
sleep random 2;
titleText["","BLACK IN",random 2];};
random 8 fadeSound 1;
sleep random 1;
"RadialBlur" ppEffectEnable true;
"RadialBlur" ppEffectAdjust[random 0.3,random 0.2,random 1,random 1.7];
"RadialBlur" ppEffectCommit 0.7;
sleep 1;
"DynamicBlur" ppEffectEnable true;
"DynamicBlur" ppEffectAdjust[random 1];
"DynamicBlur" ppEffectCommit random 1.5;
if(damage player<0.6)then{
"RadialBlur" ppEffectEnable true;
"RadialBlur" ppEffectAdjust[0,0,0,0];
"RadialBlur" ppEffectCommit 0.4;
sleep 0.4;
"DynamicBlur" ppEffectEnable true;
"DynamicBlur" ppEffectAdjust[0];
"DynamicBlur" ppEffectCommit 0.3;
sleep 0.8;
titleText["","PLAIN",0.1];
"RadialBlur" ppEffectEnable false;
"DynamicBlur" ppEffectEnable false;
1 fadeSound 1;1 fadeRadio 1;1 fadeMusic 1;};};
sleep random 6;};