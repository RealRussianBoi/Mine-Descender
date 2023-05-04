image_xscale = 2;
image_yscale = image_xscale;

done = false;

repeat(1) {
	
	var obj = choose(oVines,oGrass);
	with (instance_create_layer(irandom_range(x - sprite_width/3, x + sprite_width/3), y, layer, obj)) {
		
		owner = other.id;
		depth -= irandom_range(-1,1);
		
	}

}