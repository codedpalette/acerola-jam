class_name Door
extends StaticBody2D

@onready var sprite: Polygon2D = $Polygon2D
var is_open = false

func open():
	if !is_open:
		is_open = true
		sprite.color = Color(0, 0, 0)

func close():
	if is_open:
		is_open = false
		sprite.color = Color(1, 1, 1)
