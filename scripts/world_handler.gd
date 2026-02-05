extends Node2D
class_name WorldHandler



func _physics_process(delta: float) -> void:
	var things:Array[Thing]
	for child:Thing in get_children():
		child.do_process(delta, things)
		
