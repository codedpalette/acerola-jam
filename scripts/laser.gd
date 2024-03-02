extends StaticBody2D

@onready var laser_ray: RayCast2D = $LaserRay
var collision_point: Vector2:
	set(value):
		if collision_point != value:
			collision_point = value
			queue_redraw()

func _draw():
	draw_line(laser_ray.position, collision_point, Color(1, 0, 0))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if laser_ray.is_colliding():
		var global_collision_point = laser_ray.get_collision_point()
		collision_point = to_local(global_collision_point)
