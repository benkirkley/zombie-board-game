if (destroyStatsWindow == true){
    if instance_exists(statsWindowsId){ 
        del_a1 = statsWindowsId;
        with (del_a1)
            {instance_destroy();}
    }
    destroyStatsWindow = false;
}
