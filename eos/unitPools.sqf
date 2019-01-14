private["_tempArr","_InfPool","_MotPool","_ACHPool","_CHPool","_uavPool","_stPool","_shipPool","_diverPool","_crewPool","_heliCrew","_ArmPool"];
_faction=(_this select 0);
_type=(_this select 1);
_tempArr=[];

switch(_faction==0) do
{ // INSURGENTS
	_InfPool=["LOP_AM_Infantry_Rifleman"];
	_ArmPool=["LOP_AM_BM21","LOP_TKA_T55","LOP_TKA_T34","LOP_AM_Nissan_PKM","LOP_AM_Offroad_M2","LOP_AM_UAZ_DshKM","LOP_AM_UAZ_SPG"];
	_MotPool=["LOP_AM_Landrover","LOP_AM_Offroad","LOP_AM_UAZ","LOP_AM_UAZ_Open","LOP_AM_UAZ_SPG","LOP_AM_UAZ_DshKM","LOP_AM_Nissan_PKM"];
	_ACHPool=["LOP_TKA_Mi8MTV3_FAB"];
	_CHPool=["RHS_Mi8amt_civilian"];
	_uavPool=[];
	_stPool=["LOP_AM_Kord",
        "LOP_AM_Static_DSHKM",
        "LOP_AM_Static_M2",
        "LOP_AM_Static_M2_MiniTripod",
        "LOP_AM_Static_SPG9",
        "LOP_AM_Static_ZU23"];
	_shipPool=[];
	_diverPool=[];
	_crewPool=["LOP_AM_Infantry_Rifleman"];
	_heliCrew=["LOP_AM_Infantry_Rifleman"];
};

if(_faction==1) then
{//SIDE_OCCUPIERS - NATO
    _InfPool=["B_sniper_F","B_Soldier_A_F","B_Soldier_AA_F","B_Soldier_AAA_F","B_Soldier_AAR_F","B_Soldier_AAT_F","B_Soldier_AR_F","B_Soldier_AT_F","B_soldier_exp_F","B_Soldier_F","B_engineer_F","B_medic_F"];	
    _ArmPool=["B_MBT_01_arty_F","B_MBT_01_cannon_F","B_MBT_01_mlrs_F","B_APC_Tracked_01_AA_F","B_APC_Tracked_01_CRV_F","B_APC_Tracked_01_rcws_F","B_APC_Wheeled_01_cannon_F","B_MBT_02_cannon_F"];
    _MotPool=["B_Truck_01_covered_F","B_Truck_01_transport_F","B_MRAP_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_Truck_01_medical_F"];
    _ACHPool=["B_Heli_Attack_01_F","B_Heli_Light_01_armed_F"];
    _CHPool=["B_Heli_Light_01_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_01_F"];
    _uavPool=[];
    _stPool=[];
    _shipPool=[];
    _diverPool=[];
    _crewPool=["B_crew_F"];
    _heliCrew=["B_helicrew_F","B_helipilot_F"];
};

if(_faction==2) then
{//SIDE_IND - AAF
    _InfPool=["LOP_TKA_Infantry_AT",
"LOP_TKA_Infantry_AT_Asst",
"LOP_TKA_Infantry_Corpsman",
"LOP_TKA_Infantry_Engineer",
"LOP_TKA_Infantry_MG",
"LOP_TKA_Infantry_MG_Asst",
"LOP_TKA_Infantry_Marksman",
"LOP_TKA_Infantry_Officer",
"LOP_TKA_Infantry_Rifleman",
"LOP_TKA_Infantry_Rifleman_2",
"LOP_TKA_Infantry_SL",
"LOP_TKA_Infantry_TL"];
    _ArmPool=["LOP_TKA_BMP1",
"LOP_TKA_BMP1D",
"LOP_TKA_BTR60",
"LOP_TKA_T34",
"LOP_TKA_T55"];
    _MotPool=["LOP_TKA_BM21",
"LOP_TKA_UAZ",
"LOP_TKA_UAZ_DshKM",
"LOP_TKA_UAZ_Open",
"LOP_TKA_UAZ_SPG",
"LOP_TKA_Ural",
"LOP_TKA_Ural_open"];
    _ACHPool=["LOP_TKA_Mi8MTV3_FAB"];
    _CHPool=["LOP_TKA_Mi8MT_Cargo"];
    _uavPool=[];
    _stPool=["O_Mortar_01_F",
    "LOP_TKA_Static_AT4",
"LOP_TKA_Static_D30",
"LOP_TKA_Static_DSHKM",
"LOP_TKA_Static_SPG9",
"LOP_TKA_ZU23"];
    _shipPool=[];
    _diverPool=[];
    _crewPool=["LOP_TKA_Infantry_Crewman"];
    _heliCrew=["LOP_TKA_Infantry_Pilot"];
};
if(_faction==3) then
{//SIDE_CIV
    _InfPool=["LOP_Tak_Civ_Man_01",
"LOP_Tak_Civ_Man_02",
"LOP_Tak_Civ_Man_04",
"LOP_Tak_Civ_Man_05",
"LOP_Tak_Civ_Man_06",
"LOP_Tak_Civ_Man_07",
"LOP_Tak_Civ_Man_08",
"LOP_Tak_Civ_Man_09",
"LOP_Tak_Civ_Man_10",
"LOP_Tak_Civ_Man_11",
"LOP_Tak_Civ_Man_12",
"LOP_Tak_Civ_Man_13",
"LOP_Tak_Civ_Man_14",
"LOP_Tak_Civ_Man_15",
"LOP_Tak_Civ_Man_16"];
    _ArmPool=["C_Truck_02_box_F",
"C_Truck_02_covered_F",
"C_Truck_02_fuel_F",
"C_Truck_02_transport_F",
"LOP_TAK_Civ_Landrover",
"LOP_TAK_Civ_Offroad",
"LOP_TAK_Civ_UAZ",
"LOP_TAK_Civ_UAZ_Open",
"LOP_TAK_Civ_Ural",
"LOP_TAK_Civ_Ural_open",
"RHS_Ural_Open_Civ_01",
"RHS_Ural_Civ_01",
"RHS_Ural_Open_Civ_02",
"RHS_Ural_Civ_02",
"RHS_Ural_Open_Civ_03",
"RHS_Ural_Civ_03"];
    _MotPool=["C_Truck_02_box_F",
"C_Truck_02_covered_F",
"C_Truck_02_fuel_F",
"C_Truck_02_transport_F",
"LOP_TAK_Civ_Landrover",
"LOP_TAK_Civ_Offroad",
"LOP_TAK_Civ_UAZ",
"LOP_TAK_Civ_UAZ_Open",
"LOP_TAK_Civ_Ural",
"LOP_TAK_Civ_Ural_open",
"RHS_Ural_Open_Civ_01",
"RHS_Ural_Civ_01",
"RHS_Ural_Open_Civ_02",
"RHS_Ural_Civ_02",
"RHS_Ural_Open_Civ_03",
"RHS_Ural_Civ_03"];
    _ACHPool=["RHS_Mi8amt_civilian"];
    _CHPool=["RHS_Mi8amt_civilian"];
    _uavPool=[];
    _stPool=[];
    _shipPool=[];
    _diverPool=[];
    _crewPool=["LOP_Tak_Civ_Man_01"];
    _heliCrew=["C_man_pilot_F"];
};

if(_type==0) then
{
for"_i"from 0 to 5 do{
_unit=selectRandom _InfPool;
_tempArr pushBack _unit;};
};
if(_type==1)then{_tempArr=_diverPool};
//CREATE ARMOUR & CREW
if(_type==2)then{
_tempUnit=selectRandom _ArmPool;
_tempArr pushBack _tempUnit;
_crew=selectRandom _crewPool;
_tempArr pushBack _crew;};

//CREATE ATTACK CHOPPER & CREW
if(_type==3)then{
_tempUnit=selectRandom _ACHPool;
_tempArr pushBack _tempUnit;
_crew=selectRandom _heliCrew;
_tempArr pushBack _crew;};

//CREATE TRANSPORT CHOPPER & CREW
if(_type==4)then{
_tempUnit=selectRandom _CHPool;
_tempArr pushBack _tempUnit;
_crew=selectRandom _heliCrew;
_tempArr pushBack _crew;};

//CREATE STATIC & CREW
if(_type==5)then{
_tempUnit=selectRandom _stPool;
_tempArr pushBack _tempUnit;
_crew=selectRandom _crewPool;
_tempArr pushBack _crew;};

if(_type==6)then{_tempArr=selectRandom _uavPool;};

//CREATE TRANSPORT & CREW
if(_type==7)then{
_tempUnit=selectRandom _MotPool;
_tempArr pushBack _tempUnit;
_crew=selectRandom _crewPool;
_tempArr pushBack _crew;};

//CREATE BOAT & DIVER CREW
if(_type==8)then{
_tempUnit=selectRandom _shipPool;
_tempArr pushBack _tempUnit;
_crew=selectRandom _diverPool;
_tempArr pushBack _crew;};

//CREATE CARGO
if(_type==9)then{
for"_i"from 0 to 4 do{
_unit=selectRandom _InfPool;
_tempArr pushBack _unit;};
};

//CREATE DIVER CARGO
if(_type==10)then{
for"_i"from 0 to 4 do{
_unit=selectRandom _diverPool;
_tempArr pushBack _unit;};			
};
_tempArr
