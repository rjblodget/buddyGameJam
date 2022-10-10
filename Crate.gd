extends KinematicBody2D


onready var ray = $BoxRay
var inputs = {
	'ui_up': Vector2.UP,
	'ui_down': Vector2.DOWN,
	'ui_left': Vector2.LEFT,
	'ui_right': Vector2.RIGHT
}
var gridSize = 16
var speed = 2.0



func move(dir, delta):
	var distance = inputs[dir] * (gridSize/2)
	ray.cast_to = distance
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += distance * speed * delta
		return true
	return false

func checkDirection(dir):
	if dir == 'ui_right' and $OneWayBox.frame == 1:
		return true
	elif dir == 'ui_left' and $OneWayBox.frame == 2:
		return true
	elif dir == 'ui_up' and $OneWayBox.frame == 3:
		return true
	elif dir == 'ui_down' and $OneWayBox.frame == 4:
		return true
	else:
		return false
