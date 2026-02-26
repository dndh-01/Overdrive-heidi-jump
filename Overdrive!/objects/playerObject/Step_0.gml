x_speed = 0;  
y_speed += .25;

if keyboard_check(vk_right) { 

    x_speed = walk_speed;
	image_xscale = -1;

} else if keyboard_check(vk_left) { 

    x_speed = -walk_speed;
	image_xscale = 1;
}

if (place_meeting(x, y + 1, solidObject)) { // if heidi is on the ground

    if (keyboard_check_pressed(vk_up)) { // and the up arrow key is pressed

        y_speed = -3.85; // make heidi jump by setting her y_speed to a negative value

    } else { // otherwise, if heidi is on the ground but not jumping

        y_speed = 0; // set her y_speed to 0 so she doesn't fall through the ground

    }

}

if (place_meeting(x, y, spikeObject)) { // if heidi collides with the spikes

    room_restart() // restart the level

}

if (y > room_height or y < 0 or x > room_width or x < 0) { // if the player is outside of the room

    room_restart(); 

}

if (place_meeting(x, y, flagObject )) { // if heidi collides with the spikes

    room_restart() // restart the level
	
}

move_and_collide(x_speed, y_speed, solidObject);

//if (place_meeting(x,y, SpikeEndObject)){
	
if (!has_won && place_meeting(x, y, SpikeEndObject))
{
    has_won = true;
    level += 1;
    show_message("YOU WIN! You are now level " + string(level));
}
