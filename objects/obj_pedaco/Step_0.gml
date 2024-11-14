/// @description Insert description here
// You can write your code in this editor

if(timer > 0) timer--;
else voltar = true;

if(voltar && !voltei)
{
	speed = 0;
	image_angle = point_direction(x, y, dest_x, dest_y);
	
	x += lengthdir_x(vel, image_angle);
	y += lengthdir_y(vel, image_angle);
	
	if(abs(x - dest_x) < 5 && abs(y - dest_y) < 5)
	{
		voltei = true;
	}
}

if(criador && voltei)
{
	
	if(instance_exists(obj_pedaco))
	{
		for(var i = 0; i < array_length_1d(lista) - 1; i++)
		{
			if(lista[i].voltei == false)
			{
				destruir = false;
				break;
			}
			else
			{
				destruir = true;
			}
		}
		if(destruir)
		{
			var p = instance_create_layer(dest_x, dest_y, layer, obj_player);
			p.velh = velh_inicial;
			p.velv = velv_inicial;
			p.velh_inicial = velh_inicial;
			p.velv_inicial = velv_inicial;
			instance_destroy(obj_pedaco);
			obj_camera.alvo = p;
		}
		
	}
}
