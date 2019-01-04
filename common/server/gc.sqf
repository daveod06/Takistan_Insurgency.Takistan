if(!isServer)exitWith{};

//_miscFX=["SmokeShell","CraterLong_small","CraterLong","#dynamicsound","#destructioneffects","#track","#particlesource"];//"TimeBombCore"
private _baseVs=[
"B_MRAP_01_hmg_F","B_Heli_Transport_01_F","B_Heli_Transport_03_unarmed_F","B_Heli_Light_01_F","B_Heli_Attack_01_F","B_MBT_01_TUSK_F","I_APC_tracked_03_cannon_F","B_UAV_02_CAS_F","B_Heli_Light_01_armed_F","B_Plane_CAS_01_F",
"CUP_B_HMMWV_M2_GPK_USA","CUP_RG31_M2","CUP_B_UH60M_US","CUP_B_CH47F_USA","CUP_B_M1A2_TUSK_MG_DES_US_Army","CUP_B_M1126_ICV_M2_Desert_Slat","CUP_B_AH64D_AT_USA","CUP_B_AH6J_ESCORT_USA","CUP_B_MH6J_USA","CUP_B_A10_CAS_USA","CUP_B_USMC_MQ9",
"rhsusf_m1025_d_m2","rhsusf_m1025_d_mk19","RHS_UH60M_d","RHS_CH_47F_light","rhsusf_m1a1aimd_usarmy","RHS_M2A2","RHS_AH64D_CS","RHS_MELB_AH6M_L","RHS_MELB_MH6M","RHS_A10"
];
while{true}do{sleep 300;
{if(count units _x==0 && side _x != WEST)then{deleteGroup _x;};}forEach allGroups;//Empty Groups

{if(typeOf _x in _baseVs)exitWith{};if(!canMove _x &&{alive _x}count crew _x==0)then{deleteVehicle _x;};}forEach vehicles;//Empty Immobile Vehicles

{deleteVehicle _x}forEach allMissionObjects"WeaponHolder";};//Items on Ground