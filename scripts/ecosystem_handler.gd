extends Node2D
class_name EcosystemHandler



func _physics_process(delta: float) -> void:
	var things:Array[Thing]
	things.assign(get_children())
	for thing:Thing in things:
		thing.do_process(delta, things)
		
