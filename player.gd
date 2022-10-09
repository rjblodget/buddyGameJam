extends KinematicBody2D

onready var ray = $playerRay
var speed = 0.25
var inputs = {
	'ui_up': Vector2(0, -speed),
	'ui_left': Vector2(-speed, 0),
	'ui_down': Vector2(0, speed),
	'ui_right': Vector2(speed, 0)
}
var gridSize = 16
var curDir = 'ui_left'

func _process(delta):
	for dir in inputs.keys():
		if Input.is_action_just_pressed(dir):
			curDir = dir
	move(curDir)



func move(dir):
	var distance = (inputs[dir] * gridSize)
	
	ray.cast_to = distance
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += distance
	else:
		var collider = ray.get_collider()
		if collider.is_in_group('box'):
			if collider.move(dir):
				position += distance
			else:
				rotate(dir)
		else:
			rotate(dir)

func rotate(dir):
	if dir == 'ui_up':
		curDir = 'ui_right'
	elif dir == 'ui_right':
		curDir = 'ui_down'
	elif dir == 'ui_down':
		curDir = 'ui_left'
	else:
		curDir = 'ui_up'
