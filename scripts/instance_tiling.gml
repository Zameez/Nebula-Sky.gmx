///instance_tiling(step,object,sprite)
/*---------------------------------*/
//step - step size between instances
//object - object to check for tiling
//sprite - sets object sprite to tile(must be a 16 images in sprite for correct work)
//var pm_right, pm_left, pm_down, pm_up;
tile_step=argument0;
tile_instance=argument1;
sprite_index=argument2;

pm_right=place_meeting(x-tile_step,y,tile_instance);
pm_left=place_meeting(x+tile_step,y,tile_instance);
pm_down=place_meeting(x,y-tile_step,tile_instance);
pm_up=place_meeting(x,y+tile_step,tile_instance);

if !pm_up && !pm_down && !pm_left && !pm_right
{
    image_single=0
}
if !pm_up && !pm_down && pm_left && pm_right
{
    image_single=1
}
if pm_up && pm_down && !pm_left && !pm_right
{
    image_single=2
}
if pm_up && !pm_down && !pm_left && !pm_right
{
    image_single=3
}
if !pm_up && !pm_down && !pm_left && pm_right
{
    image_single=4
}
if !pm_up && pm_down && !pm_left && !pm_right
{
    image_single=5
}
if !pm_up && !pm_down && pm_left && !pm_right
{
    image_single=6
}
if pm_up && !pm_down && pm_left && !pm_right
{
    image_single=7
}
if pm_up && !pm_down && pm_left && pm_right
{
    image_single=8
}
if pm_up && !pm_down && !pm_left && pm_right
{
    image_single=9
}
if pm_up && pm_down && !pm_left && pm_right
{
    image_single=10
}
if !pm_up && pm_down && !pm_left && pm_right
{
    image_single=11
}
if !pm_up && pm_down && pm_left && pm_right
{
    image_single=12
}
if !pm_up && pm_down && pm_left && !pm_right
{
    image_single=13
}
if pm_up && pm_down && pm_left && !pm_right
{
    image_single=14
}
if pm_up && pm_down && pm_left && pm_right
{
    image_single=15
}
