x = max(0 + sprite_width, x);
x = min(room_width - sprite_width, x);

y -= global.UpShift;
gravity = min(gravity, 8);
speed = min(speed, 8);

kLeft = keyboard_check(ord("A"));
kUp = keyboard_check_pressed(ord("W"));
kRight = keyboard_check(ord("D"));

if (place_meeting(x,y + 1, oDirtPlatforms)) {

	touchGround = true;

} else {

	touchGround = false;
	
}

//Left Direction
if ((place_meeting(mouse_x,mouse_y,oLeftButton) and mouse_check_button(mb_left)) or kLeft) {
	
	left = true;
	initDirection = -1;
	image_xscale = initDirection;
	
	repeat(walkSpd) {
	
		if (place_empty(x + initDirection,y,oDirtPlatforms)) {
			
			x += 1 * initDirection;
			
		}
	}
} else {
	left = false;	
}


//Right Direction
if ((place_meeting(mouse_x,mouse_y,oRightButton) and mouse_check_button(mb_left)) or kRight) {
	
	right = true;
	initDirection = 1;
	image_xscale = initDirection;
	
	repeat(walkSpd) {
		
		if (place_empty(x + initDirection,y,oDirtPlatforms)) {
			
			x += 1 * initDirection;
			
		}
	}
} else {
	right = false;	
}

//Jumping
if (touchGround) {

	if ((place_meeting(mouse_x,mouse_y,oUpButton) and mouse_check_button_pressed(mb_left)) or kUp) {
	
		jumpOnce = false;
		instance_create_layer(x,y + 1, layer, oJumpEffect);
	
	}
}

if (!jumpOnce) {
	
	jumpDuration--;
	touchGround = false;
	
	if (jumpDuration > 0) {
		repeat(jumpSpd) {
	
			if (place_empty(x,y - 1,oDirtPlatforms)) {
				
				sprite_index = sPlayerA;
				image_index = 0;
				image_speed = 0;
				jump = true;
				fall = false;
				y--;
			
			}
		}
	} else {
		
		jump = false;
		
	}
}

if (!jump) {
	
	if (place_empty(x,y + 1,oDirtPlatforms)) {
			
		gravity = 0.5;
		sprite_index = sPlayerA;
		image_index = 1;
		image_speed = 0;
		fall = true;
			
	} else {
		
		fall = false;
		gravity = 0;
		speed = 0;
		touchGround = true;
		jumpDuration = jumpDurationReset;
		jumpOnce = true;
			
		y += lengthdir_y(oPlayer.y - instance_nearest(x,y,oDirtPlatforms).y,90);
		
	}
}



if (left or right) {
	sprite_index = sPlayerR;
	image_speed = 1;
} else if (jump) {
	sprite_index = sPlayerA;
	image_speed = 0;
	image_index = 0;
} else if (!jump and !left and !right) {
	if (place_meeting(x,y + 1, oDirtPlatforms)) {
		sprite_index = sPlayer;
	}
} else if (!jump){
	sprite_index = sPlayerA;
	image_speed = 0;
	image_index = 1;
} 


	
