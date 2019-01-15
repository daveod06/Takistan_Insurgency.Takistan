// common/server/Obj/killVehs.sqf
// (configFile>>"CfgGroups">>"EAST">>"rhs_faction_tv">>"rhs_group_rus_tv_72">>"RHS_T72BAPlatoon")
//common_server_Obj_killVehs_T72_Platoon = (configFile>>"CfgGroups">>"EAST">>"rhs_faction_tv">>"rhs_group_rus_tv_72">>"RHS_T72BAPlatoon");
common_server_Obj_killVehs_use_RHS_T72 = true;

// common/server/gc.sqf
common_server_gc_baseVs = [
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

isRHSRF = true;

// common/client/CAS/CAS.sqf
// common/client/CRS/f/AT.sqf
// common/client/CRS/f/CRS.sqf
// common/server/civ/fn.sqf
// common/server/civ/tCFG.sqf
// common/server/Obj/init.sqf
// common/server/vIED.sqf
// common/server/VRS.sqf

// common/client/CAS/track.sqf
// common/client/HALO/fn.sqf
// common/client/HALO/HALO.sqf
// common/client/Strobe/strobe.sqf
// onPlayerRespawn.sqf

Tooth_OPFOR_CAS_jet = "RHS_Su25SM_vvs";
Tooth_OPFOR_CAS_jet_default = "O_Plane_CAS_02_F";
Tooth_OPFOR_CAS_pilot = "OKSVA_Pilot_VVS";
Tooth_OPFOR_CAS_pilot_default = "O_Pilot_F";
Tooth_OPFOR_CAS_drone = "O_UAV_02_CAS_F";

Tooth_marker_color_OPFOR = "ColorOpfor";
Tooth_marker_type_plane_OPFOR = "o_plane";

Tooth_jump_helmet_type = "345th_jump_helmet"; // "H_CrewHelmetHeli_B"
Tooth_strobeGear_helmets = ["H_HelmetB_light","H_HelmetB_light_black","H_HelmetB_light_desert","H_HelmetB_light_grass","H_HelmetB_light_sand","H_HelmetB_light_snakeskin"];
Tooth_medic_class_1 = "OKSVA_Medic_MSV";
Tooth_medic_class_2 = "OKSVA_Medic_VDV";

SIDE_INS = INDEPENDENT;
SIDE_OCCUPIERS = EAST;
SIDE_IND = WEST;
SIDE_CIV = CIVILIAN;

SIDE_OCCUPIERS_SOLDIER_CLASS = "SoldierWB";
SIDE_INS_SOLDIER_CLASS = "SoldierGB";
SIDE_IND_SOLDIER_CLASS = "SoldierGB";
SIDE_CIV_SOLDIER_CLASS = "Civilian";
