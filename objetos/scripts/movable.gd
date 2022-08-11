extends KinematicBody2D

var object_raised = false
var recenter_vector = Vector2(39,28)
var shadow_pos = Vector2(0,)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		if not object_raised:
			#play animation
			object_raised = true
		position = get_viewport().get_mouse_position()-recenter_vector
	else:
		#play animation
		object_raised = false
