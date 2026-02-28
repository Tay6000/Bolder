extends Node2D

var Level_1 = preload("res://Levels/l_1.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Cutscene_sprites.play("default")
	await get_tree().create_timer(1).timeout
	get_tree().root.add_child(Level_1.instantiate())
	get_node("/root/Open").free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _add_scene_manually():
	get_tree().root.add_child(Level_1)
