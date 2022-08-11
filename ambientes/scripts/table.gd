extends Polygon2D

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and Geometry.is_point_in_polygon(event.position, polygon):
			get_tree().change_scene("res://ambientes/scenes/mesa.tscn")
