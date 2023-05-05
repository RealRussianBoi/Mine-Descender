x = oPlayer.x;
y = oPlayer.y - 25;
image_alpha = 0;

if (!oPlayer.left and !oPlayer.right and !oPlayer.jump and !oPlayer.fall) {
	if (place_meeting(oPlayer.x,oPlayer.y,pCollectible)) {
		if (image_angle == -45) {
			with (instance_nearest(x,y,pCollectible)) {
				if (image_index != 5) {
					image_index++;
					other.image_angle = other.initialAngle;
					with(other.id) {
						repeat(10) {
							instance_create_layer(x + lengthdir_x(40,image_angle - 50),y,layer,oPickSmackEffect);	
						}
					}
				}
			}
		} else {
			if (instance_nearest(x,y,pCollectible).image_index != 5) {
				image_alpha = 1;
				image_angle -= 1.5;
			}
		}
		
	} else {
		image_angle = initialAngle;
		image_alpha = 0;	
	}	
} else {
	other.image_angle = other.initialAngle;
	image_alpha = 0;
}
