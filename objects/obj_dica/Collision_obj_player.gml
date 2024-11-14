/// @description Insert description here
// You can write your code in this editor

if(!ativo)
{
	ativo = true;
	
	alarm[0] = room_speed * 3;
	yy = other.y - 32;
	xx = other.x;
}

if(controlar)
{
	if(pulo)
	{
		other.velv = -8;
	} 
	if(abs(velh)) other.avanco_h = velh;
	other.estado = estado;
	other.dir = dir;
	other.dura = dura;
	
	other.controlado = controlar;
}

