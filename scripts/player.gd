extends CharacterBody2D

const SPEED = 500.0
const LEVEL_TEMPLATE = "res://scenes/levels/level%s.tscn"

@onready var influence: Area2D = $Influence
var influencing_laser: Laser

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

func _on_area_entered(area: Area2D):
	if area is Door and area.is_open:
		next_level()
		queue_free()

func next_level():
	var current_scene = get_tree().current_scene.scene_file_path
	var next_level_number = current_scene.to_int() + 1
	var next_scene = LEVEL_TEMPLATE % next_level_number
	var result = get_tree().change_scene_to_file(next_scene)
	if result != OK:
		get_tree().change_scene_to_file(LEVEL_TEMPLATE % "_end")