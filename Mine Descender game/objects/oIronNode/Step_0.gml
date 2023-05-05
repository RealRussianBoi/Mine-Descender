y -= global.UpShift;

if (!done) {
	if (image_index == 5) {
		ds_list_add(oPlayer.lootInv,child);
		instance_create_layer(x,y,"Buttons",oIronOre);
		done = true;
	}
}