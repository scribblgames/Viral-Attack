extends TextureProgressBar

signal nextlevelyall

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if value >= 100:
		emit_signal("nextlevelyall")


func _on_area_2d_playerisloading():
	value += 0.025
