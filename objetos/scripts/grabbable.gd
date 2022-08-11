extends KinematicBody2D

var grabbed = false
var speed = Vector2.ZERO

onready var animation = $AnimationPlayer
onready var shadow = $Shadow

#muda a animação e define grabbed para true se o item for arrastado, e false quando para de arrastar
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if not grabbed and event.pressed:
				animation.play('grab')
				shadow.visible = true
			if grabbed and not event.pressed:
				animation.play('lay')
				shadow.visible = false
			grabbed = event.pressed

#trata o caso de parada em que o cursor não está mais sobre o item
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			animation.play('lay')
			shadow.visible = false
			grabbed = false

#função de movimento do objeto. Se ele estiver sendo arrastado, ele segue o mouse. Shadow offset é a altura do objeto em relação à sombra
func _physics_process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	if grabbed:
		speed = get_global_mouse_position() - position + shadow.offset
		move_and_slide(speed/delta)
