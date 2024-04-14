extends Node2D

var basicbullet = preload("res://towers/scenes/bullet.tscn")
signal shotbullet

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
	rotation_degrees += 90


func _on_timer_timeout():
	print("timeup!")
	emit_signal("shotbullet")
	var b = basicbullet.instantiate()
	get_tree().get_root().add_child(b)
	b.z_index = -2
	b.transform = global_transform
	b.rotation_degrees = rotation_degrees
	b.rotation_degrees -= 90
	
	
