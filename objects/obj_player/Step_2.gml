/// @description Insert description here
// You can write your code in this editor


if(place_meeting(x + velh, y, obj_plat))
{
	while(!place_meeting(x + sign(velh), y, obj_plat))
	{
		x += sign(velh);
	}
	velh = 0;
}


if(place_meeting(x, y + velv, obj_plat))
{
	while(!place_meeting(x, y + sign(velv), obj_plat))
	{
		y += sign(velv);
	}
	velv = 0;
}

if(!place_meeting(x, y, obj_dica)) controlado = false;

x += velh;
//x = clamp(x, 0 + sprite_width/2, room_width - sprite_width/2);
y += velv;
