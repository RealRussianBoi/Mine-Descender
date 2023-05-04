y -= global.UpShift;

//Lone Platform
if (place_empty(x + sprite_width, y, oDirtPlatforms) and place_empty(x - sprite_width, y, oDirtPlatforms)) {
	
	image_index = 3;
	image_xscale = choose(image_xscale, image_xscale);
	
	if (!done) {
		instance_create_layer(x - (1 + (sprite_width / 2)), y, layer, oEnemyBarrier);
		instance_create_layer(x + (1 + (sprite_width / 2)), y, layer, oEnemyBarrier);
	done = !done;
	}
//Center Platform
} else if (!place_empty(x + sprite_width, y, oDirtPlatforms) and !place_empty(x - sprite_width, y, oDirtPlatforms)) {

	image_index = 1;
	image_xscale = choose(image_xscale, image_xscale);
	
//Left Platform
} else if (!place_empty(x + sprite_width, y, oDirtPlatforms) and place_empty(x - sprite_width, y, oDirtPlatforms)) {
	
	image_index = 0;
	if (!done) {
		instance_create_layer(x - (1 + (sprite_width / 2)), y, layer, oEnemyBarrier);
		done = !done;
	}
//Right Platform
} else if (place_empty(x + sprite_width, y, oDirtPlatforms) and !place_empty(x - sprite_width, y, oDirtPlatforms)) {

	image_index = 2;
	if (!done) {
		instance_create_layer(x + (1 + (sprite_width / 2)), y, layer, oEnemyBarrier);
		done = !done;
	}
	
}