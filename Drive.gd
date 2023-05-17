extends KinematicBody2D

var speed = 1250
var rotation_speed = 4

var velocity = Vector2.ZERO
var rotation_dir = 0

var canPick = true

func get_input():
	rotation_dir = 0
	velocity = Vector2.ZERO
	if Input.is_action_pressed('clockwise_red'):
		rotation_dir += 1
	if Input.is_action_pressed('counter_clockwise_red'):
		rotation_dir -= 1
	if Input.is_action_pressed('reverse_red'):
		velocity -= transform.x * speed
	if Input.is_action_pressed('forward_red'):
		velocity += transform.x * speed

func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)
	
