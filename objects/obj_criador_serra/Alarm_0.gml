/// @description Insert description here
// You can write your code in this editor


var xx = (x - sprite_xoffset) + sprite_width / 2;
var yy = y - sprite_yoffset + sprite_height / 2;

var serra = instance_create_layer(xx, yy, "camera", obj_serra);

serra.dir = dir;
serra.estado = "avanca";
serra.limite = limite;
serra.vel = vel;
serra.rot = rot;
serra.image_xscale = .2;
serra.image_yscale = .2;
serra.pai = self.id;
alarm[0] = room_speed * alarme;
