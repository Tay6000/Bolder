extends CharacterBody2D
class_name Player

@export var SPEED = 200.0
@export var JUMP_VELOCITY = -330.0
@onready var level1 = preload("res://Levels/l_1.tscn")

var encounters = []

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("moveLeft", "moveRight")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_test_encounter_body_entered(body: Node2D) -> void:
	if body is Player:
		self.get_parent().get_parent().start_combat()
