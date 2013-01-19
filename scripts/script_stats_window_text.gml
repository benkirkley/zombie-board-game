draw_set_color(c_navy);
draw_set_alpha(0.8);
draw_rectangle(x-6,y-6,x+100,y+148,false);
draw_set_alpha(1);

draw_set_font(font1);
draw_set_color(c_lime);
draw_text(x,y,
    string(global.statsWindowPlayerID.name)
    +"#--------"
    +"#Dice: "+string(global.statsWindowPlayerID.dicePool 
        + global.statsWindowPlayerID.equippedWeaponDicePool
        + global.statsWindowPlayerID.equippedArmourDicePool)
    +"#DEF: "+ string(global.statsWindowPlayerID.defense
        + global.statsWindowPlayerID.equippedWeaponDefense
        + global.statsWindowPlayerID.equippedArmourDefense)
    +"#DAM: "+string(global.statsWindowPlayerID.damage
        + global.statsWindowPlayerID.equippedWeaponDamage
        + global.statsWindowPlayerID.equippedArmourDamage)
    +"#HP : "+string(global.statsWindowPlayerID.hitPoints)+"/"+string(global.statsWindowPlayerID.totalHitPoints
        + global.statsWindowPlayerID.equippedWeaponTotalHitPoints
        + global.statsWindowPlayerID.equippedArmourTotalHitPoints)
    +"#Moves : "+string(global.statsWindowPlayerID.actionPoints)+"/"+string(global.statsWindowPlayerID.totalActionPoints
        + global.statsWindowPlayerID.equippedWeaponTotalActionPoints
        + global.statsWindowPlayerID.equippedArmourTotalActionPoints)
    +"#Attacks : "+string(global.statsWindowPlayerID.numberOfAttacks
        + global.statsWindowPlayerID.equippedWeaponNumberOfAttacks
        + global.statsWindowPlayerID.equippedArmourNumberOfAttacks)
    +"/"+string(global.statsWindowPlayerID.totalNumberOfAttacks
        + global.statsWindowPlayerID.equippedWeaponTotalNumberOfAttacks
        + global.statsWindowPlayerID.equippedArmourTotalNumberOfAttacks)
);
