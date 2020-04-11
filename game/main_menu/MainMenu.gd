extends Node2D

var lixo = 0
onready var play_button = $PlayButton
onready var quit_button = $QuitButton

func _ready():
	play_button.connect("button_down",self,"on_play_down")
	quit_button.connect("button_down",self,"on_quit_down")
	

func on_play_down():
	lixo = get_tree().change_scene("res://levels/Level1.tscn")
	pass

func on_quit_down():
	get_tree().quit()
	pass

