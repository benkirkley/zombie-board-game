if (destroyStatsWindow == true){
    if instance_exists(obj_bigGrey){ 
        del_a1 = obj_bigGrey.object_index;
        with (del_a1)
            {instance_destroy();}
    }
    destroyStatsWindow = false;
}
