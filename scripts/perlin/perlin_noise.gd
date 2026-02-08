@abstract
class_name PerlinNoise
extends RefCounted

var _r:RandomNumberGenerator = RandomNumberGenerator.new()
var _points:Array

var _frequency:float
var _octaves:float

func _init(given_frequency:float, given_octaves:float) -> void:
	_frequency = given_frequency
	_octaves = given_octaves
	generate_new_points()
	
func set_frequency(value:float) -> void:
	_frequency = value
	
func set_octaves(value:int) -> void:
	_octaves = value
	
	
	

@abstract func get_point(x:float, y:float = 0, z:float = 0, t:float = 0) -> float

@abstract func get_noise(size:int) -> Array

@abstract func generate_new_points(size:int = 256) -> void

@abstract func interpolate_for_point(freq_x:float, freq_y:float = 0, freq_z:float = 0, freq_t:float = 0, repeat_size:int = 255) -> float
	
func fade(t:float) -> float:
	return ((6*t - 15)*t + 10)*t*t*t

func range_equiv(value:float, to_range:Vector2, from_range:Vector2 = Vector2(-1.0, 1.0)) -> float:
	return to_range.x + ((value - from_range.x) / (from_range.y - to_range.x)) * (to_range.y - to_range.x)
