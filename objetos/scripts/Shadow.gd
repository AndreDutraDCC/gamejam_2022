extends Node2D

var offset = Vector2(0,100)
var color = Color(0,0,0,0.5)
var height = 10
var width = 30

func _ready():
	visible = false
	scale = Vector2(width,height)

func _draw():
	draw_circle(position, 1, color)

