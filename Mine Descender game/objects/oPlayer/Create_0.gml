//Initial Direction
initDirection = 1;
image_xscale = initDirection;

//Jumping and Falling
jumpSpdReset = 3;
jumpSpd = jumpSpdReset;
jumpDurationReset = 20;
jumpDuration = jumpDurationReset;
touchGround = true;
jumpOnce = true;
jump = false;
left = false;
right = false;
fall = true;

//Walking and Sliding
walkSpd = 3;
slideSpd = walkSpd + 2;
slide = false;

//Create Starter Equipment
instance_create_layer(x,y,layer,oPickaxe);

