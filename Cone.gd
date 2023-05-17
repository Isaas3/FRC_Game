extends RigidBody2D

var picked_red = false
var picked_blue = false

func _physics_process(delta):
	if picked_red == true:
		self.position = get_node("../Player/Position2D").global_position
	elif picked_blue == true:
		self.position = get_node("../Player2/Position2D").global_position


func _input(event):
	if Input.is_action_just_pressed("grab_red"):
		var bodies = $Area2D.get_overlapping_bodies()
		for body in bodies:
			if body.name == "Player" and get_node("../Player").canPick == true:
				picked_red = true
				get_node("../Player").canPick = false
	elif Input.is_action_just_pressed("grab_blue"):
		var bodies = $Area2D.get_overlapping_bodies()
		for body in bodies:
			if body.name == "Player2" and get_node("../Player2").canPick == true:
				picked_blue = true
				get_node("../Player2").canPick = false

	if Input.is_action_just_pressed("release_red") and picked_red == true:
		picked_red = false
		get_node("../Player").canPick = true
	elif Input.is_action_just_pressed("release_blue") and picked_blue == true:
		picked_blue = false
		get_node("../Player2").canPick = true
