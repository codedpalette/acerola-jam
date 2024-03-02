extends CharacterBody2D

const SPEED = 500.0

@onready var influence: Area2D = $Influence
var influencing_laser: Laser

func _ready():
	influence.connect("body_entered", _on_body_entered)
	influence.connect("body_exited", _on_body_exited)

func _physics_process(_delta):
	var direction_horizontal = Input.get_axis("left", "right")
	var direction_vertical = Input.get_axis("up", "down")
	var laser_rotation = Input.get_axis("rotate_ccw", "rotate_cw")

	velocity = Vector2(direction_horizontal, direction_vertical).normalized() * SPEED
	if influencing_laser and laser_rotation:
		influencing_laser.rotate_laser(laser_rotation * 0.01)
	move_and_slide()

func _on_body_entered(body: Node2D):
	if body is Laser:
		influencing_laser = body

func _on_body_exited(body: Node2D):
	if body == influencing_laser:
		influencing_laser = null
