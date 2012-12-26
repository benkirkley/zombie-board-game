if (destroyStatsWindow == true){
    if instance_exists(obj_statsWindow){ 
        del_a1 = obj_statsWindow.object_index;
        with (del_a1)
            {instance_destroy();}
    }
    destroyStatsWindow = false;
}
