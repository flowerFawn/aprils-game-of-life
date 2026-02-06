extends BWander
class_name BSeekFood

@export var food_sense_distance:float

func get_desired(behavour:Vehicle, neighbours:Array[Thing]) -> Vector2:
	var closest_food_distance_squared:float = INF
	var food_sense_squared:float = food_sense_distance ** 2
	var distance:float
	var closest_food_position:Vector2 = Vector2.ZERO
	for thing:Thing in neighbours:
		if thing.is_in_group(considered_group):
			distance = behavour.position.distance_squared_to(thing.position)
			if distance < closest_food_distance_squared and distance < food_sense_squared:
				closest_food_distance_squared = behavour.position.distance_squared_to(thing.position)
				closest_food_position = thing.position
	if closest_food_distance_squared == INF:
		current_rotation += r.randf_range(-0.1 * PI, 0.1 * PI)
		return set_mag(behavour.position.direction_to(
		behavour.position + (behavour.velocity.normalized() * 300) + (Vector2.UP.rotated(current_rotation) * 100)), weight)
	else:
		print("A")
		return behavour.position.direction_to(closest_food_position)
			
