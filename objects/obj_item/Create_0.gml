/// @description Insert description here
// You can write your code in this editor

eu = audio_emitter_create();
audio_emitter_position(eu, x, y, 0);
audio_emitter_falloff(eu, 100, 400, 1);

audio_play_sound_on(eu, snd_teste, true, 5);
