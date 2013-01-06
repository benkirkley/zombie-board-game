draw_set_color(c_navy);
draw_set_alpha(0.8);
draw_rectangle(x-6,y-6,x+100,y+148,false);
draw_set_alpha(1);

draw_set_font(font1);
draw_set_color(c_lime);
draw_text(x,y,
    string(global.statsWindowPlayerID.name)
    +"#--------"
    +"#Dice: "+string(global.statsWindowPlayerID.dicePool)
    +"#DEF: "+string(global.statsWindowPlayerID.defense)
    +"#DAM: "+string(global.statsWindowPlayerID.damage)
    +"#HP : "+string(global.statsWindowPlayerID.hitPoints)+"/"+string(global.statsWindowPlayerID.totalHitPoints)
    +"#Moves : "+string(global.statsWindowPlayerID.actionPoints)+"/"+string(global.statsWindowPlayerID.totalActionPoints)
    +"#Attacks : "+string(global.statsWindowPlayerID.numberOfAttacks)+"/"+string(global.statsWindowPlayerID.totalNumberOfAttacks)
);
