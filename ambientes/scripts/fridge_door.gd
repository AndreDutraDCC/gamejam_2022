extends Area2D

var closed = true
var door_offset = 280

onready var sprite = $sprite
onready var inside = $inside

#func _ready():
	#inside.paused = true

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		if closed:
			sprite.play('open')
			position.x -= door_offset
			closed = false
			#inside.paused = true
		else:
			sprite.play('shut')
			position.x += door_offset
			#inside.paused = false
