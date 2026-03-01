extends Node2D

@onready var enemies = preload("res://parties/enemy_party.tscn").instantiate()
@onready var players = preload("res://parties/player_party.tscn").instantiate()
@onready var battleScene = preload("res://BattleScene.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AudioStreamPlayer2D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func start_combat():
	enemies.encounter = [1, 0]
	players.encounter = [1, 0]
	_add_scene_manually()
	get_node("/root/L1").queue_free()

func _add_scene_manually():
	battleScene = preload("res://BattleScene.tscn")
	get_tree().root.add_child(battleScene.instantiate())
