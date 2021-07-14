extends Spatial

func _ready():
	OS.set_low_processor_usage_mode(true)
	OS.set_low_processor_usage_mode_sleep_usec(50000)
