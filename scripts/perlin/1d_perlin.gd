extends PerlinNoise
class_name OneDPerlin


func get_point(x:float, y:float = 0, z:float = 0, t:float = 0) -> float:
	var repeat_size:int = _points.size() - 1
	var freq_x:float#
	var point_value:float = interpolate_for_point(x, 0, 0, 0, repeat_size)
	for octave:int in range(1, _octaves + 1):
		freq_x = x * (2 ** octave)
		point_value += interpolate_for_point(freq_x, 0, 0, 0, repeat_size) * (0.5 ** octave)
	return point_value
	
func generate_new_points(repeat_size:int = 256) -> void:
	_points.resize(repeat_size)
	for i:int in range(repeat_size):
		_points[i] = _r.randf_range(-1.0, 1.0)
	
func get_noise(size:int) -> Array:
	var noise:Array[float]
	var repeat_size:int = _points.size() - 1
	noise.resize(size)
	#for x:int in range(size):
		#freq_x = x * _frequency
		#noise[x] = lerp(_points[floori(fmod(freq_x, repeat_size))], _points[ceili(fmod(freq_x, repeat_size))], fade(fmod(freq_x, 1.0)))
	#for octave:int in range(1, _octaves + 1):
		#for x:int in range(size):
			#freq_x = x * (_frequency * (2 ** octave))
			#noise[x] += lerp(_points[floori(fmod(freq_x, repeat_size))], _points[ceili(fmod(freq_x, repeat_size))], fade(fmod(freq_x, 1.0))) * (0.5 ** octave)
	for x in range(size):
		noise[x] = get_point(x * _frequency)
	return noise
	
func interpolate_for_point(freq_x:float, freq_y:float = 0, freq_z:float = 0, freq_t:float = 0, repeat_size:int = 255) -> float:
	return lerp(_points[floori(fmod(freq_x, repeat_size))], _points[ceili(fmod(freq_x, repeat_size))], fade(fmod(freq_x, 1.0)))
