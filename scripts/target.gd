class_name Target
extends StaticBody2D

@onready var sprite: Polygon2D = $Polygon2D
var active = false

signal activated
signal deactivated

func activate():
	if !active:
		sprite.color = Color(1, 1, 0)
		active = true
		activated.emit()

func deactivate():
	if active:
		sprite.color = Color(0, 1, 0)
		active = false
		deactivated.emit()