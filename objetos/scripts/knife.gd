extends "res://objetos/scripts/grabbable.gd"

onready var init_pos = position

func interact():
	position = init_pos
