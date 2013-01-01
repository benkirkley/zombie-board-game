var t; // just making a temporary variable to hold the old value
t=mouse_meet;
mouse_meet = position_meeting(mouse_x,mouse_y,id) // then getting the new one

if t<mouse_meet{ // t will be 0 and mouse_meet 1 if it enters
  // mouse_enter
  statsWindowId = instance_create(mouse.x,mouse.y,obj_bigGrey);
}

if t>mouse_meet{ // t will be 1 and mouse_meet 0 if it leaves
  // mouse_leave
  with (statsWindowId)
            {instance_destroy();}
}
