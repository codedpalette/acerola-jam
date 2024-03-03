extends Node2D

@onready var target: Target = $Target
@onready var door: Door = $Door

# Called when the node enters the scene tree for the first time.
func _ready():
	target.connect("activated", door.open)
	target.connect("deactivated", door.close)
