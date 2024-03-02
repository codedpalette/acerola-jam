extends CharacterBody2D

const SPEED = 500.0

func _physics_process(_delta):
	var direction_horizontal = Input.get_axis("left", "right")
	var direction_vertical = Input.get_axis("up", "down")
	velocity = Vector2(direction_horizontal, direction_vertical).normalized() * SPEED
	move_and_slide()
