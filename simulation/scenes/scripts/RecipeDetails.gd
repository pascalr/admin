extends PanelContainer

func _ready():
	self.visible = false

func show_details(recipe):
	self.visible = true
	$VBox/Title.text = recipe["name"]

func hide_details():
	self.visible = false
