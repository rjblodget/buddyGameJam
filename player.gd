extends KinematicBody2D

onready var ray = $playerRay
var speed = 2
var inputs = {
	'ui_up': Vector2.UP,
	'ui_left': Vector2.LEFT,
	'ui_down': Vector2.DOWN,
	'ui_right': Vector2.RIGHT
}
var gridSize = 16
var rotateCount = 0
var curDir = 'ui_left'
var oldPosition = 0

func _process(delta):
	for dir in inputs.keys():
		if Input.is_action_just_pressed(dir):
			curDir = dir
			rotateCount = 0
	move(curDir, delta)



func move(dir, delta):
	var distance = inputs[dir] * (gridSize/2)
	
	ray.cast_to = distance
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += distance * speed * delta
		if position.distance_to(oldPosition) > gridSize:
			rotateCount = 0
	else:
		var collider = ray.get_collider()
		if collider.is_in_group('box'):
			if collider.move(dir, delta):
				position += distance * speed * delta
			else:
				rotate(dir)
		elif collider.is_in_group('Wall'):
			rotate(dir)
		elif collider.is_in_group('OneWay'):
			if collider.checkDirection(dir):
				position += distance * speed * delta
			else:
				rotate(dir)

func rotate(dir):
	if rotateCount == 0:
		oldPosition = position
	
	rotateCount += 1
	if rotateCount == 4:
		get_parent().get_node("YouWin!").visible = true
		get_parent().get_node("LevelTimer").start()
	if dir == 'ui_up':
		curDir = 'ui_right'
	elif dir == 'ui_right':
		curDir = 'ui_down'
	elif dir == 'ui_down':
		curDir = 'ui_left'
	else:
		curDir = 'ui_up'
