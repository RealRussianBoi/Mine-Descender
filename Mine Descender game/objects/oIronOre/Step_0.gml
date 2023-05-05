direction = point_direction(x,y,oBagIcon.x,oBagIcon.y);
speed = 5;

if (place_meeting(x,y + oBagIcon.sprite_height/2,oBagIcon)) {
	instance_destroy();	
}
