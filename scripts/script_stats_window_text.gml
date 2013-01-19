typeOfWindow = argument0;
instanceId = argument1;

if (typeOfWindow == "player")
{
    text =  string(instanceId.name)
    +"#--------"
    +"#Dice: "+string(instanceId.dicePool 
        + instanceId.equippedWeaponDicePool
        + instanceId.equippedArmourDicePool)
    +"#DEF: "+ string(instanceId.defense
        + instanceId.equippedWeaponDefense
        + instanceId.equippedArmourDefense)
    +"#DAM: "+string(instanceId.damage
        + instanceId.equippedWeaponDamage
        + instanceId.equippedArmourDamage)
    +"#HP : "+string(instanceId.hitPoints
        + instanceId.equippedWeaponHitPoints
        + instanceId.equippedArmourHitPoints)
    +"/"+string(instanceId.totalHitPoints
        + instanceId.equippedWeaponTotalHitPoints
        + instanceId.equippedArmourTotalHitPoints)
    +"#Moves : "+string(instanceId.actionPoints
        + instanceId.equippedWeaponActionPoints
        + instanceId.equippedArmourActionPoints)
    +"/"+string(instanceId.totalActionPoints
        + instanceId.equippedWeaponTotalActionPoints
        + instanceId.equippedArmourTotalActionPoints)
    +"#Attacks : "+string(instanceId.numberOfAttacks
        + instanceId.equippedWeaponNumberOfAttacks
        + instanceId.equippedArmourNumberOfAttacks)
    +"/"+string(instanceId.totalNumberOfAttacks
        + instanceId.equippedWeaponTotalNumberOfAttacks
        + instanceId.equippedArmourTotalNumberOfAttacks)
    ;
}
else if (typeOfWindow == "item")
{
    text = "SDFSDFSDFS"
            +"#DFSD";
}

draw_set_font(font1);

text_width = string_width(text);
text_height =  string_height(text);

draw_set_color(c_navy);
draw_set_alpha(0.8);
draw_rectangle(x-6,y-6,x+text_width+6,y+text_height+6,false);
draw_set_alpha(1);

draw_set_color(c_lime);
draw_text(x,y,text);
