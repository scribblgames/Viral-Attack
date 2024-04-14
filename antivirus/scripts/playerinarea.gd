extends Area2D

var playerinrange = false
signal playerisloading

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playerinrange == true:
		emit_signal("playerisloading")


func _on_area_entered(area):
	if area.is_in_group("player"):
		playerinrange = true


func _on_area_exited(area):
	if area.is_in_group("player"):
		playerinrange = false
