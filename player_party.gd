extends Node2D


@export var players: Array = []
@export var index : int = 0
@onready var john = preload("res://chara/basil.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	players = get_children()
	for i in players.size():
		players[i].position = Vector2(0, i*180)
		players[i].is_player = true



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _add_chara(newChar):
	add_child(newChar)

func _load_party(player1 : int, player2 : int):
	var list = [player1, player2]
	for player in list:
		if player == 0:
			continue
		if player == 1:
			john.is_player = true
			_add_chara(john)
