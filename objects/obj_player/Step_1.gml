/// @description Insert description here
// You can write your code in this editor

if(iniciado)
{
	velh = velh_inicial;
	velv = velv_inicial;
	iniciado = false;
}


var temp = place_meeting(x, y + 1, obj_plat);

if(temp && !chao)
{
	xscale = 1.6;
	yscale = .5;
	
	for(var i = 0; i < irandom_range(4, 10); i++)
	{
		var xx = random_range(x - sprite_width, x + sprite_width);
		instance_create_layer(xx, y, "particulas", obj_vel);
	}
}
