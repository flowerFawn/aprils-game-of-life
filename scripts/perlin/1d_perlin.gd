extends PerlinNoise
class_name OneDPerlin

func _init() -> void:
	generate_new_points()

func get_point(x:float, y:float = 0, z:float = 0, t:float = 0) -> float:
	print("not sure I need this lol")
	return 0
	
func generate_new_points(repeat_size:int = 256) -> void:
	_points.resize(repeat_size)
	for i:int in range(repeat_size):
		_points[i] = _r.randf_range(-1.0, 1.0)
	
func get_noise(size:int, frequency:float, octaves:int) -> Array:
	var noise:Array[float]
	var freq_x:float
	var repeat_size:int = _points.size() - 1
	noise.resize(size)
	for x:int in range(size):
		freq_x = x * frequency
		noise[x] = lerp(_points[floori(fmod(freq_x, repeat_size))], _points[ceili(fmod(freq_x, repeat_size))], fade(fmod(freq_x, 1.0)))
	for octave:int in range(1, octaves + 1):
		for x:int in range(size):
			freq_x = x * (frequency * (2 ** octave))
			noise[x] += lerp(_points[floori(fmod(freq_x, repeat_size))], _points[ceili(fmod(freq_x, repeat_size))], fade(fmod(freq_x, 1.0))) * (0.5 ** octave)
	return noise
