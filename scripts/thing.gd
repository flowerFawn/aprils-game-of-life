extends Node2D
class_name Thing

func get_grid_position(resolution:int) -> Vector2i:
	return Vector2i(position / resolution)

func do_process(delta:float, neighbours:Array[Thing]) -> void:
	pass
