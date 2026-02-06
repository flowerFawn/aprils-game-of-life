@abstract
class_name PerlinNoise
extends RefCounted

var _r:RandomNumberGenerator = RandomNumberGenerator.new()
var _points:Array

@abstract func get_point(x:float, y:float = 0, z:float = 0, t:float = 0) -> float

@abstract func get_noise(size:int, frequency:float, octaves:int) -> Array

@abstract func generate_new_points(size:int = 256) -> void
	
func fade(t:float) -> float:
	return ((6*t - 15)*t + 10)*t*t*t

func range_equiv(value:float, to_range:Vector2, from_range:Vector2 = Vector2(-1.0, 1.0)) -> float:
	return to_range.x + ((value - from_range.x) / (from_range.y - to_range.x)) * (to_range.y - to_range.x)
