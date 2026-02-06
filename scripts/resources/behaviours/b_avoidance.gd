extends Behaviour
class_name BAvoidance

@export var avoidance_distance:float

func get_desired(behavour:Vehicle, neighbours:Array[Thing]) -> Vector2:
	var affecting:Array[Vector2] = []
	var distance_squared:float = avoidance_distance ** 2
	for neighbour:Thing in neighbours:
		if neighbour.is_in_group(considered_group):
			if behavour.position.distance_squared_to(neighbour.position) < distance_squared:
				affecting.append(set_mag(neighbour.position.direction_to(behavour.position), weight))
	return get_vector_average(affecting)
				
