InsU={
private["_unit","_unif"];
_unit=_this select 0;_unif=[];
switch(true)do{
case(isLOPTak): 
{
    _unif=[
    "LOP_U_AM_Fatigue_03",
    "LOP_U_AM_Fatigue_03_2",
    "LOP_U_AM_Fatigue_03_4",
    "LOP_U_AM_Fatigue_01_6",
    "LOP_U_AM_Fatigue_01_5",
    "LOP_U_AM_Fatigue_01",
    "LOP_U_AM_Fatigue_02_5"
    ];
};
default{_unif=[
"U_OG_Guerilla2_1",
"U_BG_Guerilla2_2",
"U_BG_Guerilla2_3",
"U_BG_Guerilla3_1",
"U_C_HunterBody_grn",
"U_C_WorkerCoveralls",
"U_OrestesBody",
"U_I_C_Soldier_Bandit_1_F",
"U_I_C_Soldier_Bandit_2_F",
"U_I_C_Soldier_Bandit_3_F",
"U_I_C_Soldier_Bandit_4_F",
"U_I_C_Soldier_Bandit_5_F",
"U_I_C_Soldier_Para_5_F",
"U_C_Mechanic_01_F"];};};
removeUniform _unit;_unit forceAddUniform(selectRandom _unif);};
InsV={
private["_unit","_vests"];
_unit=_this select 0;_vests=[];
switch(true)do{
case(isLOPTak):
{
    _vests=[
    "LOP_6sh46",
    "345th_RD_webbing",
    "rhs_vydra_3m",
    "rhsgref_alice_webbing"
    ];
};
default{_vests=[
"V_TacChestrig_cbr_F",
"V_TacChestrig_grn_F",
"V_TacChestrig_oli_F",
"V_BandollierB_khk",
"V_BandollierB_cbr",
"V_LegStrapBag_black_F",
"V_LegStrapBag_coyote_F",
"V_Chestrig_khk",
"V_Chestrig_oli",
"V_HarnessO_brn",
"V_LegStrapBag_coyote_F"];};};
_unit addVest(selectRandom _vests);};
CivV={
private["_unit","_cVest"];
_unit=_this select 0;_cVest=[];
switch(true)do{
case(isLOPTak):
{
    _cVests=[
    ];
    _unit addVest(selectRandom _cVest);
};
default{removeVest _unit;};};};
InsH={
private["_unit","_hat"];
_unit=_this select 0;_hat=[];
switch(true)do{
case(isLOPTak):
{
    _hat=[
    "LOP_H_Pakol",
    "LOP_H_Turban",
    "LOP_H_Turban_mask",
    "LOP_H_Shemag_BLK"
    ];
    removeHeadgear _unit;_unit addHeadgear(selectRandom _hat);
};
default{_hat=["H_Shemag_olive","H_Shemag_khk","H_Shemag_tan","H_ShemagOpen_khk","H_ShemagOpen_tan","H_Bandanna_gry"];removeHeadgear _unit;_unit addHeadgear(selectRandom _hat);};};};
InsG={
private["_unit","_gogg"];
_unit=_this select 0;_gogg=[];
switch(true)do{
case(isLOPTak):{removeGoggles _unit;};
default{_gogg=["G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_oli","G_Bandanna_tan"];_unit addGoggles(selectRandom _gogg);};};};
InsF={
private["_unit"];
_unit=_this select 0;
FList=selectRandom["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03","GreekHead_A3_03"];
[_unit,FList]remoteExec["setFace",0,true];};
InsW={
private["_unit"];
_unit=_this select 0;
switch(true)do{
case(isLOPTak):{
if(round(random 4)==1)then{_unit addBackpackGlobal"rhs_rpg_empty";sleep 1;_unit addMagazine"rhs_rpg7_PG7VL_mag";_unit addMagazine"rhs_rpg7_PG7VL_mag";_unit addWeaponGlobal"rhs_weap_rpg7";};
switch(round(random 10))do{
case 0:{_unit addMagazines["rhs_30Rnd_762x39mm_tracer",6];_unit addMagazines["rhs_VOG25",2];_unit addWeaponGlobal"rhs_weap_akm_gp25";};
case 1:{_unit addBackpackGlobal "rhsgref_wdl_alicepack"; _unit addMagazines["rhs_100Rnd_762x54mmR_green",4];_unit addWeaponGlobal"rhs_weap_pkm";};
case 2:{_unit addMagazines["rhs_30Rnd_545x39_AK_green",6];_unit addWeaponGlobal"rhs_weap_ak74";};
case 3:{_unit addMagazines["rhs_30Rnd_762x39mm_tracer",6];_unit addWeaponGlobal"rhs_weap_akms";};
case 4:{_unit addBackpackGlobal "RD_54_69"; _unit addMagazines["rhs_10Rnd_762x54mmR_7N1",5];_unit addWeaponGlobal"40th_weap_svd_wood";};
case 5:{_unit addMagazines["rhs_30Rnd_762x39mm_tracer",6];_unit addWeaponGlobal"rhs_weap_akm";};
case 6:{_unit addMagazines["rhs_30Rnd_762x39mm_tracer",6];_unit addWeaponGlobal"hlc_rifle_ak47";};
case 7:{_unit addBackpackGlobal "RD_54_69"; _unit addMagazines["hlc_75Rnd_762x39_m_rpk",4];_unit addWeaponGlobal"hlc_rifle_rpk";};
case 8:{_unit addMagazines["rhsgref_5Rnd_762x54_m38",10];_unit addWeaponGlobal"rhs_weap_m38";};
case 9:{_unit addMagazines["rhsgref_10Rnd_792x57_m76",10];_unit addWeaponGlobal"rhs_weap_m76";_unit addPrimaryWeaponItem "rhs_acc_nita";};
case 10:{_unit addMagazines["rhs_30Rnd_762x39mm",6];_unit addWeaponGlobal"rhs_weap_m70b1";};};};
//case(isCUPW):{
//if(round(random 4)==1)then{_unit addBackpackGlobal"CUP_B_RPGPack_Khaki";sleep 1;_unit addMagazine"RPG7_F";_unit addMagazine"RPG7_F";_unit addWeaponGlobal"launch_RPG7_F";};
//switch(round(random 6))do{
//case 0:{_unit addMagazines["CUP_30Rnd_762x39_AK47_M",5];_unit addWeaponGlobal"CUP_arifle_AK47";_unit addMagazines["CUP_20Rnd_B_765x17_Ball_M",3];_unit addWeaponGlobal"CUP_hgun_SA61";};
//case 1:{_unit addMagazines["CUP_30Rnd_545x39_AK_M",5];_unit addMagazines["CUP_1Rnd_HE_GP25_M",2];_unit addWeaponGlobal"CUP_arifle_AK74_GL";};
//case 2:{_unit addMagazines["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",3];_unit addWeaponGlobal"CUP_lmg_PKM";};
//case 3:{_unit addMagazines["CUP_30Rnd_545x39_AK_M",5];_unit addWeaponGlobal"CUP_arifle_AKS74";};
//case 4:{_unit addMagazines["CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M",4];_unit addWeaponGlobal"CUP_RPK_74";};
//case 5:{_unit addMagazines["CUP_10x_303_M",5];_unit addWeaponGlobal"CUP_LeeEnfield";};
//case 6:{_unit addMagazines["CUP_30Rnd_762x39_AK47_M",5];_unit addWeaponGlobal"CUP_arifle_AKM";};};};
default{if(round(random 4)==1)then{_unit addBackpackGlobal"B_Messenger_Coyote_F";sleep 1;_unit addMagazine"RPG7_F";_unit addMagazine"RPG7_F";_unit addWeaponGlobal"launch_RPG7_F";};
switch(round(random 5))do{
case 0:{_unit addMagazines["30Rnd_762x39_Mag_Green_F",5];_unit addWeaponGlobal"arifle_AK12_F";_unit addMagazines["10Rnd_9x21_Mag",3];_unit addWeaponGlobal"hgun_Pistol_01_F";};
case 1:{_unit addMagazines["30Rnd_762x39_Mag_Green_F",5];_unit addMagazines["1Rnd_HE_Grenade_shell",2];_unit addWeaponGlobal"arifle_AK12_GL_F";};
case 2:{_unit addMagazines["150Rnd_762x54_Box_Tracer",3];_unit addWeaponGlobal"LMG_Zafir_F";};
case 3:{_unit addMagazines["30Rnd_762x39_Mag_Green_F",6];_unit addWeaponGlobal"arifle_AKM_F";};
case 4:{_unit addMagazines["30Rnd_545x39_Mag_Green_F",6];_unit addWeaponGlobal"arifle_AKS_F";};
case 5:{_unit addMagazines["10Rnd_762x54_Mag",5];_unit addWeaponGlobal"srifle_DMR_01_F";};};};
};sleep 1;_unit addMagazine"HandGrenade";_unit addItem"FirstAidKit";_unit addMagazine"SmokeShell";_unit linkItem"ItemRadio";};
InsAI={
private["_unit"];
_unit=_this select 0;
sleep 8;
_unit enableSimulationGlobal true;
sleep 1;
_unit enableAI"teamSwitch";
sleep 3;
_unit enableAI"anim";
sleep 5;
_unit enableAI"fsm"; 
sleep 5;
_unit enableAI"checkVisible";
sleep 2;
_unit enableAI"path";
sleep 2;
_unit enableAI"move";
sleep 2;
_unit enableAI"suppression";_unit enableAI"cover";
sleep 1.5;
_unit enableAI"aimingError";_unit enableAI"weaponAim";
sleep 1.5;
_unit enableAI"target";_unit enableAI"autoTarget";
sleep 1;
_unit enableAI"autoCombat";_unit allowDamage true;};
