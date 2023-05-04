other.tempID = id;

y -= global.UpShift;

if (paused == true) {
	
	pause--;
	sprite_index = sEnemyTick;
	
	if (pause == 0) {
		
		initDirection = -initDirection;
		x += initDirection * 20;
		pause = pauseReset;
		paused = false; 
		walkSpd = 2 * initDirection;
	
	}

} else {
	
	sprite_index = sEnemyTickR;
	image_xscale = initDirection;
	x += walkSpd;

}

