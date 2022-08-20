extends KinematicBody2D

#vars de input
var mouse_pressed = false

#vars de controle
var grabbed = false
var table_bottom = 510
var table_top = 230

#vars de acesso a nós filhos
onready var sprite = $Sprite
onready var animation = $AnimationPlayer
onready var shadow = $Shadow
onready var parent = $".."
onready var grandpa = $"../.."

#Captura o início do clique sobre o objeto
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			mouse_pressed = event.pressed

#Captura o fim do clique em qualquer lugar da tela caso o cursor tenha saído do objeto
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			mouse_pressed = false

#função de movimento do objeto.
#Confere se o estado do mouse mudou, se sim toca a animação para pegar ou largar o item
#Se ele estiver sendo arrastado, ele segue o mouse. Shadow offset é a altura do objeto em relação à sombra
func _physics_process(delta):
	var root = get_tree().get_root()
	
	if not grabbed and mouse_pressed:
		animation.play('grab')
		shadow.visible = true
		z_index+=1	
		parent.remove_child(self)
		root.add_child(self)
	
	if grabbed and not mouse_pressed:
		interact()
		animation.play('lay')
		shadow.visible = false
		z_index-=1
		root.remove_child(self)
		parent.add_child(self)
	
	grabbed = mouse_pressed

	if grabbed:
		position = get_global_mouse_position()
		var shadow_pos = shadow.offset
		
		if position.y + shadow_pos.x <= table_top:
			shadow_pos.y += table_top - position.y
					
		elif position.y + shadow_pos.y >= table_bottom:
			shadow_pos.y += table_bottom - position.y

		shadow.position = shadow_pos
		
func interact():
	pass
