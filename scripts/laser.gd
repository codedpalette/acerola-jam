extends StaticBody2D

class_name Laser

@onready var rotator: Node2D = $Rotator
@onready var sprite: Polygon2D = $Rotator/Polygon2D
@onready var laser_ray: RayCast2D = $Rotator/LaserRay

var collision_point: Vector2:
	set(value):
		if collision_point != value:
			collision_point = value
			queue_redraw()

func _draw():
	draw_line(laser_ray.position * rotator.transform.inverse(), collision_point, Color(0, 0, 1))

func _physics_process(_delta):
	if laser_ray.is_colliding():
		var global_collision_point = laser_ray.get_collision_point()
		collision_point = to_local(global_collision_point)

func rotate_laser(radians: float):
	rotator.rotate(radians)