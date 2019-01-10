// common/server/Obj/killVehs.sqf
// (configFile>>"CfgGroups">>"EAST">>"rhs_faction_tv">>"rhs_group_rus_tv_72">>"RHS_T72BAPlatoon")
//common_server_Obj_killVehs_T72_Platoon = (configFile>>"CfgGroups">>"EAST">>"rhs_faction_tv">>"rhs_group_rus_tv_72">>"RHS_T72BAPlatoon");
common_server_Obj_killVehs_use_RHS_T72 = true;

// common/server/gc.sqf
common_server_gc_baseVs = [
"B_MRAP_01_hmg_F","B_Heli_Transport_01_F","B_Heli_Transport_03_unarmed_F","B_Heli_Light_01_F","B_Heli_Attack_01_F","B_MBT_01_TUSK_F","I_APC_tracked_03_cannon_F","B_UAV_02_CAS_F","B_Heli_Light_01_armed_F","B_Plane_CAS_01_F",
"rhsusf_m1025_d_m2","rhsusf_m1025_d_mk19","RHS_UH60M_d","RHS_CH_47F_light","rhsusf_m1a1aimd_usarmy","RHS_M2A2","RHS_AH64D_CS","RHS_MELB_AH6M_L","RHS_MELB_MH6M","RHS_A10",
"OKSVA_BMP2",
"OKSVA_BMP2D",
"OKSVA_BRDM2",
"OKSVA_BRDM2UM",
"OKSVA_GAZ66",
"OKSVA_GAZ66_AP2",
"OKSVA_GAZ66_Ammo",
"OKSVA_IL76",
"OKSVA_MI24P",
"OKSVA_Mi6T",
"OKSVA_Mi8mt",
"OKSVA_Su22",
"OKSVA_Su25SM",
"OKSVA_T72B_1984",
"OKSVA_UAZ",
"OKSVA_UAZ_Open",
"OKSVA_Ural_Fuel"
];

// common/server/veh.sqf
common_server_veh_use_RHS_USF = false;
common_server_veh_use_OKSVA_Soviets = true;
common_server_veh_armed_jeep_1 = "OKSVA_UAZ_Open";
common_server_veh_armed_jeep_2 = "OKSVA_UAZ";
common_server_veh_medium_utility_helicopter = "OKSVA_MI8MT";
common_server_veh_heavy_lift_helicopter = "OKSVA_Mi6A";
common_server_veh_mbt = "OKSVA_T72B_1984";
common_server_veh_ifv = "OKSVA_BMP2";
common_server_veh_attack_heli = "OKSVA_MI24V";
common_server_veh_light_attack_heli = "OKSVA_Mi8MTV3";
common_server_veh_light_recon_heli = "OKSVA_MI8MT";
common_server_veh_cas_jet = "OKSVA_Su25SM";

// eos/fn/fn.sqf
isOKSVA = true;

// common/server/civ/fn.sqf
isLOPTak = true;

// common/client/CAS/CAS.sqf
// common/client/CRS/f/AT.sqf
// common/client/CRS/f/CRS.sqf
// common/server/civ/fn.sqf
// common/server/civ/tCFG.sqf
// common/server/Obj/init.sqf
// common/server/vIED.sqf
// common/server/VRS.sqf

SIDE_INS = WEST;
SIDE_OCCUPIERS = EAST;
SIDE_IND = INDEPENDENT;
