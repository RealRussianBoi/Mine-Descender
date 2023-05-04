
y -= global.UpShift;

if (place_meeting(x,y,oPlayer)) {

	explode = true;	
	
}

if (explode) {

	explodeTimer--;

}

if (explodeTimer == 20) {

} else if (explodeTimer == 40) {
	image_blend = c_red;
} else if (explodeTimer == 60) {
	image_blend = c_red;
} else if (explodeTimer == 80) {
	image_blend = c_red;
} else if (explodeTimer == 100) {
	image_blend = c_red;
} else {
	image_blend = c_white;	
}

if (explodeTimer == 0) {
	
	instance_change(oBasicMineExplosion,true);
	
}