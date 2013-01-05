


if (destroyStatsWindow == true){
    if instance_exists(obj_stats_window){ 
        del_a1 = obj_stats_window.object_index;
        with (del_a1)
            {instance_destroy();}
    }
    destroyStatsWindow = false;
}
