/// @description Insert description here
// You can write your code in this editor

chao = place_meeting(x, y + 1, obj_plat);
parede_dir = place_meeting(x + 1, y, obj_plat);
parede_esq = place_meeting(x - 1, y, obj_plat);

if(chao)
{
	timer_pulo = limite_pulo;
	carga = 1;
}
else
{
	if(timer_pulo > 0) timer_pulo--;
}

if(parede_dir or parede_esq)
{
	if(parede_dir) ultima_parede = 0;
	else ultima_parede = 1;
	timer_parede = limite_parede;
}
else
{
	if(timer_parede > 0) timer_parede--;
}

var left, right, up, down, jump, jump_s, dash;

if(!controlado)
{
	

	left = keyboard_check(ord("A"));
	right = keyboard_check(ord("D"));
	up = keyboard_check(ord("W"));
	down = keyboard_check(ord("S"));
	jump = keyboard_check_pressed(ord("K"));
	jump_s = keyboard_check_released(ord("K"));
	dash = keyboard_check_pressed(ord("L"));

	avanco_h = (right - left) * max_velh;
}
else
{
	left = 0;
	right = 0;
	up = 0;
	down = 0;
	jump = 0;
	jump_s = 0;
	dash = 0;
}
if(chao) acel = acel_chao;
else acel = acel_ar;

switch(estado)
{
	case state.parado:
		velh = 0;
		velv = 0;
		
		if(jump && chao)
		{
			velv = -max_velv;
		}
		
		if(!chao) velv += grav;
		
		if(abs(velh) > 0 or abs(velv) > 0 or left or right or jump)
		{
			estado = state.movendo;
		}
		
		if(dash && carga > 0)
		{
			if(right or up or left or down)
			{
				dir = point_direction(0, 0, (right - left), (down - up));
			}
			else
			{
				dir = point_direction(0, 0, ver, 0);
			}
			estado = state.dash;
			carga--;
		}
		break;
		
	case state.movendo:
		
		if(chao && down)
		{
			xscale = 1.5;
			yscale = .5;
		}
		
		velh = lerp(velh, avanco_h, acel);
		
		if(abs(velh) > max_velh - .5 && chao)
		{
			var chance = random(100);
			if(chance > 95)
			{
				for(var i = 0; i < irandom_range(4, 10); i++)
				{
					var xx = random_range(x - sprite_width/2, x + sprite_width/2);
					instance_create_layer(xx, y, "particulas", obj_vel);
				}
			}
		}
		
		if(!chao && (parede_dir or parede_esq or timer_parede))
		{
			if(velv > 0)
			{
				velv = lerp(velv, deslize, acel);
				var chance = random(100);
				if(chance > 95)
				{
					for(var i = 0; i < irandom_range(4, 10); i++)
					{
						var onde = parede_dir - parede_esq;
						var xx = x + onde * sprite_width/2;
						var yy = y + random_range(-sprite_height/4, 0);
						instance_create_layer(xx, yy, "particulas", obj_vel);
					}
				}
			}
			else
			{
				velv += grav;
			}
			
			if(!ultima_parede && jump)
			{
				velv = -max_velv;
				velh = -max_velh;
				xscale = .5;
				yscale = 1.5;
				
				for(var i = 0; i < irandom_range(4, 10); i++)
				{
					var onde = parede_dir - parede_esq;
					var xx = x + sprite_width/2;
					var yy = y + random_range(-sprite_height/4, 0);
					instance_create_layer(xx, yy, "particulas", obj_vel);
				}
			}
			else if(ultima_parede && jump)
			{
				velv = -max_velv;
				velh = max_velh;
				xscale = .5;
				yscale = 1.5;
				
				for(var i = 0; i < irandom_range(4, 10); i++)
				{
					var onde = parede_dir - parede_esq;
					var xx = x - sprite_width/2;
					var yy = y + random_range(-sprite_height/4, 0);
					instance_create_layer(xx, yy, "particulas", obj_vel);
				}
			}
		}
		else if(!chao)
		{
			velv += grav;
		}
		
		if(jump && (chao or timer_pulo))
		{
			velv = -max_velv;
			
			xscale = .5;
			yscale = 1.5;
			
			for(var i = 0; i < irandom_range(4, 10); i++)
			{
				var xx = random_range(x - sprite_width, x + sprite_width);
				instance_create_layer(xx, y, "particulas", obj_vel);
			}
		} 
		
		if(jump) timer_queda = limite_buffer;
		
		if(timer_queda > 0) buffer_pulo = true;
		else buffer_pulo = false;
		
		if(buffer_pulo)
		{
			if(chao or timer_pulo)
			{
				velv = -max_velv;
				xscale = .5;
				yscale = 1.5;
				
				timer_pulo = 0;
				timer_queda = 0;
				
				for(var i = 0; i < irandom_range(4, 10); i++)
				{
					var xx = random_range(x - sprite_width, x + sprite_width);
					instance_create_layer(xx, y, "particulas", obj_vel);
				}
			}
			
			timer_queda--;
		}
		
		if(jump_s && velv < 0) velv *= .7;
		
		if(dash && carga > 0)
		{
			dir = point_direction(0, 0, (right - left), (down - up));
			estado = state.dash;
			carga--;
		}
		
		
		velv = clamp(velv, -max_velv, max_velv);
		break;
		
	case state.dash:
		dura--;
		velh = lengthdir_x(len, dir);
		velv = lengthdir_y(len, dir);
		if(dir == 90 or dir == 270)
		{
			yscale = 1.5;
			xscale = .5;
		}
		else
		{
			yscale = .5;
			xscale = 1.6;
		}

		var rastro = instance_create_layer(x, y, "player_rastro", obj_player_vestigio);
		rastro.xscale = xscale;
		rastro.yscale = yscale;
		if(dura <= 0)
		{
			estado = state.movendo;
			dura = room_speed/4;
			
			velh = (max_velh * sign(velh) * .5);
			velv = (max_velv * sign(velv) * .5);
		}
		break;
		
	case state.morte:
		if(criar_pedaco)
		{
			for(var i = 0; i < 10; i++)
			{
				var p = instance_create_layer(x, y, layer, obj_pedaco);
				p.speed = random_range(1, 2);
				p.direction = random(360);
				p.image_angle = p.direction;
				p.image_xscale = random_range(.2, .6);
				p.image_yscale = p.image_xscale;
				p.dest_x = xstart;
				p.dest_y = ystart;
				p.velh_inicial = velh_inicial;
				p.velv_inicial = velv_inicial;
				p.image_blend = make_color_hsv(20, sat, 255);
				lista[i] = p.id;
				if(i >= 9)
				{
					criar_pedaco = false;
					p.criador = true;
					p.lista = lista;
					obj_camera.alvo = p;
					instance_destroy();
				} 
			}	
		}
		break;
		
	case state.voltar:
		
		break;
}

image_blend = make_color_hsv(20, sat, 255);
switch(carga)
{
	case 0:
		sat = lerp(sat, 50, .05);
		break;
	case 1:
		sat = lerp(sat, 255, .05);
		break;
}



xscale = lerp(xscale, 1, .15);
yscale = lerp(yscale, 1, .15);




