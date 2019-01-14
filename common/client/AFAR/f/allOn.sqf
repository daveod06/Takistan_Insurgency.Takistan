switch(side player)do{
case SIDE_OCCUPIERS:{r_PS=SIDE_OCCUPIERS_SOLDIER_CLASS};
case SIDE_INS:{r_PS=SIDE_INS_SOLDIER_CLASS};
case SIDE_IND:{r_PS=SIDE_IND_SOLDIER_CLASS};
case SIDE_IND:{r_PS=SIDE_IND_SOLDIER_CLASS};
case SIDE_CIV:{r_PS=SIDE_CIV_SOLDIER_CLASS};};
{_x enableChannel false}count[0,1];5 enableChannel r_dCH;
if("ItemRadio"in assignedItems player)then{3 enableChannel r_grCH;
if(leader(group(vehicle player))==player)then{2 enableChannel r_cCH;}else{2 enableChannel false;};
if(isNull objectParent player)then{4 enableChannel false;}else{4 enableChannel r_vCH;};
player call r_RTO;};
