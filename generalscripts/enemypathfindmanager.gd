extends Node2D

@onready var player = $Character
@export var level = 1
var save_path = "user://LD55gameyoudowloadedisavingdatadontbeafraid/level.save"
var file = FileAccess.open("user://LD55gameyoudowloadedisavingdatadontbeafraid/level.save", FileAccess.READ)



# Called when the node enters the scene tree for the first time.
func _ready():
	print(level)
	#var prog = get_node("TextureProgressBar")
	#prog.nextlevelyall.connect(next_level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_tree().call_group("enemies", "update_target_location", player.global_transform.origin)


func save_score():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(level)
	
func load_score():
	if FileAccess.file_exists(save_path):
		print("file found")
		var file = FileAccess.open(save_path, FileAccess.READ)
		level = file.get_var()
	else:
		print("file not found")
		level = 0
		
func next_level():
	if level == 1:
		get_tree().change_scene_to_file("res://scenes/transition.tscn")


func _on_node_2d_wakeup():
	if level == 1:
		get_tree().change_scene_to_file("res://scenes/lv2.tscn")
	if level == 2:
		get_tree().change_scene_to_file("res://scenes/lvl3.tscn")
	if level == 3:
		get_tree().change_scene_to_file("res://scenes/credits.tscn")
