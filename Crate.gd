extends KinematicBody2D


onready var ray = $BoxRay
var inputs = {
	'ui_up': Vector2.UP,
	'ui_down': Vector2.DOWN,
	'ui_left': Vector2.LEFT,
	'ui_right': Vector2.RIGHT
}
var gridSize = 16



func move(dir):
	var distance = inputs[dir] * gridSize
	ray.cast_to = distance
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += distance
		return true
	return false
