extends Button

func _ready():
	self.connect("pressed", self, "_on_pressed")

func _on_pressed():
	print("PRESSED!!!")
