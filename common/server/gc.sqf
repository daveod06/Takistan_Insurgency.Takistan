if(!isServer)exitWith{};

//_miscFX=["SmokeShell","CraterLong_small","CraterLong","#dynamicsound","#destructioneffects","#track","#particlesource"];//"TimeBombCore"
private _baseVs=common_server_gc_baseVs; // FIXME
while{true}do{sleep 300;
{if(count units _x==0 && side _x != SIDE_OCCUPIERS)then{deleteGroup _x;};}forEach allGroups;//Empty Groups

{if(typeOf _x in _baseVs)exitWith{};if(!canMove _x &&{alive _x}count crew _x==0)then{deleteVehicle _x;};}forEach vehicles;//Empty Immobile Vehicles

{deleteVehicle _x}forEach allMissionObjects"WeaponHolder";};//Items on Ground
