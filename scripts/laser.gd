class_name Laser
extends StaticBody2D

@onready var rotator: Node2D = $Rotator
@onready var sprite: Polygon2D = $Rotator/Polygon2D
@onready var laser_ray: RayCast2D = $Rotator/LaserRay
var target: Target
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
		var collider = laser_ray.get_collider()
		collision_point = to_local(global_collision_point)
		if target and collider != target:
			target.deactivate()
			target = null
		if collider is Target:
			target = collider
			target.activate()

func rotate_laser(radians: float):
	rotator.rotate(radians)