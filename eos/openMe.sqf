EOSspawn=compile preProcessFileLineNumbers "eos\core\EOSlaunch.sqf";null=[]execVM "eos\core\spawn.sqf";onplayerConnected{[]execVM "eos\fn\EOSmkrs.sqf";};
/* EOS 1.98 by BangaBob 
GROUP SIZES
 0=1
 1=2,4
 2=4,8
 3=8,12
 4=12,16
 5=16,20

EXAMPLE CALL - EOS
null=[["MKR1"],[2,1,100],[2,1,100],[1,2,30],[2,60],[2,100],[1,0,10],[1,0,250,SIDE_OCCUPIERS,FALSE,FALSE]]call EOSspawn;
null=[["MKR"],[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY],[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY],[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY],[ARMOURED VEHICLES,PROBABILITY], [STATIC VEHICLES,PROBABILITY],[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY],[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]]call EOSspawn;

EXAMPLE CALL - REINF
null=[["MKR"],[3,1],[2,1],[2],[0,0],[0,0,SIDE_INS,false,false],[10,2,120,TRUE,TRUE]]call reinfSpawn;
null=[["MKR"],[PATROL GROUPS,SIZE OF GROUPS],[LIGHT VEHICLES,SIZE OF CARGO],[ARMOURED VEHICLES],[HELICOPTERS,SIZE OF HELICOPTER CARGO],[FACTION,MARKERTYPE,SIDE,HEIGHTLIMIT,DEBUG],[INITIAL PAUSE, NUMBER OF WAVES, DELAY BETWEEN WAVES, INTEGRATE EOS, SHOW HINTS]]call reinfSpawn;
*/
winColor="colorSIDE_OCCUPIERS";badColor="colorRed";
EOSdmg=1.7;

null=[["pmkr8"],[0,0,0],[2,2,50],[0,0,0],[0,0],[1,25],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//FAR NORTH SIDE_OCCUPIERS MOUNTAIN PATROL #1
null=[["pmkr27"],[0,0,0],[2,2,50],[0,0,0],[1,25],[2,40],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//SHUKURKALAY NORTH PATROL #2
null=[["pmkr6"],[0,0,0],[2,2,50],[0,0,0],[0,0],[0,0],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//CHINARI/MULLADOST PATROL #3
null=[["pmkr18"],[0,0,0],[2,2,50],[1,1,25],[1,25],[1,40],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//MULLADOST/KUSHAB ROAD PATROL #4
null=[["pmkr7"],[0,0,0],[2,2,40],[0,0,0],[0,0],[3,50],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//JABAL AS-SARAJ MOUNTAIN PATROL #5
null=[["pmkr26"],[0,0,0],[2,2,50],[0,0,0],[1,25],[2,40],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//SHUKURKALAY SE VALLEY PATROL #6
null=[["pmkr9"],[0,0,0],[2,2,40],[0,0,0],[0,0],[0,0],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//NUR FOREST PATROL #7
null=[["pmkr12"],[0,0,0],[3,2,50],[0,0,0],[0,0],[1,20],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//AHMADAY MOUNTAIN PATROL #8
null=[["pmkr25"],[0,0,0],[2,2,50],[0,0,0],[0,0],[1,25],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//GURDUR MOUNTAIN PEAK PATROL #9
null=[["pmkr22"],[3,1,50],[3,1,50],[0,0,0],[1,35],[1,25],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//GURDUR MOUNTAIN PEAK PATROL #10
null=[["pmkr15"],[0,0,0],[3,2,50],[0,0,0],[0,0],[1,20],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//SIDE_OCCUPIERS FERUZ ABAD MOUNTAIN PATROL #11
null=[["pmkr29"],[0,0,0],[3,1,50],[0,0,0],[2,25],[2,40],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//SHUKURKALAY SE VALLEY PATROL #12
null=[["pmkr11"],[0,0,0],[3,1,50],[0,0,0],[0,0],[0,0],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//SAHKE MOUNTAIN PATROL #13
null=[["pmkr14"],[0,0,0],[3,2,50],[0,0,0],[0,0],[1,20],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//FERUZ ABAD FACTORY PATROL #14
null=[["pmkr30"],[0,0,0],[3,1,50],[0,0,0],[1,25],[2,40],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//SHUKURKALAY SE VALLEY PATROL #6
null=[["pmkr21"],[0,0,0],[3,2,50],[0,0,0],[2,50],[1,25],[0,0,0],[0,1,600,SIDE_INS,FALSE,FALSE]]call EOSspawn;//NW AIRFIELD PATROL #15
null=[["pmkr10"],[0,0,0],[3,1,50],[0,0,0],[0,0],[0,0],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//SULTANSAFE MOUNTAIN PATROL #16
null=[["pmkr31"],[0,0,0],[3,1,50],[0,0,0],[1,25],[2,40],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//SHUKURKALAY SE VALLEY PATROL #6
null=[["pmkr28"],[0,0,0],[2,2,50],[0,0,0],[0,0],[2,40],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//SHUKURKALAY SE VALLEY PATROL #17
null=[["pmkr17"],[0,0,0],[3,2,50],[1,1,20],[1,30],[1,20],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//BASTAM PATROL #18
null=[["pmkr16"],[0,0,0],[3,2,50],[1,1,20],[1,30],[1,20],[0,0,0],[5,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//CENTRAL MOUNTAIN PATROL #19
null=[["pmkr4"],[0,0,0],[1,2,50],[0,0,0],[0,0],[2,25],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//GURDUR MOUNTAIN PEAK PATROL #20
null=[["pmkr24"],[1,1,50],[2,2,50],[0,0,0],[1,25],[2,25],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//GURDUR MOUNTAIN PEAK PATROL #21
null=[["pmkr33"],[0,0,0],[2,2,50],[0,0,0],[1,20],[2,40],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//SHUKURKALAY SE VALLEY PATROL #12
null=[["pmkr3"],[0,0,0],[3,1,50],[0,0,0],[0,0],[0,0],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//TIMURKALAY VALLEY PATROL #22
null=[["pmkr2"],[0,0,0],[3,1,50],[0,0,0],[0,0],[0,0],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//NARAN DARRE PASS FOREST PATROL #23
null=[["pmkr32"],[0,0,0],[3,1,50],[0,0,0],[0,0],[0,0],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//NARAN DARRE PASS FOREST PATROL #23
null=[["pmkr19"],[0,0,0],[3,2,50],[0,0,0],[0,0],[2,25],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//AQTAPPA MOUNTAIN PATROL #16
null=[["pmkr13"],[0,0,0],[3,2,50],[0,0,0],[0,0],[1,20],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//CHARDARAKHT NORTH MOUNTAIN PATROL #17
null=[["pmkr23"],[0,0,0],[4,1,50],[0,0,0],[0,0],[0,0],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//CHARDARAKHT NORTH MOUNTAIN PATROL #17
null=[["pmkr1"],[0,0,0],[3,1,50],[0,0,0],[0,0],[0,0],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//CHARDARAKHT SOUTH MOUNTAIN PATROL #18
null=[["pmkr5"],[0,0,0],[1,2,50],[0,0,0],[0,0],[0,0],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//GARMSAR FOREST PATROL #19
null=[["pmkr20"],[0,0,0],[3,2,50],[0,0,0],[2,25],[2,25],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;
null=[["pmkr35"],[0,0,0],[3,1,50],[0,0,0],[0,0],[1,25],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;//FAR SIDE_INS MOUNTAIN PATROL #20
null=[["pmkr36"],[0,0,0],[2,1,50],[0,0,0],[0,0],[1,25],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;
null=[["pmkr37"],[0,0,0],[2,2,50],[0,0,0],[1,25],[2,25],[0,0,0],[0,1,700,SIDE_INS,FALSE,FALSE]]call EOSspawn;
null=[["pmkr38"],[0,0,0],[3,2,50],[0,0,0],[2,25],[0,0],[0,0,0],[0,1,1000,SIDE_INS,FALSE,FALSE]]call EOSspawn;
null=[["NW"],[0,0,0],[4,2,75],[2,2,65],[1,40],[0,0],[1,0,25],[0,1,200,SIDE_INS,FALSE,FALSE]]call EOSspawn;//NW
null=[["SW"],[0,0,0],[4,2,75],[2,2,65],[1,40],[0,0],[1,0,25],[0,1,200,SIDE_INS,FALSE,FALSE]]call EOSspawn;//SW
null=[["NE"],[0,0,0],[4,2,75],[2,2,65],[1,40],[0,0],[1,0,25],[0,1,200,SIDE_INS,FALSE,FALSE]]call EOSspawn;//NE
null=[["SE"],[0,0,0],[4,2,75],[2,2,65],[1,40],[0,0],[1,0,25],[0,1,200,SIDE_INS,FALSE,FALSE]]call EOSspawn;//SE
null=[["mkr106"],[7,1,100],[5,1,100],[1,3,25],[1,25],[2,30],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;
null=[["mkr106"],[5,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//(CIV
null=[["mkr45"],[5,1,100],[1,2,100],[1,3,20],[0,0],[1,20],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//036 013
null=[["mkr45"],[3,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//036 013 (CIV) #1
null=[["mkr60"],[7,1,100],[2,2,100],[1,3,25],[2,30],[2,20],[1,0,20],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0055 0265
null=[["mkr60"],[4,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0055 0265 (CIV) #2
null=[["mkr83"],[1,0,100],[2,1,100],[1,1,35],[0,0],[1,30],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//038 092
null=[["mkr83"],[1,0,100],[2,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//038 092 (CIV) #3
null=[["mkr47"],[9,1,100],[2,1,100],[1,3,15],[1,20],[1,20],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//010 032
null=[["mkr47"],[3,0,100],[5,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//010 032 (CIV) #4
null=[["mkr78"],[3,1,100],[2,1,100],[2,3,25],[0,0],[0,0],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//038 092
null=[["mkr78"],[2,0,100],[1,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//038 092 (CIV) #5
null=[["mkr59"],[7,1,100],[2,2,100],[1,3,25],[2,30],[2,20],[1,0,20],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0150 0355
null=[["mkr59"],[5,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0150 0355 (CIV) #6
null=[["mkr23"],[12,1,100],[3,2,100],[1,3,30],[1,30],[2,30],[1,2,30],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0155 0565
null=[["mkr23"],[4,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0155 0565 (CIV) #7
null=[["mkr12"],[15,1,100],[2,3,100],[2,3,30],[2,30],[2,30],[1,0,30],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0185 1165
null=[["mkr12"],[7,0,100],[7,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0185 1165 (CIV) #8
null=[["mkr67"],[9,1,100],[3,2,100],[2,3,25],[1,20],[2,15],[1,0,20],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0200 0765
null=[["mkr67"],[5,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0200 0765 (CIV) #9
null=[["mkr6"],[5,1,100],[5,1,100],[1,1,30],[1,20],[1,30],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//018 003
null=[["mkr6"],[3,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//018 003 (CIV) #10
null=[["mkr22"],[8,1,100],[2,2,100],[1,3,30],[2,30],[2,30],[1,0,10],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//025 050
null=[["mkr22"],[3,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//025 050 (CIV) #11
null=[["mkr112"],[3,1,100],[2,1,100],[0,0,0],[1,25],[1,25],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//North of Nur
null=[["mkr112"],[3,0,100],[2,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//(CIV)
null=[["mkr13"],[4,1,100],[1,1,100],[0,0,0],[0,0],[1,20],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//027 080
null=[["mkr13"],[3,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//027 080 (CIV) #12
null=[["mkr26"],[4,1,100],[1,3,100],[1,2,20],[1,30],[2,25],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//028 009
null=[["mkr26"],[3,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//028 009 (CIV) #13
null=[["mkr63"],[9,1,100],[4,2,100],[2,3,25],[2,25],[2,20],[1,0,25],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0300 0985
null=[["mkr63"],[6,0,100],[6,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0300 0985 (CIV) #14
null=[["mkr7"],[3,1,100],[1,1,100],[0,0,0],[0,0],[0,0],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//030 054
null=[["mkr7"],[3,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//030 054 (CIV) #15
null=[["mkr49"],[5,1,100],[1,1,100],[1,3,10],[0,0],[1,20],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//032 082
null=[["mkr49"],[3,0,100],[5,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//032 082 (CIV) #16
null=[["mkr25"],[7,1,100],[2,1,100],[1,3,30],[1,30],[2,30],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//032 036
null=[["mkr25"],[3,0,100],[2,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//032 036 (CIV) #17
null=[["mkr104"],[1,1,100],[2,1,100],[1,2,25],[1,25],[1,25],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;
null=[["mkr58"],[4,1,100],[1,1,100],[2,3,25],[0,0],[2,15],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//033 038
null=[["mkr58"],[3,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//033 038 (CIV) #18
null=[["mkr75"],[3,1,100],[1,1,100],[0,0,0],[0,0],[0,0],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//038 092
null=[["mkr75"],[4,0,100],[3,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//038 092 (CIV) #19
null=[["mkr44"],[5,1,100],[1,2,100],[1,3,20],[0,0],[1,20],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//036 013
null=[["mkr44"],[3,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//036 013 (CIV) #20
null=[["mkr24"],[8,1,100],[2,1,100],[1,3,30],[0,0],[0,0],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//037 086
null=[["mkr24"],[3,0,100],[5,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//037 086 (CIV) #21
null=[["mkr88"],[5,1,100],[3,1,100],[1,3,30],[1,20],[1,20],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//037 086
null=[["mkr88"],[3,0,100],[5,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//037 086 (CIV) #21
null=[["mkr57"],[6,1,100],[2,2,100],[1,3,25],[1,25],[2,25],[1,0,20],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0700 0450
null=[["mkr57"],[4,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0700 0450 (CIV) #22
null=[["mkr74"],[3,1,100],[2,1,100],[2,3,25],[1,20],[2,15],[1,2,25],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//038 092
null=[["mkr74"],[3,0,100],[5,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//038 092 (CIV) #23
null=[["mkr11"],[8,1,100],[2,2,100],[1,3,20],[1,20],[2,20],[1,2,30],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//042 118
null=[["mkr11"],[3,0,100],[5,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//042 118 (CIV) #24
null=[["mkr72"],[6,1,100],[3,1,100],[1,3,25],[1,10],[2,15],[1,0,25],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0425 1070
null=[["mkr72"],[4,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0425 1070 (CIV) #25
null=[["mkr89"],[2,1,100],[3,1,100],[0,0,0],[1,20],[1,20],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0425 1070
null=[["mkr89"],[1,0,100],[2,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0425 1070 (CIV) #25
null=[["mkr56"],[4,1,100],[1,1,100],[1,3,25],[1,20],[1,25],[1,2,30],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//043 006
null=[["mkr56"],[3,0,100],[5,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//043 006 (CIV) #26
null=[["mkr54"],[4,1,100],[1,1,100],[1,3,25],[0,0],[1,10],[1,2,20],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//044 008
null=[["mkr54"],[2,0,100],[2,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//044 008 (CIV) #27
null=[["mkr71"],[2,1,100],[2,3,100],[2,3,25],[2,10],[1,10],[1,2,30],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0465 0940 #28
null=[["mkr103"],[4,1,100],[2,1,100],[0,0,0],[1,25],[1,25],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;
null=[["mkr103"],[2,0,100],[2,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//(CIV)
null=[["mkr55"],[5,1,100],[2,2,100],[1,3,25],[2,20],[2,25],[1,2,20],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0460 0065
null=[["mkr55"],[3,0,100],[5,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0460 0065 (CIV) #29
null=[["mkr9"],[2,1,100],[1,2,100],[1,3,20],[0,0],[0,0],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//046 123
null=[["mkr9"],[2,0,100],[2,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//046 123 (CIV) #30
null=[["mkr73"],[3,1,100],[1,1,100],[1,3,10],[0,0],[1,15],[1,2,30],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0485 0600
null=[["mkr73"],[3,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0485 0600 (CIV) #31
null=[["mkr21"],[8,1,100],[2,1,100],[1,3,15],[1,20],[1,15],[1,2,20],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//050 054
null=[["mkr21"],[3,0,100],[5,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//050 054 (CIV) #32
null=[["mkr46"],[3,1,100],[1,1,100],[1,3,10],[0,0],[0,0],[1,2,20],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//051 069 #33
null=[["mkr102"],[3,1,100],[2,1,100],[0,0,0],[1,20],[1,10],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;
null=[["mkr102"],[2,0,100],[2,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//(CIV)
null=[["mkr48"],[9,1,100],[2,2,100],[1,3,30],[1,30],[2,30],[1,0,20],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0525 0465
null=[["mkr48"],[4,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0525 0465 (CIV) #34
null=[["mkr50"],[20,0,100],[3,2,100],[2,2,30],[1,35],[2,35],[1,0,25],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0535 0615
null=[["mkr50"],[10,0,100],[7,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0535 0615 (CIV) #35
null=[["mkr35"],[8,1,100],[1,2,100],[1,3,30],[1,20],[1,10],[1,2,30],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//056 099
null=[["mkr35"],[3,0,100],[5,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//056 099 (CIV) #36
null=[["pmkr34"],[6,1,100],[3,2,100],[0,0,0],[2,35],[2,35],[1,0,35],[2,1,200,SIDE_IND,FALSE,FALSE]]call EOSspawn;
null=[["mkr37"],[9,1,100],[2,2,100],[0,0,0],[1,25],[1,10],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//056 093
null=[["mkr37"],[3,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//056 093 (CIV) #37
null=[["mkr38"],[9,1,100],[3,2,100],[1,3,30],[2,50],[2,15],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//057 089
null=[["mkr38"],[8,0,100],[6,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//057 089 (CIV) #38
null=[["mkr76"],[6,1,100],[4,1,100],[2,2,25],[2,35],[2,25],[0,0,0],[0,0,500,SIDE_INS,TRUE,FALSE]]call EOSspawn;//038 #39
null=[["mkr94"],[1,1,100],[2,1,100],[0,0,0],[0,0],[1,15],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;
null=[["mkr18"],[13,1,100],[2,2,100],[1,3,30],[0,0],[1,20],[1,0,20],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0585 0560
null=[["mkr18"],[4,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0585 0560 (CIV) #40
null=[["mkr36"],[6,1,100],[1,1,100],[1,3,20],[0,0],[1,10],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//059 098
null=[["mkr36"],[3,0,100],[5,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//059 098 (CIV) #41
null=[["mkr111"],[5,1,100],[2,1,100],[0,0,0],[1,25],[1,25],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;
null=[["mkr111"],[2,0,100],[2,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//(CIV)
null=[["mkr66"],[6,1,100],[3,2,100],[2,3,25],[1,20],[2,30],[1,0,25],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0585 0725
null=[["mkr66"],[4,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0585 0725 (CIV) #42
null=[["mkr20"],[10,1,100],[2,1,100],[1,3,30],[0,0],[1,15],[1,2,15],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//059 064
null=[["mkr20"],[3,0,100],[5,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//059 064 (CIV) #43
null=[["mkr28"],[8,1,100],[2,2,100],[1,3,30],[1,25],[1,10],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//059 014
null=[["mkr28"],[3,0,100],[5,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//059 014 (CIV) #44
null=[["mkr34"],[10,1,100],[4,1,100],[1,3,25],[0,0],[2,25],[0,0,0],[0,0,400,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0605 1050
null=[["mkr34"],[4,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,400,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0605 1050 (CIV) #45
null=[["mkr53"],[6,1,100],[2,2,100],[1,3,25],[2,20],[2,20],[1,2,25],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0600 0115
null=[["mkr53"],[3,0,100],[5,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,600,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0600 0115 (CIV) #46
null=[["mkr17"],[8,1,100],[2,1,100],[1,3,30],[0,0],[2,20],[1,2,10],[0,0,600,SIDE_INS,TRUE,FALSE]]call EOSspawn;//061 056
null=[["mkr17"],[3,0,100],[5,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//061 056 (CIV) #47
null=[["mkr32"],[10,1,100],[3,1,100],[2,1,30],[2,30],[3,20],[1,0,30],[0,0,300,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0625 1125
null=[["mkr32"],[6,0,100],[6,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,300,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0625 1125 (CIV) #48
null=[["mkr33"],[5,1,100],[2,1,100],[0,0,0],[1,30],[1,20],[0,0,0],[0,0,400,SIDE_INS,TRUE,FALSE]]call EOSspawn;//062 109
null=[["mkr33"],[4,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,400,CIVILIAN,TRUE,FALSE]]call EOSspawn;//062 109 (CIV) #49
null=[["mkr52"],[6,1,100],[2,2,100],[1,3,25],[2,20],[2,20],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0655 0205
null=[["mkr52"],[3,0,100],[5,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0655 0205 (CIV) #50
null=[["mkr86"],[4,1,100],[2,1,100],[1,2,25],[0,0],[2,20],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0655 0205
null=[["mkr86"],[3,0,100],[5,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0655 0205 (CIV) #86
null=[["mkr69"],[2,1,100],[1,1,100],[1,3,25],[1,10],[1,10],[1,2,30],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//067 074
null=[["mkr69"],[3,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//067 074 (CIV) #51
null=[["mkr99"],[4,1,100],[2,1,100],[0,0,0],[1,20],[1,20],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;
null=[["mkr99"],[2,0,100],[2,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//(CIV)
null=[["mkr101"],[1,1,100],[1,2,100],[0,0,0],[0,0],[1,10],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;
null=[["mkr101"],[1,0,100],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//(CIV)
null=[["mkr100"],[4,1,100],[2,1,100],[1,2,20],[1,20],[1,10],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;
null=[["mkr100"],[2,0,100],[2,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//(CIV)
null=[["mkr31"],[7,1,100],[1,3,100],[1,3,25],[1,20],[1,20],[1,0,15],[0,0,500,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0685 1225
null=[["mkr31"],[3,0,100],[5,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0685 1225 (CIV) #52
null=[["mkr108"],[4,1,100],[3,1,100],[1,3,25],[1,25],[2,25],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;
null=[["mkr108"],[3,0,100],[2,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//(CIV
null=[["mkr39"],[6,1,100],[1,2,100],[1,3,15],[0,0],[1,10],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//068 089
null=[["mkr39"],[3,0,100],[5,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//068 089 (CIV) #53
null=[["mkr19"],[8,1,100],[2,1,100],[1,3,30],[0,0],[1,20],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//068 061
null=[["mkr19"],[3,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//068 061 (CIV) #54
null=[["mkr8"],[5,1,100],[3,1,100],[1,1,20],[0,0],[1,20],[0,0,0],[0,0,400,SIDE_INS,TRUE,FALSE]]call EOSspawn;//069 115
null=[["mkr8"],[3,0,100],[5,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,400,CIVILIAN,TRUE,FALSE]]call EOSspawn;//069 115 (CIV) #55
null=[["mkr92"],[3,1,100],[2,1,100],[0,0,0],[1,10],[1,10],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0685 0700
null=[["mkr92"],[2,0,100],[1,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0685 0700 (CIV) #56
null=[["mkr68"],[4,1,100],[1,1,100],[1,3,10],[0,0],[1,10],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0685 0700
null=[["mkr68"],[3,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0685 0700 (CIV) #56
null=[["mkr98"],[3,1,100],[2,1,100],[1,2,10],[1,10],[1,10],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;
null=[["mkr98"],[3,0,100],[2,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//(CIV)
null=[["mkr5"],[4,1,100],[1,1,100],[0,0,0],[1,20],[1,20],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//069 049
null=[["mkr5"],[3,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//069 049 (CIV) #57
null=[["mkr87"],[2,1,100],[2,1,100],[0,0,0],[1,20],[1,20],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//069 049
null=[["mkr87"],[3,0,100],[2,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//069 049 (CIV) #57
null=[["mkr93"],[4,0,100],[3,1,100],[0,0,0],[1,20],[1,20],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//
null=[["mkr93"],[2,0,100],[1,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;// (CIV)
null=[["mkr109"],[3,1,100],[3,1,100],[0,0,0],[1,25],[1,30],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;
null=[["mkr109"],[2,0,100],[1,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//(CIV
null=[["mkr107"],[3,1,100],[5,1,100],[1,3,25],[1,25],[2,25],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;
null=[["mkr107"],[3,0,100],[2,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//(CIV
null=[["mkr2"],[5,1,100],[2,1,100],[0,0,0],[0,0],[0,0],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//079 032
null=[["mkr2"],[5,0,100],[2,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//079 032 (CIV) #58
null=[["mkr15"],[6,1,100],[1,2,100],[1,3,15],[0,0],[1,10],[0,0,0],[0,0,500,SIDE_INS,TRUE,FALSE]]call EOSspawn;//080 029
null=[["mkr15"],[5,0,100],[3,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,500,CIVILIAN,TRUE,FALSE]]call EOSspawn;//080 029 (CIV) #59
null=[["mkr30"],[6,1,100],[3,1,100],[1,3,30],[1,25],[1,25],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0825 0765
null=[["mkr30"],[5,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0825 0765 (CIV) #60
null=[["mkr77"],[3,1,100],[2,1,100],[2,3,25],[0,0],[0,0],[0,0,0],[0,0,175,SIDE_INS,TRUE,FALSE]]call EOSspawn;//038 092
null=[["mkr77"],[5,0,100],[5,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,175,CIVILIAN,TRUE,FALSE]]call EOSspawn;//038 092 (CIV) #61
null=[["mkr1"],[3,1,100],[1,1,100],[0,0,0],[0,0],[0,0],[0,0,0],[0,0,500,SIDE_INS,TRUE,FALSE]]call EOSspawn;//086 030
null=[["mkr1"],[3,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,500,CIVILIAN,TRUE,FALSE]]call EOSspawn;//086 030 (CIV) #62
null=[["mkr95"],[2,1,100],[2,2,100],[0,0,0],[1,10],[2,30],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;
null=[["mkr95"],[2,0,100],[1,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//(CIV)
null=[["mkr91"],[1,1,100],[2,1,100],[0,0,0],[0,0],[1,20],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;
null=[["mkr91"],[1,0,100],[1,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;
null=[["mkr90"],[2,1,100],[2,1,100],[0,0,0],[0,0],[1,20],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;
null=[["mkr90"],[2,0,100],[2,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;
null=[["mkr16"],[12,1,100],[4,1,100],[1,3,30],[0,0],[1,20],[1,2,30],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//089 053
null=[["mkr16"],[6,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//089 053 (CIV) #63
null=[["mkr3"],[3,1,100],[1,1,100],[0,0,0],[0,0],[0,0],[0,0,0],[0,0,500,SIDE_INS,TRUE,FALSE]]call EOSspawn;//090 026
null=[["mkr3"],[3,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,500,CIVILIAN,TRUE,FALSE]]call EOSspawn;//090 026 (CIV) #64
null=[["mkr51"],[8,1,100],[3,2,100],[1,3,30],[1,30],[2,30],[1,0,20],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0915 0665
null=[["mkr51"],[4,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0915 0665 (CIV) #65
null=[["mkr96"],[3,0,100],[2,1,100],[0,0,0],[0,0],[2,30],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;
null=[["mkr96"],[2,0,100],[1,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//(CIV)
null=[["mkr43"],[5,1,100],[1,1,100],[0,0,0],[0,0],[1,25],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0925 0185
null=[["mkr43"],[3,0,100],[5,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0925 0185 (CIV) #66
null=[["mkr70"],[1,1,100],[2,3,100],[1,3,25],[2,10],[1,10],[1,2,25],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//094 100 #67
null=[["mkr62"],[12,0,100],[5,2,100],[2,3,25],[1,30],[2,20],[1,2,30],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//0985 1150
null=[["mkr62"],[8,0,100],[5,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//0985 1150 (CIV) #68
null=[["mkr79"],[2,1,100],[2,2,100],[1,1,25],[0,0],[1,30],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//038 092
null=[["mkr79"],[3,0,100],[3,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//038 092 (CIV) #69
null=[["mkr97"],[5,1,100],[1,1,100],[0,0,0],[1,10],[1,10],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;
null=[["mkr97"],[2,0,100],[2,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//(CIV)
null=[["mkr110"],[2,1,100],[2,1,100],[0,0,0],[1,25],[1,15],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;
null=[["mkr110"],[2,0,100],[0,0,0],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//(CIV)
null=[["mkr4"],[3,1,100],[3,1,100],[0,0,0],[0,0],[0,0],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//099 043
null=[["mkr4"],[2,0,100],[2,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//099 043 (CIV) #70
null=[["mkr40"],[12,1,100],[5,2,100],[2,1,30],[2,35],[2,35],[1,2,25],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//102 024
null=[["mkr40"],[10,0,100],[7,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//102 024 (CIV) #71
null=[["mkr10"],[4,1,100],[2,1,100],[0,0,0],[0,0],[0,0],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//100 064
null=[["mkr10"],[3,0,100],[2,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//100 064 (CIV) #72
null=[["mkr64"],[7,1,100],[4,2,100],[2,3,30],[2,20],[2,20],[1,2,20],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//1050 1105
null=[["mkr64"],[7,0,100],[5,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//1050 1105 (CIV) #73
null=[["pmkr0"],[3,1,100],[2,2,100],[1,3,25],[2,35],[2,35],[1,0,25],[2,1,700,SIDE_IND,FALSE,FALSE]]call EOSspawn;
null=[["mkr65"],[8,1,100],[5,2,100],[2,3,25],[2,35],[2,25],[1,0,35],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//1085 0635
null=[["mkr65"],[6,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//1085 0635 (CIV) #74
null=[["mkr29"],[6,1,100],[2,1,100],[1,3,30],[0,0],[1,10],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//110 025
null=[["mkr29"],[5,0,100],[3,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//110 025 (CIV) #75
null=[["mkr80"],[3,1,100],[2,1,100],[2,3,25],[0,0],[0,0],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//038 092
null=[["mkr80"],[1,0,100],[1,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//038 092 #76
null=[["mkr81"],[3,1,100],[2,1,100],[2,3,25],[0,0],[0,0],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//038 092
null=[["mkr81"],[2,0,100],[1,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//038 092 (CIV) #77
null=[["mkr41"],[7,1,100],[2,1,100],[1,3,30],[0,0],[1,25],[1,1,35],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//115 083
null=[["mkr41"],[3,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//115 083 (CIV) #78
null=[["mkr82"],[2,1,100],[2,1,100],[1,1,25],[0,0],[1,25],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//038 092 #79
null=[["mkr82"],[2,0,100],[2,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//038 092 #79
null=[["mkr14"],[4,1,100],[3,2,100],[1,3,30],[1,20],[1,20],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//1180 0265
null=[["mkr14"],[4,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//1180 0265 (CIV) #80
null=[["mkr82"],[1,1,100],[2,1,100],[1,1,35],[1,30],[1,30],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//038 092
null=[["mkr82"],[1,0,100],[1,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//038 092 (CIV) #81
null=[["mkr84"],[1,1,100],[2,1,100],[1,1,35],[1,10],[1,30],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//119 074
null=[["mkr84"],[1,0,100],[1,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//119 074 (CIV) #84
null=[["mkr85"],[1,1,100],[2,1,100],[1,1,35],[1,10],[1,30],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//120 072
null=[["mkr85"],[1,0,100],[1,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//120 072 (CIV) #85
null=[["mkr42"],[8,1,100],[4,1,100],[1,3,25],[0,0],[1,20],[1,2,25],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//1220 1115
null=[["mkr42"],[7,0,100],[3,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//1220 1115 (CIV) #83
null=[["mkr61"],[5,1,100],[3,2,100],[2,3,25],[1,25],[2,25],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;//1230 1050
null=[["mkr61"],[5,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//1230 1050 (CIV) #84
null=[["mkr105"],[7,1,100],[2,1,100],[0,0,0],[1,25],[2,25],[0,0,0],[0,0,700,SIDE_INS,TRUE,FALSE]]call EOSspawn;
null=[["mkr105"],[4,0,100],[4,0,100],[0,0,0],[0,0],[0,0],[0,0,0],[3,0,700,CIVILIAN,TRUE,FALSE]]call EOSspawn;//(CIV)