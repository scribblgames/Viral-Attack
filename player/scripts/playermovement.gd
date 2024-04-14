extends CharacterBody2D

var speed = 2
var tower1 = preload("res://towers/scenes/roboshoot.tscn")
var health = 100
var touchingenemy = false
signal is_moving
signal putitdown
signal AHSHITDAMAGE
signal wegood

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("moveup"):
		position.y -= speed
		emit_signal("is_moving")
	if Input.is_action_pressed("movedown"):
		position.y += speed
		emit_signal("is_moving")
	if Input.is_action_pressed("moveleft"):
		position.x -= speed
		emit_signal("is_moving")
	if Input.is_action_pressed("moveright"):
		position.x += speed
		emit_signal("is_moving")
	if Input.is_action_just_pressed("place"):
		if $Timer.available == true:
			if position.distance_to(get_global_mouse_position()) < 200:
				emit_signal("putitdown")
				var tower = tower1.instantiate()
				owner.add_child(tower)
				tower.z_index = -1
				tower.position = get_global_mouse_position()
	move_and_slide()
	if touchingenemy == true:
		health -= 0.5
		emit_signal("AHSHITDAMAGE")
		if health <= 0:
			get_tree().reload_current_scene()
				


func _on_area_2d_area_entered(area):
	if area.is_in_group("enemies"):
		touchingenemy = true


func _on_area_2d_area_exited(area):
	if area.is_in_group("enemies"):
		emit_signal("wegood")
		touchingenemy = false
