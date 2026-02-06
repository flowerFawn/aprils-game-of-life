extends ColorRect

@export var amplitude_slider:VSlider
@export var octave_slider:VSlider
@export var frequency_slider:VSlider

var noise:OneDPerlin = OneDPerlin.new()
var peaks:Array[float]
var snow_line:Array[float]

func calculate_mountain_range() -> void:
	var new_range_vec:Vector2 = Vector2(0.5 - amplitude_slider.value, amplitude_slider.value)
	peaks.assign(noise.get_noise(2000, frequency_slider.value, octave_slider.value).map(noise.range_equiv.bind(new_range_vec)))
	snow_line.assign(noise.get_noise(2000, frequency_slider.value, octave_slider.value / 2).map(noise.range_equiv.bind(new_range_vec)))
	for i in range(snow_line.size()):
		snow_line[i] += 0.2
	material.set_shader_parameter(&"peaks", peaks)
	material.set_shader_parameter(&"snow", snow_line)
	
func _ready() -> void:
	calculate_mountain_range()


func _on_slider_changed(value:float) -> void:
	calculate_mountain_range()


func _on_button_pressed() -> void:
	noise.generate_new_points()
	calculate_mountain_range()
