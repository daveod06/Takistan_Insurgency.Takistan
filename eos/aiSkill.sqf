//INFANTRY SKILL
//[aimingAccuracy,aimingShake,aimingSpeed,spotDistance,spotTime,courage,reloadSpeed,commanding,general];
_InfSkillSet=
[
0.3,        // aimingAccuracy
0.1,        // aimingShake
0.1,        // aimingSpeed
0.2,         // spotDistance
0.2,        // spotTime
0.5,        // courage
0.5,        // reloadSpeed
0.5,        // commanding
0.5        // general

];

//ARMOR SKILL
_ArmSkillSet=[
0.2,        // aimingAccuracy
0.2,        // aimingShake
0.2,        // aimingSpeed
0.3,         // spotDistance
0.3,        // spotTime
1.0,        // courage
0.5,        // reloadSpeed
0.8,        // commanding
0.5        // general
];

//LIGHT VEHICLE SKILL
_LigSkillSet=[
0.3,        // aimingAccuracy
0.2,        // aimingShake
0.2,        // aimingSpeed
0.4,         // spotDistance
0.3,        // spotTime
1.0,        // courage
0.5,        // reloadSpeed
0.8,        // commanding
0.5        // general
];

//HELICOPTER SKILL
_AirSkillSet=[
0.25,
0.45,
0.6,
0.4,
0.4,
1.0,
1.0,
1.0,
1.0
];

//STATIC SKILL
_StSkillSet=[
0.1,
0.2,
0.3,
0.4,
0.3,
1.0,
0.5,
1.0,
1.0
];

server setVariable["INFskill",_InfSkillSet];server setVariable["ARMskill",_ArmSkillSet];server setVariable["LIGskill",_LigSkillSet];server setVariable["AIRskill",_AirSkillSet];server setVariable["STskill",_StSkillSet];
