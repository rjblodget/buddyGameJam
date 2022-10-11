extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$OneWays/OneWay/OneWayBox.frame = 2
	$OneWays/OneWay2/OneWayBox.frame = 4


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LevelTimer_timeout():
	get_tree().change_scene("res://level2.tscn")
