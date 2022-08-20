extends Area2D

var full = false
var content = null

func _ready():
	connect("body_entered", self, "_on_body_entered")
	set_collision_layer_bit(3,true)
	set_collision_mask_bit(1,true)


func _on_body_entered(body):
	if not full and not body.grabbed:
		full = true
		content = body
		#content.get_child('animation').play('fridge')
		add_child(content)
