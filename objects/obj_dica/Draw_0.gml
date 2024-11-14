/// @description Insert description here
// You can write your code in this editor

if(ativo)
{
	alpha -= .01;
	altura += .5;
	draw_set_font(fnt_dica);
	draw_set_halign(fa_center);
	draw_text_color(xx, yy - altura, texto, c_white, c_white, c_white, c_white, alpha);
	draw_set_halign(-1);
	draw_set_font(-1);
}
