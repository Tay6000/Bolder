extends Node2D

@export var enemies: Array = []
@export var index : int = 0

@onready var slime = preload("res://chara/slime.tscn").instantiate()
@onready var Bowlder = preload("res://chara/bowlder.tscn").instantiate()
@onready var spider = preload("res://chara/spider.tscn").instantiate()

var encounter = [1, 0]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	slime.is_player = false
	_add_chara(slime)
	enemies = get_children()
	for i in enemies.size():
		enemies[i].position = Vector2(0, i*180)
		enemies[i].is_player = false
		enemies[i].flip_visual = true
		enemies[i].opponents = get_parent().get_node("PlayerParty")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _add_chara(newChar):
	add_child(newChar)

func _load_party(list : Array):
	for enemy in list:
		if enemy == 0:
			continue
		if enemy == 1:
			slime.is_player = false
			_add_chara(slime)
		if enemy == 2:
			Bowlder.is_player = false
			_add_chara(Bowlder)
		if enemy == 3:
			spider.is_player = false
			_add_chara(spider)
