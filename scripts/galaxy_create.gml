///galaxy_create(x,y,obj,radius,stars,arms,tight,sep,displacement,spread,bunch1,bunch2)
//
//Creates a galxy star field from objects
//Can be edited to create from sprites or other
//
//Example
//galaxy_create(x,y,obj_bkg_star,512,2048,4,0.42,2,8,0.52,0.9,1.2)
//
//DragonGameStudios 2016
object=argument2;
galaxy_radius = argument3;  
num_arms = argument5;
num_stars = argument4;
//higher number = more tight, negative reverses direction of spiral
spiral_tightness = argument6; 

//the nearest any 2 stars can be to each other
//danger of infinite loop if this number is too high
min_star_seperation = argument7;  

//the maximum distance a star can be from its spiral arm
//the real max displacement is (max_star_displacement * power(dist,fan_rate))
//where dist is a star's distance from the galactic center.
max_star_displacement = argument8;  

//how much stars spread out from the arms as distance from center of galaxy increase
//EXTREMELY sensitive.  Don't go far from 0.5.
fan_rate = argument9

//how much stars bunch toward center of galaxy
//lower numbers bunch toward edge, higher toward middle, 0.5 = no bunching
bunching = argument10;  

//how much stars bunch toward the spiral arm they are in
//lower numbers bunch toward edge, higher toward middle, 0.5 = no bunching
bunching_2 = argument11;  

//no need to touch these
arm_radial_spacing = 360 / num_arms;
random_interval = power(galaxy_radius,1/bunching);
random_interval_2 = power(max_star_displacement,1/bunching_2);

randomize();
var star_placed, arm, dist, dist2, angle, xx, yy, nearest_star;
for (var star = 0; star < num_stars; star++)
{
    star_placed = false
    do
    {
        arm = irandom(num_arms-1);
        dist = power(random(random_interval),bunching);
        angle = (dist + dist) * spiral_tightness + arm * arm_radial_spacing;
        
        xx = random_range(-1,1);
        yy = random_range(-1,1);
        dist2 = power(random(random_interval_2),bunching_2) / point_distance(0,0,xx,yy) * power(dist,fan_rate);
    
        xx = argument0 + lengthdir_x(dist,angle) + xx * dist2;
        yy = argument1 + lengthdir_y(dist,angle) + yy * dist2;
        nearest_star = instance_nearest(xx,yy,object);
        if (instance_number(object) == 0) or (point_distance(xx,yy,nearest_star.x,nearest_star.y) > min_star_seperation)
        {
            instance_create(xx,yy,object);
            star_placed = true;
        }
    }
    until star_placed
}
