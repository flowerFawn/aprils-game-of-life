extends PerlinNoise
class_name TwoDPerlin


func generate_new_points(size:int = 256) -> void:
	var row:Array = []
	row.resize(size)
	_points.resize(size)
	for i:int in range(size):
		_points[i] = row.duplicate()
	for x:int in range(size):
		for y in range(size):
			_points[x][y] = Vector2.RIGHT.rotated(_r.randf_range(0, TAU))

func get_point(x:float, y:float = 0, z:float = 0, t:float = 0) -> float:
	var modx:float = fmod(x, 1.0)
	var mody:float = fmod(y, 1.0)
	var dot_top_left:float
	var dot_top_right:float
	var dot_bottom_left:float
	var dot_bottom_right:float
	var noise_value:float = 0
	var freq_x:float
	var freq_y:float
	#var top_left:Vector2 = Vector2(x, y - 1.0)
	#var top_right:Vector2 = Vector2(x - 1.0, y - 1.0)
	#var bottom_left:Vector2 = Vector2(x, y)
	#var bottom_right:Vector2 = Vector2(x - 1.0, y)
	#
	#var const_top_left:Vector2 = _points[floori(x)][floori(y)]
	#var const_top_right:Vector2 = _points[ceili(x)][floori(y)]
	#var const_bottom_left:Vector2 = _points[floori(x)][ceili(y)]
	#var const_bottom_right:Vector2 = _points[ceili(x)][ceili(y)]
	
	for octave:int in range(_octaves + 1):
		freq_x = x * (2 ** octave)
		freq_y = y * (2 ** octave)
		dot_top_left = Vector2(freq_x, freq_y - 1.0).dot(_points[fmod(floori(freq_x), 256)][fmod(floori(freq_y), 256)])
		dot_top_right = Vector2(freq_x - 1.0, freq_y - 1.0).dot(_points[fmod(ceili(freq_x), 256)][fmod(floori(freq_y), 256)])
		dot_bottom_left = Vector2(freq_x, freq_y).dot(_points[fmod(floori(freq_x), 256)][fmod(ceili(freq_y), 256)])
		dot_bottom_right = Vector2(freq_x - 1.0, freq_y).dot(_points[fmod(ceili(freq_x), 256)][fmod(ceili(freq_y), 256)])
		noise_value += lerp(lerp(dot_top_left, dot_bottom_left, fade(mody)),lerp(dot_top_right, dot_bottom_right, fade(mody)),fade(modx)) * (0.5 ** octave)
	return noise_value
	
func get_noise(size:int) -> Array:
	var noise:Array[Array]
	var row:Array = []
	var freq_x:float
	var freq_y:float
	noise.resize(size)
	row.resize(size)
	for i:int in range(size):
		noise[i] = row.duplicate()
	for x:int in range(size):
		for y:int in range(size):
			noise[x][y] = get_point(x * _frequency, y * _frequency)
	print(noise)
	return noise
	
func interpolate_for_point(freq_x:float, freq_y:float = 0, freq_z:float = 0, freq_t:float = 0, repeat_size:int = 255) -> float:
	return 0

func noise_to_image(size:int) -> Image:
	var noise:Array[Array] = get_noise(size)
	var image:Image = Image.create_empty(size, size, false, Image.Format.FORMAT_RGB8)
	var rgb:float
	var new_range:Vector2 = Vector2(0.0, 1.0)
	for x in range(size):
		for y in range(size):
			rgb = range_equiv(noise[x][y], new_range)
			image.set_pixel(x, y, Color(rgb, rgb, rgb, 1))
	return image
