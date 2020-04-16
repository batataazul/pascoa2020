extends Node2D

onready var play_button = $PlayButton
onready var quit_button = $QuitButton

func _ready():
	play_button.connect("button_down",self,"on_play_down")
	quit_button.connect("button_down",self,"on_quit_down")

func on_play_down():
	get_tree().change_scene("res://levels/Level1.tscn")

func on_quit_down():
	get_tree().quit()
