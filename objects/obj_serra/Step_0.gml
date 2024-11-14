/// @description Insert description here
// You can write your code in this editor

image_angle += rot;


switch(estado)
{
	case "avanca":
		
		var limite_x = lengthdir_x(limite, dir);
		var limite_y = lengthdir_y(limite, dir);
		
		x += lengthdir_x(vel, dir);
		y += lengthdir_y(vel, dir);
		
		if(limite_x > 0)
		{
			if(x >= xstart + limite_x) estado = "recua";
		}
		else if(limite_x < 0)
		{
			if(x <= xstart + limite_x) estado = "recua";
		}
		if(limite_y > 0)
		{
			if(y >= ystart + limite_y) estado = "recua";
		}
		else if(limite_y < 0)
		{
			if(y <= ystart + limite_y) estado = "recua";
		}
		
		
		break;
		
	case "recua":
		
		x -= lengthdir_x(vel, dir);
		y -= lengthdir_y(vel, dir);
		
		if(x == xstart && y == ystart) estado = "avanca";
		
		
		break;
		
	case "parado":
		break;
		
	default:
		break;
}

if(pai != noone)
{
	var col = instance_place(x, y, obj_plat);
	
	if(col)
	{
		if(col != pai)
		{
			instance_destroy();
		}
	}
}
