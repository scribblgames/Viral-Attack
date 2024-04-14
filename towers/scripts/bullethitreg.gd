extends Node2D

var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.x * speed * delta


func _on_area_2d_area_entered(area):
	if area.is_in_group("enemies"):
		area.get_parent().queue_free()
		queue_free()




func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.is_in_group("enemies"):
		body.get_parent().queue_free()
		queue_free()
