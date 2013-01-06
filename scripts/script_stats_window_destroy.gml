    if (statsWindowsId)
    {   
        with (statsWindowsId) {instance_destroy();}
        statsWindowsId = 0;
    }
