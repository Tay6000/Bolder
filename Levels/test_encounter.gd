extends Area2D

@onready var enemies = preload("res://parties/enemy_party.tscn").instantiate()
@onready var players = preload("res://parties/player_party.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
