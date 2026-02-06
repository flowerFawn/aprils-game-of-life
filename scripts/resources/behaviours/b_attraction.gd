extends Behaviour
class_name BAttraction

@export var attraction_distance:float

func get_desired(behavour:Vehicle, neighbours:Array[Thing]) -> Vector2:
	var affecting:Array[Vector2] = []
	var distance_squared:float = attraction_distance ** 2
	for neighbour:Thing in neighbours:
		if neighbour.is_in_group(considered_group):
			if behavour.position.distance_squared_to(neighbour.position) > distance_squared:
				affecting.append(set_mag(behavour.position.direction_to(neighbour.position), weight))
	return get_vector_average(affecting)
				
