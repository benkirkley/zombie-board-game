if (resolveCombat == true ) {
    resolveCombat = false;
    script_combatPerform(id,dicePool,defense,attack,hitPoints,damage);
}

if ( hitPoints <= 0 ) {
    with (id) instance_destroy();
}
