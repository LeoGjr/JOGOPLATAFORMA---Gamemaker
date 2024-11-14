/// @description Insert description here
// You can write your code in this editor

grav = .3;
acel_chao = .1;
acel_ar = .07;
acel = acel_chao;
deslize = 2;
avanco_h = 0;


max_velh = 6;
max_velv = 8;
len = 10;

limite_pulo = 6;
timer_pulo = 0;

limite_buffer = 6;
timer_queda = 0;
buffer_pulo = false;

chao = false;
parede_dir = false;
parede_esq = false;

yscale = 1;
xscale = 1;
dura = room_speed / 4;
dir = 0;
carga = 1;

sat = 255;

limite_parede = 6;
timer_parede = 0;
ultima_parede = 0;

ver = 1;
criar_pedaco = true;
iniciado = true;
lista = noone;

controlado = false;


enum state
{
	parado, movendo, dash, morte, voltar
}

estado = state.movendo;

if(!instance_exists(obj_camera))
{
	instance_create_layer(x, y, "bg", obj_camera);
}

image_blend = make_color_hsv(20, sat, 255);
