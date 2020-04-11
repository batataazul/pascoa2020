extends Node2D


onready var play_button = $PlayButton

func _ready():
	play_button.connect("button_down",self,"on_play_down")

func on_play_down():
	get_tree().change_scene("res://scenes/Level1.tscn")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
