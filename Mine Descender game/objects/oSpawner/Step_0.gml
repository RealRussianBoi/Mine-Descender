DelayTimer--;

if (DelayTimer == 0) {

	Empty = false;
	
	for (var i = 0; i < ArrayLen; i++) {
		
		if (Empty == false) {
			var ObsChoice = choose(oDirtPlatforms,oDirtPlatforms,oDirtPlatforms,oFloorTracker);
		} else {
			ObsChoice = choose(oDirtPlatforms,oDirtPlatforms,oDirtPlatforms,oDirtPlatforms);
		}
		
		if (ObsChoice == oFloorTracker) {
			Empty = true;	
		}
		
		if ((i == 5) and (Empty == false)) {
			ObsChoice = oFloorTracker;
			Empty = true;
		}
		
		array_push(ObstacleArray,ObsChoice);
	
	}
	
	var eSpawn = false;
	var spawnAmount = max(1, round(Floor/20));
	amountSpawned = 0;
	
	for (var i = 0; i < ArrayLen; i++) {
		
		tempID = 0;
		
		if (i == 0) {
			
			with(instance_create_layer(x, y, "Obstacles", ObstacleArray[i])) {
				other.tempID = id;	
			}
			
		} else {
			
			with (instance_create_layer(x + x_Shift, y, "Obstacles", ObstacleArray[i])) {
				other.tempID = id;	
			}
			x_Shift += x_ShiftReset;
		}
		
		if (!eSpawn) {
			
			var chance = irandom_range(0,100);
			
			if (ObstacleArray[i] != oFloorTracker) {
					
				if (amountSpawned < spawnAmount) {
					
					if (chance > 74) {
							
						instance_create_layer(tempID.x,tempID.y,"Enemies",oEnemyContainer.Container[irandom(oEnemyContainer.containerSize - 1)]);
						amountSpawned++;
						
				}
			} else {
					
				eSpawn = true;
				
			}
		}
	}	
}
	
	Floor++;
	x_Shift = x_ShiftReset;
	ObstacleArray = [];
	DelayTimer = DelayTimerReset;
	
}

