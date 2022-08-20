extends Area2D

var mouse_in = false
var pos_min = -2050
var pos_max = 2050
var sliding_speed = 10

export var is_left = true
onready var sliding = $"../sliding"

func _ready():
	connect("mouse_entered", self, "_on_mouse_entered")
	connect("mouse_exited", self, "_on_mouse_exited")

func _on_mouse_entered():
	mouse_in = true

func _on_mouse_exited():
	mouse_in = false

func _process(delta):
	if mouse_in:
		if is_left and sliding.position.x <= pos_max:
			sliding.position.x += sliding_speed
		if not is_left and sliding.position.x >= pos_min:
			sliding.position.x -= sliding_speed
