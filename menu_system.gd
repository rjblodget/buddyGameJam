extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartGame_button_up():
	get_tree().change_scene("res://game.tscn")


func _on_Options_button_up():
	get_tree().change_scene("res://options.tscn")


func _on_Credits_button_up():
	get_tree().change_scene("res://credits.tscn")


func _on_Licences_button_up():
	get_tree().change_scene("res://licenses.tscn")
